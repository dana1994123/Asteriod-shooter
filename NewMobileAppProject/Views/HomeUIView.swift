//
//  HomeUIView.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-16.
//

import SwiftUI

var images : [UIImage]! = [UIImage(named: "gameText")!, UIImage(named: "spaceAround")!]
struct picanimation: UIViewRepresentable {
    //animated two picture to create dynamic look to the game
    let animatedImage = UIImage.animatedImage(with: images, duration: 3)
    func makeUIView(context: Self.Context) -> UIView {
        let someView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        let someImage = UIImageView(frame: CGRect(x: 50, y: 0, width: 930, height: 460))
        someImage.image = animatedImage
        someView.addSubview(someImage)
        return someView
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<picanimation>) {
    }
}
struct HomeUIView: View {
    //instance of the colors class that has some added custom color to the resources
    let colors = Colors()
    var body: some View {
        NavigationView{
            ZStack{
                //added background
                Image("bg2").resizable().frame(width: 980, height: 460, alignment: .center)
                //call the animated images struc in the zscore
                picanimation()
                    VStack{
                        Image("rock").resizable().frame(width: 90, height: 130)
    
                        HStack{
                            //added 5 navigation to different views in the app
                            NavigationLink(destination: GameView() ){
                                Text("Start Play").modifier(AppButtonModifier())
                            }
                            NavigationLink(destination: MapView() ){
                                Text("Our Location").modifier(AppButtonModifier())
                            }
                            NavigationLink(destination: PlayInstructions() ){
                                Text("Game Instructions").modifier(AppButtonModifier())
                            }
                            NavigationLink(destination: ScoreUIView() ){
                                Text("Score Board").modifier(AppButtonModifier())
                            }
                            NavigationLink(destination: ListView() ){
                                Text("About Us").modifier(AppButtonModifier())
                            }
                        
                        }.frame(width: 700, height: 200, alignment: .bottom).padding(.bottom , 10)
                }//Vstack
            }//zstack
            .navigationBarHidden(true)
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)

    }
                              }
            
                              

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
