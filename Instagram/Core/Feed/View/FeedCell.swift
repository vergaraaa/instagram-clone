//
//  FeedCell.swift
//  Instagram
//
//  Created by Edgar Vergara on 07/08/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            // profile pic and username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                
                Spacer()
            }
            .padding(.horizontal, 10)
            
            // post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // action buttons
            HStack(spacing: 15) {
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large )
                }
                
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large )
                }
                
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large )
                }

                
                Spacer()
            }
            .padding(.top, 5)
            .padding(.horizontal, 10)
            .foregroundColor(.black)
            
            // likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 1)
                .padding(.horizontal, 10)
            
            // caption label
            HStack {
                Text("\(post.user?.username ?? "") ")
                    .fontWeight(.semibold)
                +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .padding(.top, 1)
            
            
            Text("6 hrs ago")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 1)
                .padding(.horizontal, 10)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
