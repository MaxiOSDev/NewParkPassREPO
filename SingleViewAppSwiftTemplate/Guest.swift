//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

let insideTimer = ViewController()
var granted = true
class Guest: Entrant, Discount {
    var firstName: String?
    var lastName: String?
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var type: EntrantType
    var birthday: String?
    var skipLines: Bool
    var foodDiscount: Int
    var merchDiscount: Int
    init(firstName: String?, lastName: String?, type: EntrantType, birthday: String?, skipLines: Bool = true, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        guard firstName != "", firstName != nil else { throw EntrantError.missingFirstName }
        guard lastName != "", lastName != nil else { throw EntrantError.missingLastName }
        guard birthday != "", birthday != nil else { throw EntrantError.missingBirthday }
        self.firstName = firstName
        self.lastName = lastName
        self.type = type
        self.birthday = birthday
        self.skipLines = skipLines
        self.foodDiscount = foodDiscount
        self.merchDiscount = merchDiscount
    }
    
    
    
     func swipe(_ area: AreaAccess) -> Bool {
        let when = DispatchTime.now() + 5
        if granted == true {
        for access in areaAccess {
        if access == .amusementAreas && type == .classic || access == .amusementAreas && type == .vip || access == .amusementAreas && type == .child {
            granted = false
            DispatchQueue.main.asyncAfter(deadline: when) {
                granted = true
                isTimerRunning = false
                timer.invalidate()
            }
            checkBirthday()
            checkDiscount()
            checkRideAccess()
            print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
            print("__________________________________")
            insideTimer.runTimer()
            granted = true
            isTimerRunning = true
            return true
                }
            }
        }
            print("Access Rejected")
            return false
    }

    func checkBirthday() {
        let today = Date()
        let components = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let formattedBirthday = dateFormatter.date(from: birthday!)
        let todayComponents = components.dateComponents([.month, .day], from: today)
        let birthdayComponents = components.dateComponents([.month, .day], from: formattedBirthday!)
        
        if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
            print("Happy Birthday!")
        } else {
            print("Its not your birthday!")
        }
    }
    
    func checkRideAccess() {
        
        if skipLines == true {
            print("\(RideAccess.skipLines.rawValue)")
         //   return "\(RideAccess.skipLines.rawValue)"
        } else {
            print("\(RideAccess.allRides.rawValue)")
         //   return "\(RideAccess.allRides.rawValue)"
        }
    }
    
    
    
    }

class ClassicGuest: Guest {
    
    override init(firstName: String?, lastName: String?, type: EntrantType, birthday: String?, skipLines: Bool = false, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        try! super.init(firstName: firstName, lastName: lastName, type: .classic, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
        
    }
    /*
    override func swipe(area: AreaAccess) -> Bool {
        let when = DispatchTime.now() + 0
        
        DispatchQueue.main.asyncAfter(deadline: when) {
            if area == .amusementAreas && self.type == .classic {
                self.checkBirthday()
                self.checkDiscount()
                self.checkRideAccess()
                print("Access Granted for \(self.type.rawValue) for area, \(area.rawValue)")
                print("--------------------------------------")
                
            } else {
                print("Access Rejected")
            }
        }
        print("Please Wait 5 seconds before next swipe")
        
    }
    */
}

class VIPGuest: Guest {
    
    override init(firstName: String?, lastName: String?, type: EntrantType, birthday: String?, skipLines: Bool = true, foodDiscount: Int = 10, merchDiscount: Int = 20) throws {
        try! super.init(firstName: firstName, lastName: lastName, type: .vip, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount,merchDiscount: merchDiscount)
    }
    /*
    override func swipe(area: AreaAccess) -> Bool {
        let when = DispatchTime.now() + 5
        
        DispatchQueue.main.asyncAfter(deadline: when) {
            if area == .amusementAreas && self.type == .vip {
                self.checkBirthday()
                self.checkDiscount()
                self.checkRideAccess()
                print("Access Granted for \(self.type.rawValue) for area, \(area.rawValue)")
                print("--------------------------------------")
                
            } else {
                print("Access Rejected")
            }
        }
        print("Please Wait 5 seconds before next swipe")
        
    }
    */
}

class ChildGuest: Guest {
    
    override init(firstName: String?, lastName: String?, type: EntrantType, birthday: String?, skipLines: Bool = false, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        try! super.init(firstName: firstName, lastName: lastName, type: .child, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
    /*
    override func swipe(area: AreaAccess) -> Bool {
        let when = DispatchTime.now() + 10
        
        DispatchQueue.main.asyncAfter(deadline: when) {
            if area == .amusementAreas && self.type == .child {
                self.checkBirthday()
                self.checkDiscount()
                self.checkRideAccess()
                print("Access Granted for \(self.type.rawValue) for area, \(area.rawValue)")
                print("--------------------------------------")
                
            } else {
                print("Access Rejected")
            }
        }
       
        
    }
 */
}












































