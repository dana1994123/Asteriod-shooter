//
//  ScoreBoard.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-16.
//

import SwiftUI

struct ScoreBoard: View {
    @EnvironmentObject var fireDbHelper : FireDBHelper
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.onAppear(){
            //whenever the vstack is loaded we call the function to get all scores from our firestore
            self.fireDbHelper.getAllScore()
        }
        
    }
}

struct ScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoard()
    }
}
