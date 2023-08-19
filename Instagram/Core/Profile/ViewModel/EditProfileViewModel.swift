//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Edgar Vergara on 14/08/23.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    @Published var profileImage: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var fullName: String = ""
    @Published var bio: String = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullName = user.fullName {
            self.fullName = fullName
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        // update profile image if changed
        if let uiImage = uiImage {
            let imageUrl = try await ImageUploader.uploadImages(bucket: "profile_images",image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // update name if changed
        if (!fullName.isEmpty && user.fullName != fullName) {
            data["fullName"] =  fullName
        }
        
        // update bio if changed
        if (!bio.isEmpty && user.bio != bio) {
            data["bio"] = bio
        }
        
        if (!data.isEmpty) {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
