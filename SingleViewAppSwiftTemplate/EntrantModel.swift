//
//  EntrantModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
// Area Access Enum With String Raw Values
enum AreaAccess: String {
    case amusementAreas = "Amusement Areas"
    case kitchenAreas = "Kitchen Areas"
    case rideControlAreas = "Ride Control Areas"
    case maintenenceAreas = "Maintenance Areas"
    case office = "Office Areas"
}
// EntrantTye Enum with String Raw Values
enum EntrantType: String {
    case classic = "Classic Guest"
    case vip = "VIP Guest"
    case child = "Child Guest"
    case foodServices = "Food Services Employee"
    case rideControl = "Ride Control Employee"
    case maintenence = "Maintenance Employee"
    case manager = "Employee Manager"
}

// Entrant Errors with String Raw Values
enum EntrantError: String, Error {
    case missingFirstName = "Missing First Name"
    case missingLastName = "Missing Last Name"
    case missingAddress = "Missing Address"
    case missingCity = "Missing City"
    case missingState = "Missing State"
    case missingZip = "Missing Zip Code"
    case missingBirthday = "Missing Birthday"
    case invalidRideAccess = "Invalid Ride Access Permit"
}

// ______________________________________________________________________________________________
// Contract for the Guest and Employee SuperClasses
protocol Entrant {
    var firstName: String?{ get }
    var lastName: String? { get }
    var areaAccess: [AreaAccess] { get }
    var type: EntrantType { get }
    
}
// Enum RideAccess with String Raw Values
enum RideAccess: String {
    case allRides = "All Rides With Lines"
    case skipLines = "Skip Lines of all Rides"
    
}
// Discount Protocol with method: checkDiscount to check if an entrants discount
protocol Discount {
    var foodDiscount: Int { get }
    var merchDiscount: Int { get }
    func checkDiscount()
}



// ______________________________________________________________________________________________
// Default Implementation of checkDiscount to check discount of certain entrants.
extension Discount {
    
    func checkDiscount() {
        
        
        if foodDiscount == 10 || foodDiscount == 15 || foodDiscount == 25 {
            print("Food Discount: \(foodDiscount)%")
        }
        
        if merchDiscount == 20 || merchDiscount == 25 {
            print("Merchandise Discount: \(merchDiscount)%")
        }
        if foodDiscount == 0 {
            print("No Food Discount")
        }
        if merchDiscount == 0 {
            print("No Merchandise Discount")
        }
    }
    
}
































































