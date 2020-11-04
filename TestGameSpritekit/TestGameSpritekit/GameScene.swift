//
//  GameScene.swift
//  TestGameSpritekit
//
//  Created by Александр  Бровков  on 04.11.2020.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "player")
      
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.blue
        
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        
        addChild(player)
        
        run(SKAction.repeatForever(
          SKAction.sequence([
            SKAction.run(​addMonster),
            SKAction.wait(forDuration: 1.0)
            ])
        ))
    }
    
    func random() -> CGFloat {
      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }

    func ​randoma(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }

    func ​addMonster() {

        let monster = SKSpriteNode(imageNamed: "monster")
        
        let actualY = ​randoma(min: monster.size.height/2, max: size.height - monster.size.height/2)
        
        monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
        
        addChild(monster)
        
        let actualDuration = ​randoma(min: CGFloat(2.0), max: CGFloat(4.0))
        
        let actionMove = SKAction.move(to: CGPoint(x: -monster.size.width/2, y: actualY),
                                       duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.run(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
}
