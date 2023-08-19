//
//  CompleteSignUpView.swift
//  Instagram
//
//  Created by Edgar Vergara on 08/08/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registrationVM: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Welcome to instagram, \(registrationVM.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            
            Text("Click below to complete registration and start using Instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Button {
                Task { try await registrationVM.createUser() }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 45)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
        }
        .padding()
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

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
            .environmentObject(RegistrationViewModel())
    }
}
