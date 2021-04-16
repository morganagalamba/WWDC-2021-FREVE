//: A SpriteKit based Playground

import SpriteKit
import GameplayKit
import Foundation
import PlaygroundSupport

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var lastUpdateTime : TimeInterval = 0
    var capoeira = Capoeira()
    let cameraNode = SKCameraNode()
    var fixedBackground : SKNode = SKNode()
    
    override func sceneDidLoad() {
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
    
    override func didMove(to view: SKView) {
    
        capoeira.elementBody = self.childNode(withName: "capoeira")!
        capoeira.loadCapoeiraWalk(folderName: "capoeira", numberOfTextures: 4)
        
    }
 
    override func update(_ currentTime: TimeInterval) {
        
        let xPos = clamping(num: capoeira.elementBody.position.x , min: 0, max: 1790)
        cameraNode.position = CGPoint(x: xPos  , y: 0.0)
        fixedBackground.position = CGPoint(x: xPos , y: 0.0)
        
        
    }
    
}

public class Capoeira{
    public var elementBody : SKNode = SKNode()
    //var animationFrevoWalk: [SKTexture] = []
    var animationCapoeiraWalk: [SKTexture] = []
    
   func loadCapoeiraWalk(folderName: String, numberOfTextures: Int){
        
        for i in 0..<numberOfTextures{
            animationCapoeiraWalk.append(SKTexture(imageNamed:"capoeira/\(i)" ))
        }
    }
    
    func walkCapoeira(body: SKNode){
        body.run(SKAction.repeatForever(SKAction.move(by: CGVector(dx: 50, dy: 0), duration: 0.5)), withKey: "Right")
    }
    
    func animateCapoeiraWalk(){
        
        elementBody.run(SKAction.repeatForever(SKAction.animate(with: animationCapoeiraWalk, timePerFrame:   0.5)),withKey: "Animate Right")

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


// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
