//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Guest: Entrant, CheckAccess, Discount {
    var name: String?
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var type: EntrantType
    var birthday: String?
    var skipLines: Bool
    var foodDiscount: Int
    var merchDiscount: Int
    init(name: String?, type: EntrantType, birthday: String?, skipLines: Bool = true, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        guard name != "", name != nil else { throw EntrantError.missingName }
        guard birthday != "", birthday != nil else { throw EntrantError.missingBirthday }
        self.name = name
        self.type = type
        self.birthday = birthday
        self.skipLines = skipLines
        self.foodDiscount = foodDiscount
        self.merchDiscount = merchDiscount
    }
    
    func checkAccess() -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas {
                checkBirthday()
                checkRideAccess()
                print("Access Granted for \(type.rawValue)")
                return (true, "Access Granted for \(type.rawValue)")
            }
        }
        
        checkRideAccess()
        checkBirthday()
        print("Access Rejected")
        return (false, "ACCESS REJECTED")
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
    
    func checkRideAccess() -> String {
        
        if skipLines == true {
            print("\(RideAccess.skipLines.rawValue)")
            return "\(RideAccess.skipLines.rawValue)"
        } else {
            print("\(RideAccess.allRides.rawValue)")
            return "\(RideAccess.allRides.rawValue)"
        }
    }
    
    
    
}

class ClassicGuest: Guest {
    
    override init(name: String?, type: EntrantType, birthday: String?, skipLines: Bool = false, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        try! super.init(name: name, type: .classic, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
        
    }
    
    
}

class VIPGuest: Guest {
    
    override init(name: String?, type: EntrantType, birthday: String?, skipLines: Bool = true, foodDiscount: Int = 10, merchDiscount: Int = 20) throws {
        try! super.init(name: name, type: .vip, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount,merchDiscount: merchDiscount)
    }
    
}

class ChildGuest: Guest {
    
    override init(name: String?, type: EntrantType, birthday: String?, skipLines: Bool = false, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        try! super.init(name: name, type: .child, birthday: birthday, skipLines: skipLines, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
}











































