//
//  Employee.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Employee: Entrant, CheckAccess {
    let skipLines: Bool = false
    
    var name: String?
    var address: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    var areaAccess: [AreaAccess] = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenenceAreas, .office]
    var type: EntrantType
    var birthday: String?
    init(name: String?, type: EntrantType, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?) throws {
        guard name != "", name != nil else { throw EntrantError.missingName }
        guard address != "", address != nil else { throw EntrantError.missingAddress }
        guard city != "", city != nil else { throw EntrantError.missingCity }
        guard state != "", state != nil else { throw EntrantError.missingState }
        guard zipCode != nil else { throw EntrantError.missingZip }
        guard birthday != "", birthday != nil else { throw EntrantError.missingBirthday }
        self.name = name
        self.type = type
        self.address = address
        self.state = state
        self.zipCode = zipCode
        self.birthday = birthday
    }
    
    func checkAccess() -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas || area == .kitchenAreas || area == .rideControlAreas || area == .maintenenceAreas || area == .office {
                checkBirthday()
                checkRideAccess()
                print("Acceess Granted for \(type.rawValue)")
                return (true, "Access Granted for \(type.rawValue)")
            }
        }
        print("ACCESS REJECTED")
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

class FoodServices: Employee, Discount {
    var foodDiscount: Int = 15
    var merchDiscount: Int = 25
    override init(name: String?, type: EntrantType = .foodServices, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?) {
        try! super.init(name: name, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday)
    }
    
    override func checkAccess() -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas || area == .kitchenAreas {
                checkBirthday()
                print("Acceess Granted for \(type.rawValue)")
                return (true, "Access Granted for \(type.rawValue)")
            }
        }
        print("ACCESS REJECTED")
        return (false, "ACCESS REJECTED")
    }
}

class RideControl: Employee, Discount {
    var foodDiscount: Int = 15
    var merchDiscount: Int = 25
    override init(name: String?, type: EntrantType = .rideControl, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?) {
        try! super.init(name: name, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday)
    }
    
    override func checkAccess() -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas || area == .rideControlAreas {
                checkBirthday()
                print("Acceess Granted for \(type.rawValue)")
                return (true, "Access Granted for \(type.rawValue)")
            }
        }
        print("ACCESS REJECTED")
        return (false, "ACCESS REJECTED")
    }
}

class Maintenance: Employee, Discount {
    var foodDiscount: Int = 15
    var merchDiscount: Int = 25
    override init(name: String?, type: EntrantType = .maintenence, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?) {
        try! super.init(name: name, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday)
    }
    
    override func checkAccess() -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas || area == .kitchenAreas || area == .rideControlAreas || area == .maintenenceAreas {
                checkBirthday()
                print("Acceess Granted for \(type.rawValue)")
                return (true, "Access Granted for \(type.rawValue)")
            }
        }
        print("ACCESS REJECTED")
        return (false, "ACCESS REJECTED")
    }
}

class EmployeeManager: Employee, Discount {
    var foodDiscount: Int = 25
    var merchDiscount: Int = 25
    override init(name: String?, type: EntrantType = .manager, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?) {
        try! super.init(name: name, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday)
    }
}










































