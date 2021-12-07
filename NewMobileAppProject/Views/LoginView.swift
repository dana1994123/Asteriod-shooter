//
//  LoginView.swift
//  NewMobileAppProject
//
//  Created by Ryan Haire on 2021-12-06.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    let verticalPadding = 40.0
    
    var body: some View {
        ZStack {
//            RadialGradient(gradient: Gradient(colors: [.blue, .gray]), center: .center, startRadius: 100, endRadius: 470)
            VStack(spacing: CGFloat(verticalPadding)) {
                Text("Asteroid Shooter").modifier(Header1())
//                    .font(.title)
//                    .foregroundColor(Color.black)
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Enter your name", text: $username)
//                        .foregroundColor(Color.white)
                }.modifier(TextFieldModifier())
//                .padding()
//                .background(Color("yellowCus"))
//                .cornerRadius(10)
                
                HStack {
                    Image(systemName: "key")
                        .resizable()
                        .frame(width: 16.0, height: 20.0) .foregroundColor(.secondary)
                    SecureField("Enter password", text: $password)
//                        .foregroundColor(Color.white)
                }.modifier(TextFieldModifier())
//                .padding()
//                .background(Color("yellowCus"))
//                .cornerRadius(10)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Login")
                        .padding()
                    
                }.modifier(AppButtonModifier())
//                .background(Color.black)
//                .foregroundColor(Color.white)
//                .cornerRadius(10)
                
            }.padding(.horizontal, CGFloat(verticalPadding))
            
        }
    };
}

