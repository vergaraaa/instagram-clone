//
//  ProfileView.swift
//  Instagram
//
//  Created by Edgar Vergara on 07/08/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
            ScrollView {
                VStack {
                    // header
                    ProfileHeaderView(user: user)
                    
                    // post grid view
                    PostGridView(user: user)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
