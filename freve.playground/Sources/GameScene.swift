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
    var score = 0
    var scoreLabel = SKLabelNode()
    var scoreBackground = SKNode()
    var scoreTitle = SKNode()
    
    public override func didMove(to view: SKView) {
        print("nao aguento mais esse playground")
        super.didMove(to: view)
        
        //self.size.height = 640
        //self.size.width = 480
        
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
        scoreTitle = self.childNode(withName: "scoretitle")!
        scoreBackground = self.childNode(withName: "scoreBackground")!
        
        let scoreString = NSMutableAttributedString(string: String(score), attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .bold), .foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        
        scoreLabel.attributedText = scoreString
        scoreLabel.position = CGPoint(x: 250, y: 190)
        
        
        capoeira.elementBody = self.childNode(withName: "capoeira")!
        capoeira.loadCapoeiraWalk(folderName: "capoeira", numberOfTextures : 4)
        capoeira.loadFrevoWalk(folderName: "frevo", numberOfTextures : 6)
        capoeira.walkCapoeira(body: capoeira.elementBody)
        capoeira.animateCapoeiraWalk()
 
        cameraNode.position = CGPoint(x: capoeira.elementBody.position.x,y: 0)
        addChild(cameraNode)
        addChild(scoreLabel)
        self.camera = cameraNode
    }
 
    public override func update(_ currentTime: TimeInterval) {
        let scoreString = NSMutableAttributedString(string: String(score), attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .bold), .foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        
        self.scoreLabel.attributedText = scoreString
        let xPos = clamping(num: capoeira.elementBody.position.x , min: 0, max: 1790)
        cameraNode.position = CGPoint(x: xPos  , y: 0.0)
        fixedBackground.position = CGPoint(x: xPos , y: 0.0)
        fixedFrevoButton.position = CGPoint(x: xPos-250  , y: -176)
        scoreLabel.position = CGPoint(x: xPos+250, y: 190 )
        scoreTitle.position = CGPoint(x: xPos+140, y: 190 )
        scoreBackground.position = CGPoint(x: xPos+250, y: 200 )
        //print(score)
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
        print("Collison detected")

        if let node = contact.bodyA.node?.name as! String? {
            if( node  == "gard"){
                if (wichAnimation == "frevo"){
                    score = score + 25
                }
                capoeira.animateCapoeiraWalk()
                contact.bodyA.node?.physicsBody = .none
                wichAnimation = "capoeira"
            }

        }
        if let node = contact.bodyB.node?.name as! String?{
            
            if(node == "gard"){
                if (wichAnimation == "frevo"){
                    score = score + 25
                }
                capoeira.animateCapoeiraWalk()
                contact.bodyB.node?.physicsBody = .none
                wichAnimation = "capoeira"
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
