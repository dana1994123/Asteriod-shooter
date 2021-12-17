//
//  ContentView.swift
//  NewMobileAppProject WatchKit Extension
//
//  Created by dana on 2021-11-11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var about =  GetData()
    @State var showSheet = false
    @EnvironmentObject var images : ImagesInstruction
    @State var bio = ""
    var body: some View {
        ScrollView{
            
            VStack{
                
           
            HStack{
                Text("About us!").foregroundColor(.orange).font(.title)
                Image("game")
                    .resizable()
                    .frame(width: 47.0, height: 30.0) .foregroundColor(.secondary)
            }//hstack
            VStack{
                //use the data that has been saved in the cpanel
                ForEach(about.people, id: \.self){ p in
                    Text("\(p.Name)").foregroundColor(.blue)
                    Text("\(p.Bio)").font(.footnote).padding()
                    Text("")
                }
                Spacer()
                
                Button(action:{
                    self.showSheet = true
                    
                }){
                    Text("Game Instruction").modifier(AppButtonModifier()).background(Color.orange)
                    
                    //show sheet when the user click the button and show the instruction there
                }.sheet(isPresented: self.$showSheet){
                    VStack{
                        ScrollView{
                            ForEach(images.images, id: \.self) { item in
                                 //3
                                    Text(item.title).font(.title).padding(.trailing , 30).foregroundColor(.black)
                                    Text(item.inst).font(.headline).padding(.trailing , 30).foregroundColor(.blue)
                            }//foreach
                            Text("Enjoy!").foregroundColor(.orange).padding().font(.title)
                        }//s
                        
                    }
                }
            }
                
            }//vstackmain
        }//scrollView
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

