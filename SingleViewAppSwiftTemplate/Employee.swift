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
    
    init(name: String?, type: EntrantType, address: String?, city: String?, state: String?, zipCode: Int?) throws {
        guard name != "", name != nil else { throw EntrantError.missingName }
        guard address != "", address != nil else { throw EntrantError.missingAddress }
        guard city != "", city != nil else { throw EntrantError.missingCity }
        guard state != "", state != nil else { throw EntrantError.missingState }
        guard zipCode != nil else { throw EntrantError.missingZip }
        self.name = name
        self.type = type
        self.address = address
        self.state = state
        self.zipCode = zipCode
    }
    
    func checkAccess(_ access: EntrantType) -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas || area == .kitchenAreas || area == .rideControlAreas || area == .maintenenceAreas || area == .office {
                return (true, "Access Granted for \(type)")
            }
        }
        return (false, "ACCESS REJECTED")
    }
}

class FoodServices: Employee {
    
    override init(name: String?, type: EntrantType = .foodServices, address: String?, city: String?, state: String?, zipCode: Int?) {
        try! super.init(name: name, type: type, address: address, city: city, state: state, zipCode: zipCode)
    }
    
    override func checkAccess(_ access: EntrantType) -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas || area == .kitchenAreas {
                return (true, "Access Granted for \(type)")
            }
        }
        return (false, "ACCESS REJECTED")
    }
}

class RideControl: Employee {
    
    override init(name: String?, type: EntrantType = .rideControl, address: String?, city: String?, state: String?, zipCode: Int?) {
        try! super.init(name: name, type: type, address: address, city: city, state: state, zipCode: zipCode)
    }
    
    override func checkAccess(_ access: EntrantType) -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas || area == .rideControlAreas {
                return (true, "Access Granted for \(type)")
            }
        }
        return (false, "ACCESS REJECTED")
    }
}

class Maintenance: Employee {
    
    override init(name: String?, type: EntrantType = .maintenence, address: String?, city: String?, state: String?, zipCode: Int?) {
        try! super.init(name: name, type: type, address: address, city: city, state: state, zipCode: zipCode)
    }
    
    override func checkAccess(_ access: EntrantType) -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas || area == .kitchenAreas || area == .rideControlAreas || area == .maintenenceAreas {
                return (true, "Access Granted for \(type)")
            }
        }
        return (false, "ACCESS REJECTED")
    }
}

class EmployeeManager: Employee {
    
    override init(name: String?, type: EntrantType = .manager, address: String?, city: String?, state: String?, zipCode: Int?) {
        try! super.init(name: name, type: type, address: address, city: city, state: state, zipCode: zipCode)
    }
}










































