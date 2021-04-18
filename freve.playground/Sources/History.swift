import Foundation
import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport

public class History: SKScene {
    
   
    var nextButton = SKNode()
    var backButton = SKNode()
        
    override public func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backButton = self.childNode(withName: "backButton")!
        nextButton = self.childNode(withName: "nextButton")!
       
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if self.nextButton.contains(touchLocation) {
            let sceneMoveTo = Tutorial(fileNamed: "Tutorial")
            sceneMoveTo!.scaleMode = self.scaleMode
            let transition = SKTransition.crossFade(withDuration: 0)
            self.view!.presentScene(sceneMoveTo! ,transition: transition)
        }
        if self.backButton.contains(touchLocation) {
            let sceneMoveTo = Menu(fileNamed: "Menu")
            sceneMoveTo!.scaleMode = self.scaleMode
            let transition = SKTransition.crossFade(withDuration: 0.5)
            self.view!.presentScene(sceneMoveTo! ,transition: transition)
        }
    }
   
}
