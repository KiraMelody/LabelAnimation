//
//  ViewController.swift
//  LabelAnimation
//
//  Created by TJQ on 16/8/7.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit
import UICountingLabel

class ViewController: UIViewController {
    var textLabel = UITransitionLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(textLabel)
        textLabel.transitFromTo(0, endNum: 10)
//        textLabel.format = "%d"
//        textLabel.method = .Linear
//        textLabel.countFrom(5, to: 15, withDuration: 10)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

