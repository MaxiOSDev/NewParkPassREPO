//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
// Guest Object that conforms to Entrant and Discount Protocols
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
    
    
    
    func swipe(_ area: AreaAccess) -> Bool { // Swipe method that functions for Guest instances. Used to have a protocol with swipe(_ area: AreaAccess)
        for _ in areaAccess {
            if swipeTimer.isTimerRunning == true {
                print("Please Wait and try again to swipe for area, \(area.rawValue)")
                return true
            }
        if area == .amusementAreas && type == .classic && swipeTimer.isTimerRunning == false || area == .amusementAreas && type == .vip && swipeTimer.isTimerRunning == false || area == .amusementAreas && type == .child && swipeTimer.isTimerRunning == false {
            swipeTimer.startTimer()
            checkBirthday()
            checkDiscount()
            checkRideAccess()
            print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
            print("__________________________________")
            
            return true
        } else {
            print("Access Rejected for \(type.rawValue) for area \(area.rawValue)")
            print("__________________________________")
            return false

            }
        }
        return false
    }

    func checkBirthday() { // Checks Entrants Birthday Successfully
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
    
    func checkRideAccess() { // Checks Entrants Ride Access Succesfully
        
        if skipLines == true {
            print("\(RideAccess.skipLines.rawValue)")
         //   return "\(RideAccess.skipLines.rawValue)"
        } else {
            print("\(RideAccess.allRides.rawValue)")
         //   return "\(RideAccess.allRides.rawValue)"
        }
    }
    
    
    
    }

class ClassicGuest: Guest { // sub class
    
    override init(firstName: String?, lastName: String?, type: EntrantType, birthday: String?, skipLines: Bool = false, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        try super.init(firstName: firstName, lastName: lastName, type: .classic, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
        
    }

}

class VIPGuest: Guest { // sub class
    
    override init(firstName: String?, lastName: String?, type: EntrantType, birthday: String?, skipLines: Bool = true, foodDiscount: Int = 10, merchDiscount: Int = 20) throws {
        try super.init(firstName: firstName, lastName: lastName, type: .vip, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount,merchDiscount: merchDiscount)
    }
 
}

class ChildGuest: Guest { // sub class
    
    override init(firstName: String?, lastName: String?, type: EntrantType, birthday: String?, skipLines: Bool = false, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        try super.init(firstName: firstName, lastName: lastName, type: .child, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }

}

class SeniorGuest: Guest {
    override init(firstName: String?, lastName: String?, type: EntrantType, birthday: String?, skipLines: Bool = true, foodDiscount: Int = 10, merchDiscount: Int = 10) throws {
        try super.init(firstName: firstName, lastName: lastName, type: .senior, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
}













































