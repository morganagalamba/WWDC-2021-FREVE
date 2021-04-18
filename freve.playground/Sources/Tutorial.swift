import Foundation
import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport

public class Tutorial: SKScene {
    
   
    var playButton = SKNode()
    var backButton = SKNode()
    var backButtonLabel = SKLabelNode()
        
    override public func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backButton = self.childNode(withName: "backButton")!
        playButton = self.childNode(withName: "playButton")!
       
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if self.playButton.contains(touchLocation) {
            let sceneMoveTo = GameScene(fileNamed: "GameScene")
            sceneMoveTo!.scaleMode = self.scaleMode
            let transition = SKTransition.crossFade(withDuration: 1)
            self.view!.presentScene(sceneMoveTo! ,transition: transition)
        }
        if self.backButton.contains(touchLocation) {
            let sceneMoveTo = History(fileNamed: "History")
            sceneMoveTo!.scaleMode = self.scaleMode
            let transition = SKTransition.crossFade(withDuration: 1)
            self.view!.presentScene(sceneMoveTo! ,transition: transition)
        }
    }
   
}
