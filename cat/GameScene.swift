//
//  GameScene.swift
//  cat
//
//  Created by Gordon MacDonald on 2/21/16.
//  Copyright (c) 2016 Gordon MacDonald. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    
    var purr: AVAudioPlayer!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
    }
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        self.purr = setupAudioPlayerWithFile("cat-purring", type: "mp3")
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "moxie")
        addChild(background)
    }
    
    override func didMoveToView(view: SKView) {
        
        //set up scene here
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            print("begin")
            purr.play()
            
        }
    }
   


override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    
    for touch in touches {
        let location = touch.locationInNode(self)
        
        print("move")
        purr.play()
    }
}

override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    
    for touch in touches {
        let location = touch.locationInNode(self)
        
        print("end")
    }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func setupAudioPlayerWithFile(file: String, type: String) -> AVAudioPlayer? {
        
        if let url = NSBundle.mainBundle().URLForResource(file, withExtension: type) {
            do {
                return try AVAudioPlayer(contentsOfURL: url)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
