import Foundation
import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport

public class End1: SKScene {
    
   
    var playAgainButton = SKNode()
    var backToMenuButton = SKNode()
        
    override public func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backToMenuButton = self.childNode(withName: "backToMenuButton")!
        playAgainButton = self.childNode(withName: "playAgainButton")!
       
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if self.playAgainButton.contains(touchLocation) {
            let sceneMoveTo = GameScene(fileNamed: "GameScene")
            sceneMoveTo!.scaleMode = self.scaleMode
            let transition = SKTransition.crossFade(withDuration: 1)
            self.view!.presentScene(sceneMoveTo! ,transition: transition)
        }
        if self.backToMenuButton.contains(touchLocation) {
            let sceneMoveTo = Menu(fileNamed: "Menu")
            sceneMoveTo!.scaleMode = self.scaleMode
            let transition = SKTransition.crossFade(withDuration: 0)
            self.view!.presentScene(sceneMoveTo! ,transition: transition)
        }
    }
   
}
