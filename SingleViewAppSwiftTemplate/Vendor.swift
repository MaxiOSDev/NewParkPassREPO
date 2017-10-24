//
//  Vendor.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 10/24/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Vendor: Entrant, Discount {
    
    var firstName: String?
    var lastName: String?
    var areaAccess: [AreaAccess] = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenenceAreas, .office]
    var type: EntrantType
    
    var company: String?
    var dob: String?
    var dov: String?
    
    var foodDiscount: Int = 0
    var merchDiscount: Int = 0
    
    init(firstName: String?, lastName: String?, type: EntrantType, company: String?, dob: String?, dov: String?) throws {
        guard firstName != "", firstName != nil else { throw EntrantError.missingFirstName }
        guard lastName != "", lastName != nil else { throw EntrantError.missingLastName }
        guard dob != "", dob != nil else { throw EntrantError.missingBirthday }
        guard dov != "", dov != nil else { throw EntrantError.missingDov }
        self.firstName = firstName
        self.lastName = lastName
        self.type = type
        self.company = company
        self.dob = dob
        self.dov = dov
    }
    
    func checkBirthday() { // Checks Birthday Succesfully
        let today = Date()
        let components = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let formattedBirthday = dateFormatter.date(from: dob!)
        let todayComponents = components.dateComponents([.month, .day], from: today)
        let birthdayComponents = components.dateComponents([.month, .day], from: formattedBirthday!)
        
        if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
            print("Happy Birthday!")
        } else {
            print("Its not your birthday!")
        }
    }
    
    func swipe(area: AreaAccess) -> Bool {
        return false
    }
    
    
}

class VendorAcme: Vendor {
    
    override init(firstName: String?, lastName: String?, type: EntrantType = .acme, company: String?, dob: String?, dov: String?) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, company: company, dob: dob, dov: dov)
        self.type = .acme
    }
    
    override func swipe(area: AreaAccess) -> Bool {
        for _ in areaAccess {
            if swipeTimer.isTimerRunning == true {
                print("Please wait and try again to swipe for area, \(area.rawValue)")
                return true
            }
            if area == .kitchenAreas && type == .acme &&  swipeTimer.isTimerRunning == false {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
                print("___________________________________")
                return true
            } else {
                print("Access Rejected for \(type.rawValue) for area \(area.rawValue)")
                print("___________________________________")
                return false
            }
        }
        return false
    }

}


class VendorOrkin: Vendor {
    override init(firstName: String?, lastName: String?, type: EntrantType = .orkin, company: String?, dob: String?, dov: String?) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, company: company, dob: dob, dov: dov)
        self.type = .orkin
    }
    
    override func swipe(area: AreaAccess) -> Bool {
        for _ in areaAccess {
            if swipeTimer.isTimerRunning == true {
                print("Please wait and try again to swipe for area, \(area.rawValue)")
                return true
            }
            if area == .amusementAreas && type == .orkin &&  swipeTimer.isTimerRunning == false || area == .rideControlAreas && type == .orkin && swipeTimer.isTimerRunning == false || area == .kitchenAreas && type == .orkin && swipeTimer.isTimerRunning == false {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
                print("___________________________________")
                return true
            } else {
                print("Access Rejected for \(type.rawValue) for area \(area.rawValue)")
                print("___________________________________")
                return false
            }
        }
        return false
    }

    
    
}

class VendorFedex: Vendor {
    
    override init(firstName: String?, lastName: String?, type: EntrantType = .fedex, company: String?, dob: String?, dov: String?) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, company: company, dob: dob, dov: dov)
        self.type = .fedex
    }
    
    override func swipe(area: AreaAccess) -> Bool {
        for _ in areaAccess {
            if swipeTimer.isTimerRunning == true {
                print("Please wait and try again to swipe for area, \(area.rawValue)")
                return true
            }
            if area == .maintenenceAreas && type == .fedex &&  swipeTimer.isTimerRunning == false || area == .office && type == .fedex && swipeTimer.isTimerRunning == false {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
                print("___________________________________")
                return true
            } else {
                print("Access Rejected for \(type.rawValue) for area \(area.rawValue)")
                print("___________________________________")
                return false
            }
        }
        return false
    }

}

class VendorNWElectrical: Vendor {
    
    override init(firstName: String?, lastName: String?, type: EntrantType = .nwElectrical, company: String?, dob: String?, dov: String?) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, company: company, dob: dob, dov: dov)
        self.type = .nwElectrical
    }
    
    override func swipe(area: AreaAccess) -> Bool {
        for _ in areaAccess {
            if swipeTimer.isTimerRunning == true {
                print("Please wait and try again to swipe for area, \(area.rawValue)")
                return true
            }
            
            if area == .amusementAreas && type == .nwElectrical &&  swipeTimer.isTimerRunning == false || area == .rideControlAreas && type == .nwElectrical && swipeTimer.isTimerRunning == false || area == .kitchenAreas && type == .nwElectrical && swipeTimer.isTimerRunning == false || area == .maintenenceAreas && type == .nwElectrical && swipeTimer.isTimerRunning == false || area == .office && type == .nwElectrical && swipeTimer.isTimerRunning == false {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
                print("___________________________________")
                return true
            } else {
                print("Access Rejected for \(type.rawValue) for area \(area.rawValue)")
                print("___________________________________")
                return false
            }
        }
        return false
    }

    
}




























