//
//  EntrantModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum AreaAccess: String {
    case amusementAreas = "Amusement Areas"
    case kitchenAreas = "Kitchen Areas"
    case rideControlAreas = "Ride Control Areas"
    case maintenenceAreas = "Maintenance Areas"
    case office = "Office Areas"
}

enum EntrantType {
    case classic
    case vip
    case child
    case foodServices
    case rideControl
    case maintenence
    case manager
}

enum EntrantError: Error {
    case missingName
    case missingAddress
    case missingCity
    case missingState
    case missingZip
}

protocol Entrant {
    var name: String? { get }
    var areaAccess: [AreaAccess] { get }
    var type: EntrantType { get }
}

protocol CheckAccess {
    func checkAccess(_ access: EntrantType) -> (Bool, String)
}































































