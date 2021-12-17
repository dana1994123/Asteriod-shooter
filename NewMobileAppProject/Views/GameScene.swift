//
//  GameScene.swift
//  NewMobileAppProject
//
//  Created by Jashanpreet Singh on 2021-12-12.
//

import SpriteKit
import GameplayKit
import AVFoundation

// Adding Physics struct
struct PhysicsCategory{
    static let None : UInt32 = 0
    static let All : UInt32 = UInt32.max
    static let Baddy : UInt32 = 0b1// 1
    static let Hero : UInt32 = 0b10// 2
    static let Projectile : UInt32 = 0b11// 3
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var mousePosition = CGPoint(x:0,y:0)

    //private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    //Background and Hero Declaration
    var background = SKSpriteNode(imageNamed: "bgGame")
    private var sportNode : SKSpriteNode?
    
    
    //Score Decalaration
    private var score : Int?
    let scoreIncrement = 10
    
    
    // Label Decalaration
    private var lblScore = SKLabelNode(fontNamed: "AvenirNext")
    private var lblTitle = SKLabelNode(fontNamed: "Chalkduster")
    private var lblHome = SKLabelNode()
    private var lblTime = SKLabelNode(fontNamed: "AvenirNext")
    private var time = 2000

    
    func initLabels() //function for labels
    {
        //Customizing lable sore
        lblScore.name = "lblScore"
        lblScore.text = "Score: "
        lblScore.fontSize = 20
        lblScore.fontColor = UIColor.orange
        lblScore.position = CGPoint(x: 200, y: 200)
        lblScore.zPosition = 11
        self.addChild(lblScore)
        
        //Customizing lable title
        lblTitle.name = "lblTitle"
        lblTitle.text = "Kill the Alien"
        lblTitle.fontSize = 40
        lblTitle.fontColor = UIColor.red
        lblTitle.position = CGPoint(x: 500, y: 500)
        lblTitle.zPosition = 11
        self.addChild(lblTitle)
        
        // Customizing lable Time
        lblTime.name = "lblTime"
        lblTime.text = ""
        lblTime.fontSize = 20
        lblTime.fontColor = UIColor.white
        lblTime.position = CGPoint(x: 800, y: 200)
        lblTime.zPosition = 11
        self.addChild(lblTime)
        
    
    }
    
    

    override func didMove(to view: SKView) {
        
        //Background Music added
        let backgroundMusic = SKAudioNode(fileNamed: "song1")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)


        
        // Calling Labels when the screen is loaded
        initLabels()
        
        //adding background and fading it
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.alpha = 0.3
        addChild(background)
        
    
       //animation added for labels
        lblTitle.alpha = 0.0
        lblTitle.run(SKAction.fadeIn(withDuration: 2.0))
        
        
        
        //initializig our hero node
        sportNode = SKSpriteNode(imageNamed: "spaceship")
        sportNode?.position = CGPoint(x: 500, y: 190)
        sportNode?.size = CGSize(width: 100, height: 100)
        addChild(sportNode!)
        
        
    
        //adding physics to our hero
        physicsWorld.gravity = CGVector(dx: 0,dy: 0)
        physicsWorld.contactDelegate = self

        
        
