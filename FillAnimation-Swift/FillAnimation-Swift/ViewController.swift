//
//  ViewController.swift
//  FillAnimation-Swift
//
//  Created by 黄少华 on 16/2/23.
//  Copyright © 2016年 黄少华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let fillAnimateView = FillAnimationView(frame: CGRect(x: 100.0, y: 100.0, width: 104.0, height: 157.0))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(fillAnimateView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(sender: AnyObject) {
        fillAnimateView.startAnimate()
    }

    @IBAction func stop(sender: AnyObject) {
        fillAnimateView.stopAnimate()
    }
    
    @IBAction func resume(sender: AnyObject) {
        fillAnimateView.resumeAnimate()
    }
}

