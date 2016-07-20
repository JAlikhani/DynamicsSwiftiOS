//
//  DropMinionBehavior.swift
//  DynamicsSwiftiOS
//
//  Created by Jalal Alikhani on 20/07/2016.
//  Copyright © 2016 Jalal Alikhani. All rights reserved.
//

import UIKit

class DropMinionBehavior: UIDynamicBehavior {
    
    lazy var gravity:UIGravityBehavior = {
        let lazyGravity = UIGravityBehavior()
        lazyGravity.magnitude = CGFloat(arc4random_uniform(8) + 1)
        return lazyGravity
    }()
    
    lazy var snap:UISnapBehavior = UISnapBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let lazyCollider = UICollisionBehavior()
        // This line, makes the boundries of our reference view a boundary
        // for the added items to collide with.
        lazyCollider.translatesReferenceBoundsIntoBoundary = true
        return lazyCollider
    }()
    
    lazy var dynamicItemBehavior:UIDynamicItemBehavior = {
        let lazyBehavior = UIDynamicItemBehavior()
        // 0 = no elacticity, 1.0 = max elacticity
        lazyBehavior.elasticity = 0.8
        // Other configurations
        lazyBehavior.allowsRotation = true
        // lazyBehavior.density
        // lazyBehavior.friction
        // lazyBehavior.resistanc
        return lazyBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(dynamicItemBehavior)
    }
    
    func add(minion: UIView) {
        dynamicItemBehavior.addItem(minion)
        gravity.addItem(minion)
        collider.addItem(minion)
        
    }
    
    func remove(minion: UIView) {
        dynamicItemBehavior.removeItem(minion)
        gravity.removeItem(minion)
        collider.removeItem(minion)
    }
}
