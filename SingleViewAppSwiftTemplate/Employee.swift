//
//  Employee.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// Employee Object
class Employee: Entrant, Discount {
    var skipLines: Bool = false // None of them can skip...lol
    
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
        self.city = city
        self.zipCode = zipCode
        self.birthday = birthday
        self.foodDiscount = foodDiscount
        self.merchDiscount = merchDiscount
    }
    
    func swipe(area: AreaAccess) -> Bool { // A very unneeded swipe mehtod. I override it anyway. has old implementation anyway
        return false
    }
    
    func checkBirthday() { // Checks Birthday Succesfully
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
    
    func checkRideAccess() { // Check Ride Access Successfully
        
        if skipLines == true {
            print("\(RideAccess.skipLines.rawValue)")
        //    return "\(RideAccess.skipLines.rawValue)"
        } else {
            print("\(RideAccess.allRides.rawValue)")
        //    return "\(RideAccess.allRides.rawValue)"
        }
    }
    
    
}

class FoodServices: Employee { // Sub Class of Employee

     override init(firstName: String?, lastName: String?, type: EntrantType = .foodServices, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 15, merchDiscount: Int = 25) {
        
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
        self.type = .foodServices
    }
    
    override func swipe(area: AreaAccess) -> Bool { // Overrides. Thus ploymorphic
            for _ in areaAccess {
                if swipeTimer.isTimerRunning == true {
                    print("Please wait and try again to swipe for area, \(area.rawValue)")
                    return true
                }
            if area == .amusementAreas && type == .foodServices &&  swipeTimer.isTimerRunning == false || area == .kitchenAreas && type == .foodServices && swipeTimer.isTimerRunning == false {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                checkRideAccess()
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

class RideControl: Employee { // Sub Class of Employee
       override init(firstName: String?, lastName: String?, type: EntrantType = .rideControl, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 15, merchDiscount: Int = 25) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
    
    override func swipe(area: AreaAccess) -> Bool { // Overrides. Thus ploymorphic
            for _ in areaAccess {
                if swipeTimer.isTimerRunning == true {
                    print("Please wait and try again to swipe for area, \(area.rawValue)")
                    return true
                }
            if area == .amusementAreas && type == .rideControl && swipeTimer.isTimerRunning == false || area == .rideControlAreas && type == .rideControl && swipeTimer.isTimerRunning == false {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                checkRideAccess()
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

class Maintenance: Employee { // Sub Class of Employee
    override init(firstName: String?, lastName: String?, type: EntrantType = .maintenence, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 15, merchDiscount: Int = 25) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
    
    override func swipe(area: AreaAccess) -> Bool { // Overrides. Thus ploymorphic
            for _ in areaAccess {
                if swipeTimer.isTimerRunning == true {
                    print("Please wait and try again to swipe for area, \(area.rawValue)")
                    return true
                }
                if area == .amusementAreas && type == .maintenence && swipeTimer.isTimerRunning == false || area == .kitchenAreas && type == .maintenence && swipeTimer.isTimerRunning == false || area == .rideControlAreas && type == .maintenence && swipeTimer.isTimerRunning == false || area == .maintenenceAreas && type == .maintenence && swipeTimer.isTimerRunning == false {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                checkRideAccess()
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

class EmployeeManager: Employee { // Sub Class of Employee
    
    override init(firstName: String?, lastName: String?, type: EntrantType = .manager, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 25, merchDiscount: Int = 25) {
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
    }
    
    override func swipe(area: AreaAccess) -> Bool { // Overrides. Thus ploymorphic
            for _ in areaAccess {
                if swipeTimer.isTimerRunning == true {
                    print("Please wait and try again to swipe for area, \(area.rawValue)")
                    return true
                }
            if area == .amusementAreas && type == .manager && swipeTimer.isTimerRunning == false || area == .kitchenAreas && type == .manager && swipeTimer.isTimerRunning == false || area == .rideControlAreas && type == .manager && swipeTimer.isTimerRunning == false || area == .maintenenceAreas && type == .manager && swipeTimer.isTimerRunning == false || area == .office && type == .manager && swipeTimer.isTimerRunning == false {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                checkRideAccess()
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

class ContractEmployee: Employee {
    
    var projectsNumbers: [Int?] = [1001, 1002, 1003, 2001, 2002]
    
        init(projectNum: [Int?], firstName: String?, lastName: String?, type: EntrantType = .contractEmployee, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?, foodDiscount: Int = 0, merchDiscount: Int = 0) throws {
            guard projectNum != nil else { throw EntrantError.missingProjectNum }
        try! super.init(firstName: firstName, lastName: lastName, type: type, address: address, city: city, state: state, zipCode: zipCode, birthday: birthday, foodDiscount: foodDiscount, merchDiscount: merchDiscount)
        self.projectsNumbers = projectNum
    }
    
    override func swipe(area: AreaAccess) -> Bool {
        for projectNum in projectsNumbers {
            if swipeTimer.isTimerRunning == true {
                print("Please wait and try again to swipe for area, \(area.rawValue)")
                return true
            }
           if projectNum == projectsNumbers[0] && (area == .amusementAreas || area == .rideControlAreas) {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                checkRideAccess()
                print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
                print("___________________________________")
                return true
            } else if projectNum == projectsNumbers[1] && (area == .amusementAreas || area == .rideControlAreas || area == .maintenenceAreas) {
                swipeTimer.startTimer()
                checkBirthday()
                checkDiscount()
                checkRideAccess()
                print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
                print("___________________________________")
                return true
           } else if projectNum == projectsNumbers[2] && (area == .amusementAreas || area == .rideControlAreas || area == .kitchenAreas || area == .maintenenceAreas || area == .office) {
            swipeTimer.startTimer()
            checkBirthday()
            checkDiscount()
            checkRideAccess()
            print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
            print("___________________________________")
            return true
            } else if projectNum == projectsNumbers[3] && area == .office {
            swipeTimer.startTimer()
            checkBirthday()
            checkDiscount()
            checkRideAccess()
            print("Access Granted for \(type.rawValue) for area, \(area.rawValue)")
            print("___________________________________")
            return true
           } else if projectNum == projectsNumbers[4] && (area == .kitchenAreas || area == .maintenenceAreas) {
            swipeTimer.startTimer()
            checkBirthday()
            checkDiscount()
            checkRideAccess()
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








































