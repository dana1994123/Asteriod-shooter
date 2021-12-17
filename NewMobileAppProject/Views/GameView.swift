//
//  GameView.swift
//  NewMobileAppProject
//
//  Created by Jashanpreet Singh on 2021-12-12.
//

import SwiftUI
import SpriteKit

struct GameView: View{
    
    var scene : SKScene{
        //specify the scene property 
        let scene = GameScene()
        scene.size = CGSize(width: 1000, height:750)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = CGPoint(x:0,y:0)
        return scene
    }
    
    
    var body: some View{
        //added the game spirit kit with a custom dimension
        SpriteView(scene: scene)
            .frame(width: 1000, height: 750)
            .ignoresSafeArea()
    }
}

struct GameView_Previews: PreviewProvider{
    static var previews : some View{
        GameView()
    }
}
