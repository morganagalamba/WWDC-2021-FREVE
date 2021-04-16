import Foundation
import Foundation
import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport

public class Capoeira{
    public var elementBody : SKNode = SKNode()
    //var animationFrevoWalk: [SKTexture] = []
    var animationCapoeiraWalk: [SKTexture] = []
    
   public func loadCapoeiraWalk(folderName: String, numberOfTextures: Int){
        
        for i in 0..<numberOfTextures{
            animationCapoeiraWalk.append(SKTexture(imageNamed:"capoeira/\(i)" ))
        }
    }
    
    public func walkCapoeira(body: SKNode){
        body.run(SKAction.repeatForever(SKAction.move(by: CGVector(dx: 50, dy: 0), duration: 0.5)), withKey: "Right")
    }
    
    public func animateCapoeiraWalk(){
        
        elementBody.run(SKAction.repeatForever(SKAction.animate(with: animationCapoeiraWalk, timePerFrame:   0.5)),withKey: "Animate Right")

    }
}
