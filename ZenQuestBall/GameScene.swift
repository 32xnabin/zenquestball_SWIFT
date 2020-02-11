//  Created by Nabin Raj Pandey

import SpriteKit
import CoreMotion



class GameScene: SKScene {
   
    var collisionDetector:CollisionDetector?
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        self.physicsWorld.gravity = gravVector
        let physicsBody = SKPhysicsBody (edgeLoopFrom: self.frame)
        self.physicsBody = physicsBody
        self.name = "edge"
       
        

        let ballSprite = Ball.createBall()
        ballSprite.position = CGPoint(x: frame.midX, y: frame.midY-80)
        self.addChild(ballSprite)
        

        
        addRing(radius: CGFloat(20),r1: -4,r2: 5,r3: 20)
        
        addRing(radius: CGFloat(40),r1: -4,r2:5,r3:-40)

        addRing(radius: CGFloat(60),r1: -4,r2: 5,r3: 60)

        addRing(radius: CGFloat(80),r1: 20,r2: -5,r3: 0)

        motionManager.startAccelerometerUpdates()
    }
    
    func drawCircles(){
        
        
        
        
    }
    
   
    
    
    
    func addRing(radius:CGFloat,r1:Int,r2:Int,r3:Int) {
        let dx = 0.0
        let dy = 0.0
        //
        //let radius = CGFloat(40.0)
        
        let radian = atan2(dy, dx)
        let playerPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.midX, y: frame.midY),
            radius: radius,
            startAngle: CGFloat(radian),
            endAngle: CGFloat(radian) + CGFloat(M_PI * 4.0),
            clockwise: true)
        
        let follow = SKAction.follow(playerPath.cgPath, asOffset: false, orientToPath: true, speed: 200)
        // player.runAction(SKAction.repeatActionForever(follow))
        
        let numberOfCoins = Int(radius*1.5)
        for i in 0...numberOfCoins {
            let coin = SKSpriteNode(color: .yellow, size: CGSize(width: 10, height: 10))
            
            let angle = 2 * M_PI / Double(numberOfCoins) * Double(i)
            
            let coinX = radius * cos(CGFloat(angle))
            let coinY = radius * sin(CGFloat(angle))
            
            //            coin.position = CGPoint(x:coinX + frame.midX, y:coinY + frame.midY)
            //            addChild(coin)
            let brickSprite = Brick.createBall()
            brickSprite.position = CGPoint(x:coinX + frame.midX, y:coinY + frame.midY)
            
            if(radius==20 ){
                 print("y========\(Int(coinY) )")
                 print("x========\(Int(coinX) )")

            }
            if(radius==20){
            if(( Int(coinY ) <= 4 && Int(coinY ) >= -4 ) && ( Int(coinY ) >= 19 && Int(coinY ) <= 20 ) ){
                
               
            }else{
               
            
            self.addChild(brickSprite)
                
            }
            }
            
           else if(radius==40){
                if( Int(coinY ) >= r1 && Int(coinY) < r2 && (Int(coinX)==r3 || Int(coinX)==r3+1 || Int(coinX)==r3-1)){
                    
                    
                }else{
                    
                    
                    self.addChild(brickSprite)
                    
                }
            }
            else if(radius==60){
                if( Int(coinY ) >= r1 && Int(coinY) < r2 && (Int(coinX)==r3 || Int(coinX)==r3+1 ||  Int(coinX)==r3-1)){
                    
                    
                }else{
                    
                    
                    self.addChild(brickSprite)
                    
                }
            }
            else{
                 self.addChild(brickSprite)
            }
            
        }
    }
    

    var gravVector:CGVector = CGVector(dx: 0,dy: -9.8)
    let motionManager: CMMotionManager = CMMotionManager()

    let gravFactor:CGFloat = 30.0
    func processUserMotionForUpdate(_ currentTime: CFTimeInterval) {
        if let data = motionManager.accelerometerData {
            
            let x = CGFloat(data.acceleration.x)*gravFactor
            let y = CGFloat(data.acceleration.y)*gravFactor
            
            gravVector = CGVector(dx: x,dy: y)
        }
    }
    
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        processUserMotionForUpdate(currentTime)
        
        self.physicsWorld.gravity = gravVector
        
       
    }
}
