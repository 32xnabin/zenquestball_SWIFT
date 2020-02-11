//  Created by Nabin Raj Pandey

import Foundation
import SpriteKit

class Ball {
    class func createBall() -> SKSpriteNode {
        let texture = SKTexture(imageNamed: "wball1")
        let sp = SKSpriteNode(texture: texture)
        
        sp.name = "hero"
        
        sp.xScale = 0.3
        sp.yScale = 0.3
        sp.physicsBody = SKPhysicsBody( texture: texture, size: sp.size)
        sp.physicsBody!.friction = 5.5//objectPhysics!.friction
        sp.physicsBody!.restitution = 0.1
        sp.physicsBody!.mass = 1000
        sp.physicsBody!.allowsRotation = true
        sp.physicsBody!.isDynamic = true
        sp.physicsBody?.categoryBitMask = 2
        sp.physicsBody?.collisionBitMask = 1
        sp.physicsBody?.contactTestBitMask = 1
        sp.physicsBody?.fieldBitMask = 128
        
        return sp
    }
}
