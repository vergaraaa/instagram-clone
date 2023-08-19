//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by Edgar Vergara on 08/08/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registrationVM: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            
            Text("You'll use this username to sign into your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            TextField("Username", text: $registrationVM.username)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreatePasswordView()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 45)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
            .environmentObject(RegistrationViewModel())
    }
}
