
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
    var fixedFrevoButton : SKNode = SKNode()
    var wichAnimation = "capoeira"
    var gard: [SKNode] = [SKNode(),SKNode(),SKNode(),SKNode()]
    var gardAnimation: [SKTexture] = []
    
    
    public override func sceneDidLoad() {
        physicsWorld.contactDelegate = self
        self.lastUpdateTime = 0
        
        for i in 0..<4{
            gardAnimation.append(SKTexture(imageNamed:"gard/g\(i)" ))
        }
        
        for i in 0..<4{
            gard[i] = self.childNode(withName: "gard\(i)")!
            gard[i].run(SKAction.repeatForever(SKAction.animate(with: gardAnimation, timePerFrame:  0.5)),withKey: "Animate")
        }
        
        
        fixedBackground = self.childNode(withName: "cenario")!
        fixedFrevoButton = self.childNode(withName: "buttonFrevo")!
        
        
        capoeira.elementBody = self.childNode(withName: "capoeira")!
        capoeira.loadCapoeiraWalk(folderName: "capoeira", numberOfTextures : 4)
        capoeira.loadFrevoWalk(folderName: "frevo", numberOfTextures : 6)
        capoeira.walkCapoeira(body: capoeira.elementBody)
        capoeira.animateCapoeiraWalk()
        
 
        cameraNode.position = CGPoint(x: capoeira.elementBody.position.x,y: 0)
        addChild(cameraNode)
        self.camera = cameraNode
    }
    
    public override func didMove(to view: SKView) {
    
        capoeira.elementBody = self.childNode(withName: "capoeira")!
        capoeira.loadCapoeiraWalk(folderName: "capoeira", numberOfTextures: 4)
        capoeira.loadFrevoWalk(folderName: "frevo", numberOfTextures : 6)
        
    }
 
    public override func update(_ currentTime: TimeInterval) {
        
        /*if wichAnimation == "capoeira"{
            //capoeira.animateCapoeiraWalk()
        } else {
            print("mudou")
            capoeira.animateFrevoWalk()
        }*/
        let xPos = clamping(num: capoeira.elementBody.position.x , min: 0, max: 1790)
        cameraNode.position = CGPoint(x: xPos  , y: 0.0)
        fixedBackground.position = CGPoint(x: xPos , y: 0.0)
        fixedFrevoButton.position = CGPoint(x: xPos-250  , y: -176)
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if self.fixedFrevoButton.contains(touchLocation) {
            //let sceneMoveTo = TutorialScene(size: self.size)
            //sceneMoveTo.scaleMode = self.scaleMode
            print("clicou")
            wichAnimation = "frevo"
            capoeira.animateFrevoWalk()
            //let transition = SKTransition.moveIn(with: .down, duration: 0.3)
            //self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)
            
        }
    }
    public func didBegin(_ contact: SKPhysicsContact) {
        //print("Collison detected")

        if let node = contact.bodyA.node?.name as! String? {
            if( node  == "gard"){

                capoeira.animateCapoeiraWalk()
                print(wichAnimation)
                contact.bodyA.node?.physicsBody = .none
            }

        }
        if let node = contact.bodyB.node?.name as! String?{
            
            if(node == "gard"){
                
                print(wichAnimation)
                capoeira.animateCapoeiraWalk()
                contact.bodyB.node?.physicsBody = .none
            }
         }
        
            
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
