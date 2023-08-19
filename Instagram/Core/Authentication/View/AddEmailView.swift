//
//  AddEmailView.swift
//  Instagram
//
//  Created by Edgar Vergara on 08/08/23.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registrationVM: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            
            Text("You'll use this email to sign into your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            TextField("Email", text: $registrationVM.email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreateUsernameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
            .environmentObject(RegistrationViewModel())
    }
}
