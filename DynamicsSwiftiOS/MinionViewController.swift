//
//  ViewController.swift
//  DynamicsSwiftiOS
//
//  Created by Jalal Alikhani on 15/07/2016.
//  Copyright © 2016 Jalal Alikhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TapLabel: UILabel?
    var minionView:UIView!
    
    var dropMinionBehavior: DropMinionBehavior = { return DropMinionBehavior() }()
    
    lazy var animator: UIDynamicAnimator = { return UIDynamicAnimator(referenceView: self.view) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gesture = UITapGestureRecognizer(target: self, action: "dropMinion:")
        self.view.addGestureRecognizer(gesture)
    }
    
    func dropMinion(sender:UITapGestureRecognizer){
        TapLabel?.removeFromSuperview()
        drawMinion(sender.locationInView(self.view))
        dropMinionBehavior.add(minionView);
        animator.addBehavior(dropMinionBehavior)
    }
    
    func drawMinion(touch: CGPoint){
        let randomSize = CGFloat(arc4random_uniform(200)) + 30.0;
        let squareSize = CGSize(width: randomSize, height: randomSize)
        
        let centerPoint = CGPoint(x: touch.x, y: touch.y)
        let frame = CGRect(origin: centerPoint, size: squareSize)
        minionView = UIView(frame: frame)
        
        let number = arc4random_uniform(2);
        let imageName = "Images/minions-0\(number).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: squareSize.width, height: squareSize.width)
        let tap = UITapGestureRecognizer(target: self, action: Selector("tappedMinion:"))
        minionView.addGestureRecognizer(tap)
        minionView.userInteractionEnabled = true
        minionView.addSubview(imageView)
        
        view.addSubview(minionView)
    }
    
    func tappedMinion(sender: AnyObject) {
        
        if let minion = sender.view! {
            dropMinionBehavior.remove(minion)
            minion.removeFromSuperview()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        self.view.removeFromSuperview()
    }


}

