//
//  PlayInstructions.swift
//  NewMobileAppProject
//
//  Created by Jashanpreet Singh on 2021-12-12.
//

import SwiftUI

struct Instruction : Hashable{
    var title = ""
    var inst = ""
}
//a class that has an observable property to be used across the Iphone & watch app 
class ImagesInstruction : ObservableObject{
    @Published var images = [Instruction(
        title: "How to Win?",inst: "Try to shoot as many Aliens\n  as you can.\n Score more than 500 to win:)"),
      Instruction(title: "Be Careful!", inst: "There is a Time limit \n If you score less than 500 Aliens\n  in  30 seconds You will Lose:("),
      Instruction(title: "Points",inst: "Gain 10 points if you kill Alien,\n Don't worry if You miss wont lose anything")]
}
//Struct declaration
struct PlayInstructions: View{
    @EnvironmentObject var images : ImagesInstruction
//    private let images = [Instruction(
//                            title: "How to Win?",inst: "Try to shoot as many Aliens\n  as you can.\n Score more than 500 to win:)"),
//                          Instruction(title: "Be Careful!", inst: "There is a Time limit \n If you score less than 500 Aliens\n  in  30 seconds You will Lose:("),
//                          Instruction(title: "Points",inst: "Gain 10 points if you kill Alien,\n Don't worry if You miss wont lose anything")]
    var body: some View{
        ZStack{
            //adding background image and fading it 
            Image("bgGame").resizable().opacity(0.30).frame(width: 1000, height: 410, alignment: .center)
            VStack{
                TabView{
                    ForEach(images.images, id: \.self) { item in
                         //3
                        CustomInstruction(item  : item)
                    }//foreach
                    
                    .navigationBarTitle("Game Instruction")
                }//tabview
                .tabViewStyle(PageTabViewStyle())
                
            }
            
        }
       
            
        
    }
}

struct PlayInstructions_Previews : PreviewProvider{
    static var previews: some View{
        PlayInstructions()
    }
}


//Customizing it to give better view
struct CustomInstruction : View{
    var item : Instruction
    var body: some View{
        ZStack{
            
            
            VStack{
                Text(item.title).font(.title).padding(.trailing , 30).foregroundColor(.black)
                Text(item.inst).font(.headline).padding(.trailing , 30).foregroundColor(.red)
                    .shadow(color:.yellow, radius:2,x:0,y: 2)
                    

            }
        }
        
        
    }
    
}





