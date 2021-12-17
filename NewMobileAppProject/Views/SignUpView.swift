//
//  SignUpView.swift
//  NewMobileAppProject
//
//  Created by Roop Malhans on 2021-12-07.
//

import SwiftUI
import Firebase

struct SignUpView: View {

    
    // State variables used in the form
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var error : String = ""
    @State private var score : Int =  0
    @State private var checkingUser = false
    @State private var isShowingHomeView = false

    let verticalPadding = 40.0
    var body: some View {
        NavigationView{
        ZStack
               {
            /* ScrollView helps to scroll the screen when working in landscape mode ,
             user can just scroll upwards on the screen to see the whole screen*/
                   ScrollView{
               VStack(spacing: CGFloat(verticalPadding)) {
                   Text("Asteroid Shooter").modifier(Header1())
                       

                   HStack {
                       Image(systemName: "person")
                           .foregroundColor(.secondary)
                       TextField("Enter your name", text: $username)
                           .autocapitalization(.none)
                       

                   }.modifier(TextFieldModifier())
                   HStack {
                       Image(systemName: "folder")
                           .foregroundColor(.secondary)
                       TextField("Enter your Email", text: $email)
                           .autocapitalization(.none)

                   }.modifier(TextFieldModifier())
                   
                   HStack {
                       Image(systemName: "key")
                           .resizable()
                           .frame(width: 16.0, height: 20.0) .foregroundColor(.secondary)
                       SecureField("Enter password", text: $password)
                           .autocapitalization(.none)
                   }.modifier(TextFieldModifier())
                   HStack {
                       Image(systemName: "key")
                           .resizable()
                           .frame(width: 16.0, height: 20.0) .foregroundColor(.secondary)
                       //add a secure text feild suitable for the password
                       SecureField("Confirm password", text: $confirmPassword)
                           .autocapitalization(.none)
                   }.modifier(TextFieldModifier())
                   
                   
                /* Placeholder to display the error message, if any occurs*/
                   
                   Text("\(self.error)").modifier(Error())
                   
                   
                   HStack{
                       Text("Already have an account? ")
                       NavigationLink(destination: LoginView()){
                           Text("Login")
                   }
                       

               }
                   NavigationLink(destination: HomeUIView(), isActive: $isShowingHomeView) { EmptyView() }
                   
                   /* On the click of the button all the error checking will be performed
                    if successful -> navigate to the home page
                    if not successful -> show a prompt to the user with the error message*/
                   Button(action:{
                       if(self.checking()){
                      // AddInfo(UserName: username, Email: email, Password: password, ConfirmPassword: confirmPassword)
                    self.isShowingHomeView = self.AddInfo(UserName: username, Email: email, Password: password, ConfirmPassword: confirmPassword,Score: score)

                       }
                   })
                   {
                       Text("Register")
                   }.modifier(AppButtonModifier()).padding(.bottom , 90)
                
                   
               }.onAppear(perform: {
                   self.checkingUser = false
               })
               }
               }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
    /* this method is updating the USer Info to cloud Firestore into the "Scores" collection the data will
     be saved in a JSON format with key-value pairs*/
    
    func AddInfo(UserName: String, Email: String, Password: String, ConfirmPassword: String, Score: Int) -> Bool{
        let db = Firestore.firestore()
        db.collection("Scores").document().setData(["userName": UserName, "email": Email, "password": Password, "confirmPassword": ConfirmPassword, "score" : Score])
        return true
    }
    
    /* Error Checking
     checking() checks some of the possible errors that could occur
     for example, password and confirm password do not match or user leaves any of the information empty, in that
     case user will not be allowed to navigate to the next page unless corrext information is not added
     */
    
    func checking() -> Bool{
        if(self.username.isEmpty || self.email.isEmpty || self.password.isEmpty || self.confirmPassword.isEmpty){
            self.error = "Please enter the required information"
            return false
        }
        else if (self.password != self.confirmPassword)
        {
            self.error = "Both Passwords should match"
            return false
        }
        else{
            self.checkingUser = true
            self.error = ""
            return true
        }
    }
    
    
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
