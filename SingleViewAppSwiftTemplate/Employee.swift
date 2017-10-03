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
    let firstName: String
    let lastName: String
    let birthday: String?
    let address: String?
    let city: String?
    let state: String?
    let zipCode: Int?
    
    init(type: EmployeeType, firstName: String, lastName: String, address: String?, city: String?, state: String?, zipCode: Int?, birthday: String?) {
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.birthday = birthday
    }
}










































