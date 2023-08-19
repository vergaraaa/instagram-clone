//
//  IGTextFieldModifier.swift
//  Instagram
//
//  Created by Edgar Vergara on 08/08/23.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 25)
    }
}
