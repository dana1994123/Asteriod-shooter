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
            ZStack{
                Image("bg").resizable().frame(width: 980, height: 460, alignment: .center)
                VStack{
                    Text("GET READY FOR").modifier(Header2())
                    ZStack{
                        Image("game").resizable().frame(width: 500, height:570, alignment: .center)
                        Image("logo").resizable().frame(width: 900, height:300, alignment: .center)
                    }.frame(width: 1000, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        NavigationLink(destination: ScoreBoard() ){
                            Text("score Board").modifier(AppButtonModifier())
                        }
                        NavigationLink(destination: ScoreBoard() ){
                            Text("Start the Game").modifier(AppButtonModifier())
                        }
                        NavigationLink(destination: ScoreBoard() ){
                            Text("Start the Game").modifier(AppButtonModifier())
                        }
                    }//vstack2
            
                }//vstack
            }//zstack
            .navigationBarHidden(true)
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
                              }
            
                              

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
