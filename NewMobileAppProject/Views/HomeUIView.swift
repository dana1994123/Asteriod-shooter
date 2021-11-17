//
//  HomeUIView.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-16.
//

import SwiftUI

struct HomeUIView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: ScoreBoard() ){
                Text("score Board")
            }
            NavigationLink(destination: ScoreBoard() ){
                Text("Start the Game")
            }
            
        }
    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
