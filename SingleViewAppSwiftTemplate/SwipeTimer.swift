//
//  SwipeTimer.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 10/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// Object that keeps runs timer and stops it with if statment.
class TimeKeeper {
    var timer = Timer()
    var seconds = 5
    var isTimerRunning: Bool = false
     func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeKeeper.updateTimer), userInfo: nil, repeats: true) // The #selector part was the part I didn't understand
        isTimerRunning = true
    }
    
    @objc func updateTimer() { // AT first I was very confused on this part but I got the hang of it, needed @objc.
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
let swipeTimer = TimeKeeper() // So I can use the methods and properites of the object TimerKeeper in my Guest and Employee Classes.

