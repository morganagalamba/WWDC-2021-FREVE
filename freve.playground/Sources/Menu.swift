import Foundation
import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport

public class Menu : SKScene {

    let playButton = SKShapeNode()
    let playButtonLabel = SKLabelNode()
        
    override public func didMove(to view: SKView) {
        super.didMove(to: view)
      
        let playButtonString = NSMutableAttributedString(string: "play", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .bold), .foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        self.playButton.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 200, height: 50), cornerRadius: 10).cgPath
        self.playButton.position = CGPoint(x: self.frame.midX - 100, y: self.frame.midY - 200)
        self.playButton.fillColor = .black
        self.playButton.lineWidth = 2
        self.playButton.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.playButtonLabel.attributedText = playButtonString
        self.playButtonLabel.position = CGPoint(x: playButton.frame.midX, y: playButton.frame.midY - 10)
        
        self.addChild(playButton)
        self.addChild(playButtonLabel)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if self.playButton.contains(touchLocation) {
            let sceneMoveTo = History(fileNamed: "History")
            sceneMoveTo!.scaleMode = self.scaleMode
            let transition = SKTransition.crossFade(withDuration: 1)
            
            self.view!.presentScene(sceneMoveTo! ,transition: transition)
        }
    }
   
}


