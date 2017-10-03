//
//  Employee.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Employee {
    let type: EmployeeType
    let firstName: String?
    let lastName: String?
    let address: String?
    let city: String?
    let state: String?
    let zipCode: Int?
    
    init(type: EmployeeType, firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: Int?) throws {
        guard firstName != "", lastName != "" else {throw EntrantError.missingName("Missing Name")}
        guard firstName != nil, lastName != nil else {throw EntrantError.missingName("Missing Name")}
        guard address != "" else {throw EntrantError.missingAddress("Missing Address")}
        guard address != nil else {throw EntrantError.missingAddress("Missing Address")}
        guard city != "" else {throw EntrantError.missingCity("Missing City")}
        guard city  != nil else {throw EntrantError.missingCity("Missing City")}
        guard state != "" else {throw EntrantError.missingState("Missing State")}
        guard state != nil else {throw EntrantError.missingState("Missing State")}
        guard zipCode != nil else {throw EntrantError.missingZipCode("Missing Zip Code")}
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
}










































