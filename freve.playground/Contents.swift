//: A SpriteKit based Playground
import UIKit
import SpriteKit
import GameplayKit
import Foundation
import PlaygroundSupport
 
// Load the SKScene from 'GameScene.sks'
 let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
 if let scene = Menu(fileNamed: "Menu") {
     // Set the scale mode to scale to fit the window
     scene.scaleMode = .aspectFill

     // Present the scene
     sceneView.presentScene(scene)
 }

 PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
