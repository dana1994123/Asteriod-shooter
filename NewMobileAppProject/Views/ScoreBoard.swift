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
            self.fireDbHelper.getAllScore()
        }
        
    }
}

struct ScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoard()
    }
}
