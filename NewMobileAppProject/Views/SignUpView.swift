//
//  SignUpView.swift
//  NewMobileAppProject
//
//  Created by Roop Malhans on 2021-12-07.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    let verticalPadding = 40.0
    var body: some View {
        ZStack
               {
               VStack(spacing: CGFloat(verticalPadding)) {
                   Text("Asteroid Shooter").modifier(Header1())

                   HStack {
                       Image(systemName: "person")
                           .foregroundColor(.secondary)
                       TextField("Enter your name", text: $username)

                   }.modifier(TextFieldModifier())
                   HStack {
                       Image(systemName: "folder")
                           .foregroundColor(.secondary)
                       TextField("Enter your Email", text: $email)

                   }.modifier(TextFieldModifier())
                   
                   HStack {
                       Image(systemName: "key")
                           .resizable()
                           .frame(width: 16.0, height: 20.0) .foregroundColor(.secondary)
                       SecureField("Enter password", text: $password)
                   }.modifier(TextFieldModifier())
                   HStack {
                       Image(systemName: "key")
                           .resizable()
                           .frame(width: 16.0, height: 20.0) .foregroundColor(.secondary)
                       SecureField("Confirm password", text: $confirmPassword)
                   }.modifier(TextFieldModifier())
                   
                   HStack{
                       Text("Already have an account? ")
                       NavigationLink(destination: LoginView()){
                           Text("Login")
                   }

               }
               }
               }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
