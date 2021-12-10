//
//  HomeUIView.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-16.
//

import SwiftUI

var images : [UIImage]! = [UIImage(named: "gameText")!, UIImage(named: "spaceAround")!]
struct picanimation: UIViewRepresentable {
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
    let colors = Colors()
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg2").resizable().frame(width: 980, height: 460, alignment: .center)
                picanimation()
                    VStack{
                        Image("rock").resizable().frame(width: 90, height: 130)
    
                        HStack{
                            NavigationLink(destination: ScoreBoard() ){
                                Text("Start Play").modifier(AppButtonModifier())
                            }
                            NavigationLink(destination: MapView() ){
                                Text("Our Location").modifier(AppButtonModifier())
                            }
                            NavigationLink(destination: ScoreBoard() ){
                                Text("Score Board").modifier(AppButtonModifier())
                            }
                        
                        }.frame(width: 700, height: 200, alignment: .bottom).padding(.bottom , 10)
                }//Vstack
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
