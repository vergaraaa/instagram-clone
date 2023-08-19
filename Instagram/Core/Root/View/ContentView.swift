//
//  ContentView.swift
//  Instagram
//
//  Created by Edgar Vergara on 07/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var contentVM = ContentViewModel()
    @StateObject var registrationVM = RegistrationViewModel()
    
    var body: some View {
        Group {
            if (contentVM.userSession == nil) {
                LoginView()
                    .environmentObject(registrationVM)
            }
            else if let currentUser = contentVM.currentUser {
                MainTabView(user: currentUser)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
