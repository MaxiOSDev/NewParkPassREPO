//
//  SwipeTimer.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 10/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


class TimeKeeper {
    var timer = Timer()
    var seconds = 5
    var isTimerRunning: Bool = false
     func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeKeeper.updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            if isTimerRunning == true {
                timer.invalidate()
                print("Go Ahead and swipe again!")
            }
        } else {
            seconds -= 1
            print(seconds)
        }
    }
}

