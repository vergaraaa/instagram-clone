//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by Edgar Vergara on 08/08/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registrationVM: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Create password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            
            Text("Your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            SecureField("Password", text: $registrationVM.password)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CompleteSignUpView()
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
            .environmentObject(RegistrationViewModel())
    }
}
