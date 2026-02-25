//
//  AuthView.swift
//  SwiftApp
//
//  Created by macos on 14/2/26.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel()
    @State private var email = ""
    @State private var password = ""

var body: some View {
    VStack {
        if viewModel.isSignedIn {
            FContentView()                       // show Firestore content
        } else {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack {
                Button("Sign In") {
                    viewModel.signIn(email: email, password: password)
                }
                Button("Sign Up") {
                    viewModel.signUp(email: email, password: password)
                }
            }
        }
    }
    .padding()
}
}
