//
//  UITransitionLabel.swift
//  LabelAnimation
//
//  Created by TJQ on 16/8/7.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import Foundation
import UICountingLabel

class UITransitionLabel: UILabel
{
    var startNum: CGFloat?
    var endNum: CGFloat?
    var progress: NSTimeInterval = 0
    var nowTime: NSTimeInterval?
    var lastTime: NSTimeInterval?
    var duration: NSTimeInterval? = 0
    var currentValue: CGFloat = 0
    var format: String = "%f"
    var timer: CADisplayLink?
    func transitFromTo(startNum: CGFloat, endNum: CGFloat)
    {
        self.startNum = startNum
        self.endNum = endNum
        if duration == 0 {
            self.duration = 5
        }
        
        self.nowTime = NSDate.timeIntervalSinceReferenceDate()
        self.lastTime = NSDate.timeIntervalSinceReferenceDate()
        print("\(self.lastTime!)")
        self.timer = CADisplayLink(target: self, selector: #selector(UITransitionLabel.update))
        self.timer!.frameInterval = 2
        self.timer!.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        self.timer!.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: UITrackingRunLoopMode)
        
    }
    
    func update() {
        let now = NSDate.timeIntervalSinceReferenceDate()
        self.progress += now - self.lastTime!
        self.lastTime = now
        if self.progress >= self.duration {
            self.timer = nil
        }
        self.currentValue = setCurrentValue()
        self.text = String(self.currentValue)
        
    }
    func setCurrentValue() -> CGFloat
    {
        if self.progress >= self.duration {
            return self.endNum!
        }
        let ratio = CGFloat(self.progress / self.duration!)
        return self.startNum! + ratio * (self.endNum! - self.startNum!)
    }
}