//
//  LoginView.swift
//  Instagram
//
//  Created by Edgar Vergara on 08/08/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginVM = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // logo image
                Image("instagram_logo_black")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                // text fields
                VStack {
                    TextField("Enter your email", text: $loginVM.email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Password", text: $loginVM.password)
                        .modifier(IGTextFieldModifier())
                }
                
                // forgot pasword button
                Button {
                    print("forgot password")
                } label: {
                    Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 25)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task { try await loginVM.signIn() }
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 45)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                // or
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                // facebook log in
                HStack {
                    Image("facebook_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 10)
                
                Spacer()
                
                Divider()
                
                // Navigation link
                NavigationLink {
                    AddEmailView()
                } label: {
                    HStack {
                        Text("Don't have an account? ")
                        +
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 15)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
