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
    
    @State private var isShowingHomeView = false
    
    
    @EnvironmentObject var fireDBHelper : FireDBHelper
    
    let verticalPadding = 40.0
    
    var body: some View {
        NavigationView{
        ZStack {

            VStack(spacing: CGFloat(verticalPadding)) {
                Text("LogIn").modifier(Header1()).padding(.top , 60)

                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Enter your name", text: $username)

                }.modifier(TextFieldModifier())

                HStack {
                    Image(systemName: "key")
                        .resizable()
                        .frame(width: 16.0, height: 20.0) .foregroundColor(.secondary)
                    SecureField("Enter password", text: $password)
//                        .foregroundColor(Color.white)
                }.modifier(TextFieldModifier())

                VStack{
                    
                    Text("\(self.error)").modifier(Error())
                    HStack{
                        Text("Don't have an account? ")
                                           NavigationLink(destination: SignUpView()){
                                               Text("Sign Up")
                                           }
                    }
                    
                }.frame(width: 300, height: 5, alignment: .center)
                NavigationLink(destination: HomeUIView(), isActive: $isShowingHomeView) { EmptyView() }
                Button(action:{
                    //do the checking and then lookup the firebase and then validate the user then navigate to the HomeUIVIew
                    
                    if(self.checking()){
                        //lookup the firebase
                        self.isShowingHomeView = self.lookupDataBase()
                    }
                }){
                    Text("Login")
                }.modifier(AppButtonModifier()).padding(.bottom , 90)
                
                    
            }.onAppear(perform: {
                self.fireDBHelper.getAllScore()
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
    
    
    func lookupDataBase () -> Bool{
        
//we need to iterate through the list and then it is is matching our record we will return true and navigate
        for n in self.fireDBHelper.scoreLit {
            if (n.userName == self.username && n.password == self.password ){
                print(#function)
                return true
            }
            else{
                print(n.userName)
            }
        }
        return false
            }
}
