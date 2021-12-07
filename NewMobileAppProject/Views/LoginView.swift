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
    @State private var error : String = ""
    @State private var checkingUser = false
    @State private var input = false
    
    
    @EnvironmentObject var fireDBHelper : FireDBHelper
    
    let verticalPadding = 40.0
    
    var body: some View {
        NavigationView{
            
        
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
                HStack{
                    Text("\(self.error)").modifier(Error())
                }
                List{
                                    ForEach(self.fireDBHelper.scoreLit.enumerated().map({$0}), id : \.element.self){index, currentScore in
                                        Text(currentScore.userName)
                                        Text(String(currentScore.score))
                
                                    }
                                }
                
                
                
                
                    Button(action:{
                        //do the checking and then lookup the firebase and then validate the user then navigate to the HomeUIVIew
                        
                        self.input = self.checking()
                        //lookup the firebase
                        
                       
                        
//                        ForEach(self.fireDBHelper.scoreLit.enumerated().map({$0}), id : \.element.self){index, currentScore in
////                            if currentScore.userName == self.username && currentScore.password == self.password {
////                                Text("jbnjk.nm")
////                                NavigationLink(destination: HomeUIView()){
////                                    Text("Login")
////
////
////                //                        if(self.checking()){
////                                }.modifier(AppButtonModifier())
////                                //self.input = true
//
////                            }
//                            Text(currentScore.userName).foregroundColor(.red)
//                        }
                        
                        
                        
                    }){
                        Text("Login")
                    }.modifier(AppButtonModifier())
                    
                    
                
                    
                    
            }.onAppear(perform: {
                self.checkingUser = false
            })
                
                
                
            
            
            
        }//zstack
        }.navigationViewStyle(StackNavigationViewStyle())//navigationview
        
        
        
    }
    
    
    func checking() -> Bool{
        if(self.username.isEmpty || self.password.isEmpty){
            //we need to inform the user
            self.error = "Please Enter both name and password"
            
            return false
        }
        else{
            self.checkingUser = true
            self.error = ""
            return true
        }
    }//checking func
}





