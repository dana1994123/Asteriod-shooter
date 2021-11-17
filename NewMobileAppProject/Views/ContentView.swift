//
//  ContentView.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-11.
//

import SwiftUI

struct ContentView: View {
    @State var textEdit : String = ""
    var body: some View {
        VStack{
            //all the modifier are under modifier Group
            Text("I'm title 1").modifier(Header1())
            Text("I'm title 2").modifier(Header2())
            Text("I'm title 3").modifier(Header3())
            Text("Error").modifier(Error())
            VStack{
                TextField( "Enter your Name" , text: self.$textEdit).modifier(TextFieldModifier())
                Button(action:{
                    print("click me")
                }){
                    Text("Click").modifier(MainAppButtonModifier())
                }
                Button(action:{
                    print("click me")
                }){
                    Text("Click 2").modifier(AppButtonModifier())
                }
                
                
            }//vstack
        }//hstack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
