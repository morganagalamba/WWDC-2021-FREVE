import Foundation
import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport

public class Menu : SKScene {
    
    let menuBackground = SKSpriteNode(imageNamed: "Menu")
    let playButton = SKShapeNode()
    let playButtonLabel = SKLabelNode()
        
    override public func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.menuBackground.scale(to: CGSize(width: 640, height: 480))
        self.menuBackground.anchorPoint = CGPoint(x:0, y:0)
        self.menuBackground.position = CGPoint(x:0, y:0)
        
        
        let playButtonString = NSMutableAttributedString(string: "play", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .bold), .foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        self.playButton.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 200, height: 50), cornerRadius: 10).cgPath
        self.playButton.position = CGPoint(x: self.frame.midX - 100, y: self.frame.midY - 200)
        self.playButton.fillColor = .black
        self.playButton.lineWidth = 2
        self.playButton.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.playButtonLabel.attributedText = playButtonString
        self.playButtonLabel.position = CGPoint(x: playButton.frame.midX, y: playButton.frame.midY - 10)
        
        self.addChild(menuBackground)
        self.addChild(playButton)
        self.addChild(playButtonLabel)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if self.playButton.contains(touchLocation) {
            /*if let scene = GameScene(fileNamed: "GameScene") {
                let transition = SKTransition.crossFade(withDuration: 1)
                self.scene?.view?.presentScene(scene, transition: transition)
            }*/
            let sceneMoveTo = GameScene(fileNamed: "GameScene")
            sceneMoveTo!.scaleMode = self.scaleMode
            let transition = SKTransition.moveIn( duration: 1)
            self.view!.presentScene(sceneMoveTo! ,transition: transition)
        }
    }
   
}


