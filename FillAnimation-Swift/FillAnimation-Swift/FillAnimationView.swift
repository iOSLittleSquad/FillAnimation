//
//  FillAnimationView.swift
//  FillAnimation-Swift
//
//  Created by 黄少华 on 16/2/23.
//  Copyright © 2016年 黄少华. All rights reserved.
//

import UIKit

class FillAnimationView: UIView {

    private let width:CGFloat = 104.0
    private let height:CGFloat = 157.0
    
    private var isAnimating:Bool = false
    
    let maskLayer = CAShapeLayer()
    
    let foregroundImageView = UIImageView(image: UIImage(named: "group2"));
    let backgroundImageView = UIImageView(image: UIImage(named: "group1"));
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        maskLayer.path = UIBezierPath(rect: frame).CGPath
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.addSubview(backgroundImageView)
        
        foregroundImageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        foregroundImageView.layer.mask = maskLayer
        self.addSubview(foregroundImageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimate(){
        isAnimating = true
        let fromPath = UIBezierPath(rect: self.bounds).CGPath
        let toPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: width, height: 0))
        
        maskLayer.path = fromPath
        maskLayer.speed = 1
        maskLayer.removeAllAnimations()
        
        let basicAnimate = CABasicAnimation(keyPath: "path")
        basicAnimate.fromValue = fromPath
        basicAnimate.toValue = toPath
        basicAnimate.duration = 5
        maskLayer.addAnimation(basicAnimate, forKey: "pathAnimate")
        
        maskLayer.path = toPath.CGPath
    }
    
    func stopAnimate(){
        isAnimating = false
        let stopTime = maskLayer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        maskLayer.speed = 0
        maskLayer.timeOffset = stopTime
    }
    
    func resumeAnimate(){
        if isAnimating {
            return
        }
        isAnimating = true
        let stopTime = maskLayer.timeOffset
        maskLayer.speed = 1
        maskLayer.timeOffset = 0
        maskLayer.beginTime = 0
        let timeSinceStop = maskLayer.convertTime(CACurrentMediaTime(), fromLayer: nil) - stopTime
        maskLayer.beginTime = timeSinceStop
    }
}
