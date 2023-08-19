//
//  FeedView.swift
//  Instagram
//
//  Created by Edgar Vergara on 07/08/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var feedVM = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 30) {
                    ForEach(feedVM.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 10)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("instagram_logo_black")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 32)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
