//
//  RegistrationView.swift
//  Threads
//
//  Created by Pooja4 Bhagat on 12/07/25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("threads-logo")
                .resizable()
                .renderingMode(.template)
                .frame(width: 120, height: 120)
                .foregroundColor(.primary)
                .padding()
            
            VStack {
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
                
                TextField("Enter your email", text: $viewModel.email)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                print("Sign Up Tapped.")
                Task { try await viewModel.createUser() }
                dismiss()
            } label: {
                Text("Sign up")
                    .modifier(ThreadsButtonModifier(font: .subheadline  ,fontWeight: .semibold, width: 353, height: 44, cornerRadius: 8))
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.primary)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}

/* @Environment(\.dismiss) gives your view access to the system’s dismiss function, which you can call to close the current screen (like a sheet or pushed view).
 Use dismiss() to programmatically close the view.
 
 @Environment(\.dismiss) var dismiss
 
 @Environment is a property wrapper that gives your view access to a value from the SwiftUI environment.
 \.dismiss is a key path to a built-in environment value — the dismiss action.
 var dismiss is your local reference to the dismiss function.
 
 So basically:
 You're injecting the built-in SwiftUI dismiss function from the environment into your view.
 This will dismiss the current view if it was presented modally.
 */