        //Adding collision detection to our hero
        sportNode?.physicsBody = SKPhysicsBody(circleOfRadius: (sportNode?.size.width)!/6)
        sportNode?.physicsBody?.isDynamic = true
        sportNode?.physicsBody?.categoryBitMask = PhysicsCategory.Hero
        sportNode?.physicsBody?.contactTestBitMask = PhysicsCategory.Baddy
        sportNode?.physicsBody?.collisionBitMask = PhysicsCategory.None
        sportNode?.physicsBody?.usesPreciseCollisionDetection = true
        
        
        // bringing in the baddies
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addBaddy), SKAction.wait(forDuration: 0.5)])))
        
        // step 11b - init score
        score = 0
        self.lblScore.text = "Score: \(score!)"
       
            lblScore.alpha = 0.0
            lblScore.run(SKAction.fadeIn(withDuration: 2.0))
    }
    
    // adding bad guy leafs
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min:CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max-min) + min
    }
    
    func addBaddy(){
        
        let baddy = SKSpriteNode(imageNamed: "alein")
        baddy.xScale = baddy.xScale * -1
        baddy.size = CGSize(width: 100, height: 100)
        
        let actualY = random(min: baddy.size.height/2, max: size.height-baddy.size.height/2)
        
        baddy.position = CGPoint(x: actualY , y:size.height)
        
        addChild(baddy)
        
        // adding physics to our Alein
        baddy.physicsBody = SKPhysicsBody(rectangleOf: baddy.size)
        baddy.physicsBody?.isDynamic = true
        baddy.physicsBody?.categoryBitMask = PhysicsCategory.Baddy
        baddy.physicsBody?.contactTestBitMask = PhysicsCategory.Hero
        baddy.physicsBody?.contactTestBitMask = PhysicsCategory.Projectile
        baddy.physicsBody?.collisionBitMask = PhysicsCategory.None
        
        
        let actualDuration = random(min: CGFloat(2.0), max:CGFloat(4.0))
        
        let actionMove = SKAction.move(to: CGPoint(x: actualY, y: -baddy.size.width/2), duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()
        baddy.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    
    //When fire hits tht alien
    func projectileDidCollideWithMonster(projectile: SKSpriteNode, baddy: SKSpriteNode) {
      print("Hit")
        score = score! + scoreIncrement
        self.lblScore.text = "Score: \(score!)"
        
        lblScore.alpha = 0.0
        lblScore.run(SKAction.fadeIn(withDuration: 2.0))
       

        projectile.removeFromParent()
        
        let explode = SKSpriteNode(imageNamed: "explosion")
        explode.position = baddy.position
        explode.size = CGSize(width: 100, height: 100)
        addChild(explode)
        explode.run(SKAction.fadeOut(withDuration: 2))

    }
    
    
    //when the game begins
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody : SKPhysicsBody
        var secondBody : SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if((firstBody.categoryBitMask & PhysicsCategory.Baddy != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.Projectile != 0)){
            projectileDidCollideWithMonster(projectile: firstBody.node as! SKSpriteNode, baddy: secondBody.node as! SKSpriteNode)
        }

    }
    
   
    
    // Moving our hero // hero will move along the x axis
    func moveGoodGuy(toPoint pos : CGPoint){
        let actionMove = SKAction.move(to: pos, duration: TimeInterval(2.0))
        let actionMoveDone = SKAction.fadeIn(withDuration: 2)
        sportNode?.run(SKAction.sequence([actionMove,actionMoveDone]))
    }
    
    
 //action when our mouse touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        let pos : CGPoint = CGPoint(x:(touches.first?.location(in: self).x)!,y:200)
        mousePosition = (touches.first?.location(in: self))!
        moveGoodGuy(toPoint: pos)
      
    }
    
    
    //action when our mouse done the touch //it is throwing projectiles
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 1 - Choose one of the touches to work with
        guard let touch = touches.first else{
          return
        }
        let touchLocation = touch.location(in: self)
        
        // 2 - Set up initial location of projectile
        let projectile = SKSpriteNode(imageNamed: "projectileR")
        projectile.size = CGSize(width: 50, height: 50)
        projectile.position = sportNode!.position
        
        // 3 - Determine offset of location to projectile
        let offset = touchLocation - projectile.position
        
        // 4 - Bail out if you are shooting down or backwards
        //if offset.x < 0 { return }
        
        // 5 - OK to add now - you've double checked position
        addChild(projectile)
        
        // 6 - Get the direction of where to shoot
        let direction = offset.normalized()
        
        // 7 - Make it shoot far enough to be guaranteed off screen
        let shootAmount = direction * 1000
        
        // 8 - Add the shoot amount to the current position
        let realDest = shootAmount + projectile.position
        
        // 9 - Create the actions
        let actionMove = SKAction.move(to: realDest, duration: 2.0)
        let actionMoveDone = SKAction.removeFromParent()
        projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/2)
        projectile.physicsBody?.isDynamic = true
        projectile.physicsBody?.categoryBitMask = PhysicsCategory.Projectile
        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.Baddy
        projectile.physicsBody?.collisionBitMask = PhysicsCategory.None
        projectile.physicsBody?.usesPreciseCollisionDetection = true
    }
    
    //keep the data of time
    override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
            enumerateChildNodes(withName: "baddy") { node, stop in
                if(node is SKSpriteNode) {
                    
                    if node.position.x<=0{
                        node.removeFromParent()
                    }
                }
            }
            var timeleft = String(time-1)
            self.lblTime.text = "Time : \(timeleft)"

            time-=1
            if time==0{
                if(score!) > 500{
                    let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                      let gameOverScene = GameOverScene(size: self.size, won: true)
                      view?.presentScene(gameOverScene, transition: reveal)
                    
                }
                else{
                    let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                      let gameOverScene = GameOverScene(size: self.size, won: false)
                      view?.presentScene(gameOverScene, transition: reveal)
                }
                
            }
        }
}
    

func+(left: CGPoint, right: CGPoint) -> CGPoint{
  return CGPoint(x: left.x+right.x, y: left.y+right.y)
}

func-(left: CGPoint, right: CGPoint) -> CGPoint{
  return CGPoint(x: left.x-right.x, y: left.y-right.y)
}

func*(point: CGPoint, scalar: CGFloat) -> CGPoint{
  return CGPoint(x: point.x*scalar, y: point.y*scalar)
}

func/(point: CGPoint, scalar: CGFloat) -> CGPoint{
  return CGPoint(x: point.x/scalar, y: point.y/scalar)
}

#if !(arch(x86_64) || arch(arm64))
  func sqrt(a: CGFloat) -> CGFloat{
    returnCGFloat(sqrtf(Float(a)))
  }
#endif

extension CGPoint {
  func length() -> CGFloat{
    return sqrt(x*x + y*y)
  }
  
  func normalized() -> CGPoint{
    return self / length()
  }
}

