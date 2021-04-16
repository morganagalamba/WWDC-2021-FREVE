
import Foundation
import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport

public class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var lastUpdateTime : TimeInterval = 0
    var capoeira = Capoeira()
    let cameraNode = SKCameraNode()
    var fixedBackground : SKNode = SKNode()
    
    public override func sceneDidLoad() {
        physicsWorld.contactDelegate = self
        self.lastUpdateTime = 0
        
        fixedBackground = self.childNode(withName: "cenario")!
        
        capoeira.elementBody = self.childNode(withName: "capoeira")!
        capoeira.loadCapoeiraWalk(folderName: "capoeira", numberOfTextures : 4)
        capoeira.walkCapoeira(body: capoeira.elementBody)
        capoeira.animateCapoeiraWalk()
        
 
        cameraNode.position = CGPoint(x: capoeira.elementBody.position.x,y: 0)
        addChild(cameraNode)
        self.camera = cameraNode
    }
    
    public override func didMove(to view: SKView) {
    
        capoeira.elementBody = self.childNode(withName: "capoeira")!
        capoeira.loadCapoeiraWalk(folderName: "capoeira", numberOfTextures: 4)
        
    }
 
    public override func update(_ currentTime: TimeInterval) {
        
        let xPos = clamping(num: capoeira.elementBody.position.x , min: 0, max: 1790)
        cameraNode.position = CGPoint(x: xPos  , y: 0.0)
        fixedBackground.position = CGPoint(x: xPos , y: 0.0)
        
        
    }
    
}

func clamping(num: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat{
    
    var result = num
    if(num > max){
        result = max
    }else{
        if(result < min){
            result = min
        }
    }
    
    return result
}
