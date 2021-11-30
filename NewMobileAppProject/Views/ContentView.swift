//
//  ContentView.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-11.
//

import SwiftUI

struct ContentView: View {
    @State var textEdit : String = ""
    @EnvironmentObject var fireDBHelper : FireDBHelper
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
                    self.addScore()
                }){
                    Text("Click").modifier(MainAppButtonModifier())
                }
                Button(action:{
                    print("click me")
                }){
                    Text("Click 2").modifier(AppButtonModifier())
                }
                List{
                    ForEach(self.fireDBHelper.scoreLit.enumerated().map({$0}), id : \.element.self){index, currentScore in
                        Text(currentScore.name)
                        Text(String(currentScore.score))
                        
                    }
                }
                
                
            }//vstack
        }.onAppear(){
            self.fireDBHelper.getAllScore()
        }//hstack
    }
    private func addScore (){
        print("adding scores to the firebase")
        self.fireDBHelper.insertScore(newScore: Score(name: "Dana Aljamal", score: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
