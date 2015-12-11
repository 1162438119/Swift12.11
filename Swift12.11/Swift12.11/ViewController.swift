//
//  ViewController.swift
//  Swift12.11
//
//  Created by mac on 15/12/11.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var lineshape : CAShapeLayer?
    
    var shape : CAShapeLayer?
    
    var rightlineshape : CAShapeLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //初始化路径
        
        var path = UIBezierPath()
        path.addArcWithCenter(view.center, radius: 100, startAngle: CGFloat(-M_PI), endAngle: CGFloat(M_PI), clockwise: true)
        
        
        var leftlinepath = UIBezierPath()
        
        leftlinepath.moveToPoint(CGPointMake(self.view.center.x - 50, self.view.center.y - 70))
        leftlinepath.addLineToPoint(CGPointMake(self.view.center.x + 50, self.view.center.y + 70))
        
        var rightlinepath = UIBezierPath()
        
        rightlinepath.moveToPoint(CGPointMake(self.view.center.x - 50, self.view.center.y + 70))
        
        rightlinepath.addLineToPoint(CGPointMake(self.view.center.x + 50, self.view.center.y - 70))
        
        
 
        
        

        //圆
        
        shape = CAShapeLayer()
        
        shape?.path = path.CGPath
        
        shape?.strokeColor = UIColor.redColor().CGColor
        
        shape?.fillColor = UIColor.clearColor().CGColor
        
        shape?.strokeEnd = 0.0
        
        
        shape?.lineWidth = 2.0
        
        self.view.layer.addSublayer(shape!)
        
        //线(左边)
        lineshape = CAShapeLayer()
        
        lineshape?.path = leftlinepath.CGPath
        
        
        lineshape?.strokeColor = UIColor.redColor().CGColor
        
        lineshape?.fillColor = UIColor.clearColor().CGColor
        
        lineshape?.strokeEnd = 0.0
        
        lineshape?.lineWidth = 2.0
        
        
        self.view.layer.addSublayer(lineshape!)
        
        //线(右边)
        rightlineshape = CAShapeLayer()
        
        rightlineshape?.path = rightlinepath.CGPath
        
        
        rightlineshape?.strokeColor = UIColor.redColor().CGColor
        
        rightlineshape?.fillColor = UIColor.clearColor().CGColor
        
        rightlineshape?.strokeEnd = 0.0
        
        rightlineshape?.lineWidth = 2.0
        
        
        self.view.layer.addSublayer(rightlineshape!)
     

        //动画

        var basicAnmiation = CABasicAnimation()
        
        basicAnmiation.keyPath = "strokeEnd"
        
        basicAnmiation.duration = 2.0
        
        basicAnmiation.fromValue = 0.0
        
        basicAnmiation.autoreverses = false
        
        basicAnmiation.toValue = 1.0
        
        basicAnmiation.fillMode = kCAFillModeForwards
        
        basicAnmiation.removedOnCompletion = false
        
        shape!.addAnimation(basicAnmiation, forKey:nil)
        
        lineshape!.addAnimation(basicAnmiation, forKey:nil)
        
        rightlineshape!.addAnimation(basicAnmiation, forKey: nil)
        
        
        //两秒后
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            
            
            var lineAnmiation = CABasicAnimation()
            
            lineAnmiation.keyPath = "strokeEnd"
            
            lineAnmiation.duration = 2.0
            
            lineAnmiation.fromValue = 1.0
            
            lineAnmiation.autoreverses = false
            
            lineAnmiation.toValue = 0.0
            
            lineAnmiation.fillMode = kCAFillModeForwards
            
            lineAnmiation.removedOnCompletion = false
            
            self.shape!.addAnimation(lineAnmiation, forKey: nil)
            

            
        }
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(4.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            
            //路径
            
            var lastpath = UIBezierPath()
            
            lastpath.moveToPoint(CGPointMake(self.view.center.x - 100, self.view.center.y))
            lastpath.addLineToPoint(CGPointMake(self.view.center.x + 100, self.view.center.y))
            
            
            lastpath.addLineToPoint(CGPointMake(self.view.center.x + 50, self.view.center.y - 70))
            
            lastpath.addLineToPoint(CGPointMake(self.view.center.x - 50, self.view.center.y - 70))
            
            lastpath.addLineToPoint(CGPointMake(self.view.center.x - 100, self.view.center.y))
            
            
            lastpath.addLineToPoint(CGPointMake(self.view.center.x - 50, self.view.center.y + 70))
            
                lastpath.addLineToPoint(CGPointMake(self.view.center.x + 50, self.view.center.y + 70))
            
            
            lastpath.addLineToPoint(CGPointMake(self.view.center.x + 100, self.view.center.y))
            
            
            
            
         
            
            
            //中间的直线
            
            var lastshape = CAShapeLayer()
            
            lastshape.path = lastpath.CGPath
            
            lastshape.strokeColor = UIColor.redColor().CGColor
            
            lastshape.strokeEnd = 0.0
            
            lastshape.lineWidth = 2.0
            
            lastshape.fillColor = UIColor.clearColor().CGColor
            
            self.view.layer.addSublayer(lastshape)
            
            
            self.shape?.path = lastpath.CGPath
            
            
            self.shape?.addAnimation(basicAnmiation, forKey: nil)

            
        }
        
    
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

