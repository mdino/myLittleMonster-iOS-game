//
//  MonesterImg.swift
//  myLittleMonster
//
//  Created by Dino Musliu on 14/07/2016.
//  Copyright © 2016 Dino Musliu. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation(){
        
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        //monsterImg.animationImages
        //var img1 = UIImage(named: "idle1.png")
        var imgArray = [UIImage]()
        
        for x in 1..<5 {         //for var x = 1; x <= 4; x += 1
            let img = UIImage(named: "idle\(x).png" )
            imgArray.append(img!)
        }
        
        //monsterImg.animationImages = imgArray
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
     func playDeadAnimation(){
        
        self.image = UIImage(named: "dead5.png") // kad animacija stane prikaze se default img
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for x in 1..<5 {
            let img = UIImage(named: "dead\(x).png" )
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    
    }
}