//
//  ImageUploader.swift
//  Instagram
//
//  Created by Edgar Vergara on 15/08/23.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImages(bucket: String, image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/\(bucket)/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            
            return url.absoluteString
        } catch {
            print("DEBUG: failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
