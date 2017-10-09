//
//  Employee.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Employee: Entrant, Discount, Swipe {
    var skipLines: Bool = false
    
    var firstName: String?
    var lastName: String?
    var address: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    var areaAccess: [AreaAccess] = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenenceAreas, .office]
    var type: EntrantType
    var birthday: String?
    var foodDiscount: Int
    var merchDiscount: Int
    init(firstName: String?, lastName: String?, type: EntrantType, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
        guard firstName != "", firstName != nil else { throw EntrantError.missingFirstName }
        guard lastName != "", lastName != nil else { throw EntrantError.missingLastName }
        guard address != "", address != nil else { throw EntrantError.missingAddress }
        guard city != "", city != nil else { throw EntrantError.missingCity }
        guard state != "", state != nil else { throw EntrantError.missingState }
        guard zipCode != nil else { throw EntrantError.missingZip }
        guard birthday != "", birthday != nil else { throw EntrantError.missingBirthday }
        self.firstName = firstName
        self.lastName = lastName
        self.type = type
        self.address = address
        self.state = state
        self.zipCode = zipCode
        self.birthday = birthday
        self.foodDiscount = foodDiscount
        self.merchDiscount = merchDiscount
    }
    
    func swipe(area: AreaAccess) {
        if (area == .amusementAreas && type == .classic) || (area == .amusementAreas && type == .vip) || (area == .amusementAreas && type == .child) || (area == .amusementAreas && type == .foodServices) || (area == .amusementAreas && type == .rideControl) || (area == .amusementAreas && type == .maintenence) || (area == .amusementAreas && type == .manager) {
            // checkAccess()
            print("Access Granted for area \(area.rawValue)")
        }
        
        if (area == .kitchenAreas && type == .classic) || (area == .kitchenAreas && type == .vip) || (area == .kitchenAreas && type == .child) || (area == .kitchenAreas && type == .foodServices) || (area == .kitchenAreas && type == .rideControl) || (area == .kitchenAreas && type == .maintenence) || (area == .kitchenAreas && type == .manager) {
            // checkAccess()
            print("Access Granted for area \(area.rawValue)")
        }
        
        if (area == .rideControlAreas && type == .classic) || (area == .rideControlAreas && type == .vip) || (area == .rideControlAreas && type == .child) || (area == .rideControlAreas && type == .foodServices) || (area == .rideControlAreas && type == .rideControl) || (area == .rideControlAreas && type == .maintenence) || (area == .rideControlAreas && type == .manager) {
            // checkAccess()
            print("Access Granted for area \(area.rawValue)")
        }
        
        if (area == .maintenenceAreas && type == .classic) || (area == .maintenenceAreas && type == .vip) || (area == .maintenenceAreas && type == .child) || (area == .maintenenceAreas && type == .foodServices) || (area == .maintenenceAreas && type == .rideControl) || (area == .maintenenceAreas && type == .maintenence) || (area == .maintenenceAreas && type == .manager) {
            // checkAccess()
            print("Access Granted for area \(area.rawValue)")
        } else {
            
        }
        
        if (area == .office && type == .classic) || (area == .office && type == .vip) || (area == .office && type == .child) || (area == .office && type == .foodServices) || (area == .office && type == .rideControl) || (area == .office && type == .maintenence) || (area == .office && type == .manager) {
            // checkAccess()
            print("Access Granted for area \(area.rawValue)")
        }
        
        
        
        
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
        //    return "\(RideAccess.skipLines.rawValue)"
        } else {
            print("\(RideAccess.allRides.rawValue)")
        //    return "\(RideAccess.allRides.rawValue)"
        }
    }
    
    
}

class FoodServices: Employee {

    override init(firstName: String?, lastName: String?, type: EntrantType = .foodServices, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 15, merchDiscount: Int = 25) {
        
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
        self.type = .foodServices
    }
    
    override func swipe(area: AreaAccess) {
        if area == .amusementAreas && type == .foodServices || area == .kitchenAreas && type == .foodServices {
            print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
            checkBirthday()
            checkDiscount()
            checkRideAccess()
            print("___________________________________")
        } else {
            print("Access Rejected for \(type.rawValue)")
            print("___________________________________")
        }
    }
}

class RideControl: Employee {
       override init(firstName: String?, lastName: String?, type: EntrantType = .rideControl, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 15, merchDiscount: Int = 25) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
    
    override func swipe(area: AreaAccess) {
        if area == .amusementAreas && type == .rideControl || area == .rideControlAreas && type == .rideControl {
            print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
            checkBirthday()
            checkDiscount()
            checkRideAccess()
            print("___________________________________")
        } else {
            print("Access Rejected for \(type.rawValue)")
            print("___________________________________")
        }
    }
    
}

class Maintenance: Employee {
    override init(firstName: String?, lastName: String?, type: EntrantType = .maintenence, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 15, merchDiscount: Int = 25) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
    
    override func swipe(area: AreaAccess) {
        if area == .amusementAreas && type == .maintenence || area == .kitchenAreas && type == .maintenence || area == .rideControlAreas && type == .maintenence || area == .maintenenceAreas && type == .maintenence {
            print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
            checkBirthday()
            checkDiscount()
            checkRideAccess()
            print("___________________________________")
        } else {
            print("Access Rejected for \(type.rawValue)")
            print("___________________________________")
        }
    }
}

class EmployeeManager: Employee {
    
    override init(firstName: String?, lastName: String?, type: EntrantType = .manager, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 25, merchDiscount: Int = 25) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
    
    override func swipe(area: AreaAccess) {
        if area == .amusementAreas && type == .manager || area == .kitchenAreas && type == .manager || area == .rideControlAreas && type == .manager || area == .maintenenceAreas && type == .manager || area == .office && type == .manager {
            print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
            checkBirthday()
            checkDiscount()
            checkRideAccess()
            print("___________________________________")
        } else {
            print("Access Rejected for \(type.rawValue)")
            print("___________________________________")
        }
    }
    
}










































