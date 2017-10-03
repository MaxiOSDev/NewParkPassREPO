//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Guest {
    let type: GuestType
    let firstName: String?
    let lastName: String?
    
    init(type: GuestType, firstName: String?, lastName: String?) throws {
        guard firstName != "", lastName != "" else {throw EntrantError.missingName("Missing Name")}
        guard firstName != nil, lastName != nil else {throw EntrantError.missingName("Missing Name")}
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
    }
}











































