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

enum EntrantType: String {
    case classic = "Classic Guest"
    case vip = "VIP Guest"
    case child = "Child Guest"
    case foodServices = "Food Services Employee"
    case rideControl = "Ride Control Employee"
    case maintenence = "Maintenance Employee"
    case manager = "Employee Manager"
}


enum EntrantError: String, Error {
    case missingName = "Missing Name"
    case missingAddress = "Missing Address"
    case missingCity = "Missing City"
    case missingState = "Missing State"
    case missingZip = "Missing Zip Code"
    case missingBirthday = "Missing Birthday"
   // case invalidRideAccess = "Invalid Ride Access Permit"
}

// ______________________________________________________________________________________________

protocol Entrant {
    var name: String? { get }
    var areaAccess: [AreaAccess] { get }
    var type: EntrantType { get }
    
}

protocol CheckAccess {
    func checkAccess() -> (Bool, String)
}

enum RideAccess: String {
    case allRides = "All Rides With Lines"
    case skipLines = "Skip Lines of all Rides"
    
}

protocol Discount {
    var foodDiscount: Int { get }
    var merchDiscount: Int { get }
    func checkDiscount() -> (Int, Int)
}



// ______________________________________________________________________________________________

extension Discount {
    
    func checkDiscount() -> (Int, Int) {
        if foodDiscount == 0 {
            print("No Food Discount")
        }
        
        if merchDiscount == 0 {
            print("No Merchandise Discount")
        }
        
        if foodDiscount == 10 || foodDiscount == 15 || foodDiscount == 25 {
            print("Food Discount: \(foodDiscount)%")
        }
        
        if merchDiscount == 20 || merchDiscount == 25 {
            print("Merchandise Discount: \(merchDiscount)%")
        }
        
        return (foodDiscount, merchDiscount)
    }
    
}
































































