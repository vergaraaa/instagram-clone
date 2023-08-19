//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Edgar Vergara on 09/08/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                
                HStack(spacing: 10) {
                    UserStatView(value: 13, title: "Posts")
                    
                    UserStatView(value: 10, title: "Followers")
                    
                    UserStatView(value: 5, title: "Following")
                }
            }
            .padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 5) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            Button {
                if (user.isCurrentUser) {
                    showEditProfile.toggle()
                }
                else {
                    
                }
            } label: {
                Text(user.isCurrentUser ? "Edit profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    }
            }

            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
