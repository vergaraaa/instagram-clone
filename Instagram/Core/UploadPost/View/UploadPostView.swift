//
//  UploadPostView.swift
//  Instagram
//
//  Created by Edgar Vergara on 10/08/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @Environment(\.dismiss) var dismiss
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var uploadPostVM = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await uploadPostVM.uploadPost(caption:caption)
                        clearPostDataAndReturnToFeed()
                        dismiss()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // post image and caption
            HStack(spacing: 10 ) {
                if let image = uploadPostVM.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(
            isPresented: $imagePickerPresented,
            selection: $uploadPostVM.selectedImage
        )
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
        uploadPostVM.selectedImage = nil
        uploadPostVM.postImage = nil
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
