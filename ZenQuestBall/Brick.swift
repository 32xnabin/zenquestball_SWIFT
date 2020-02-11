//  Created by Nabin Raj Pandey

import Foundation
import SpriteKit

class Brick {
    class func createBall() -> SKSpriteNode {
//        let texture = SKTexture(imageNamed: "woodwall")
//       // let sprite = SKSpriteNode(texture: texture)
        let sprite = SKSpriteNode(color: .brown, size: CGSize(width: 10, height: 10))
        
        sprite.name = "brick"
        
        sprite.xScale = 0.3
        sprite.yScale = 0.3
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(1.00))
        sprite.physicsBody!.friction = 2
        sprite.physicsBody!.restitution = 0.0
        sprite.physicsBody!.mass = 1000
        sprite.physicsBody!.allowsRotation = false
        sprite.physicsBody!.isDynamic = false
        sprite.physicsBody?.categoryBitMask = 1
        sprite.physicsBody?.collisionBitMask = 2
        sprite.physicsBody?.contactTestBitMask = 2
        sprite.physicsBody?.fieldBitMask = 1
        
        return sprite
    }
}
