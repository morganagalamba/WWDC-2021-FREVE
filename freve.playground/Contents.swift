//: A SpriteKit based Playground
import UIKit
import SpriteKit
import GameplayKit
import Foundation
import PlaygroundSupport
 
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
var scene = Menu(fileNamed: "Menu")
//scene.scaleMode = .aspectFill
sceneView.presentScene(scene)


PlaygroundSupport.PlaygroundPage.current.liveView = sceneView


