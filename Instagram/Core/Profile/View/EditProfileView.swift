//
//  EditProfileView.swift
//  Instagram
//
//  Created by Edgar Vergara on 14/08/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var editProfileVM : EditProfileViewModel
    
    init(user: User) {
        self._editProfileVM = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                
                Spacer()
                
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await editProfileVM.updateUserData()
                        dismiss()
                    }
                } label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // update photo
            PhotosPicker(selection: $editProfileVM.selectedImage) {
                VStack {
                    if let image = editProfileVM.profileImage {
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }
                    else {
                        CircularProfileImageView(user: editProfileVM.user, size: .medium)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 10)
            
            // edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $editProfileVM.fullName)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $editProfileVM.bio)
            }
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    
    let title: String
    let placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 10)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 35)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}
