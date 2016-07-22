//
//  DragImg.swift
//  myLittleMonster
//
//  Created by Dino Musliu on 14/07/2016.
//  Copyright © 2016 Dino Musliu. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {

    var originalPosition : CGPoint!
    //var drop Target: UIImage!
    var dropTarget : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center // self - imgview
    }
        
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first{ //grab very first obj koji smo kliknuli
            let position = touch.locationInView(self.superview) // grab position in view (dobi lokaciju fingertoucha u glavnom viewuw)
            self.center = CGPointMake(position.x, position.y) // tamo di kliknes movaj object
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            
            let position = touch.locationInView(self.superview)
            
            if CGRectContainsPoint(target.frame, position) {// ako je pozicija unutar targeta
                //tj ako smo stavil item. na nas target onda dobi notificikaciju kako bi view controler znao sto napraviti sljedece
                
                //let notif = NSNotification(name: "onTargetDropped", object: nil)
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        self.center = originalPosition

    }
    
    
    
}