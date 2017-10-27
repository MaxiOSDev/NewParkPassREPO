//
//  EntrantModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// Area Access Enum With String Raw Values
enum EntrantPassType {
    case guest
    case employee
    case vendor
}
enum AreaAccess: String {
    case amusementAreas = "Amusement Areas"
    case kitchenAreas = "Kitchen Areas"
    case rideControlAreas = "Ride Control Areas"
    case maintenenceAreas = "Maintenance Areas"
    case office = "Office Areas"
}
// EntrantTye Enum with String Raw Values
enum EntrantType: String {
    case classic = "Classic"
    case vip = "VIP"
    case child = "Child"
    case senior = "Senior"
    case seasonPassGuest = "Season Pass"
    case foodServices = "Food Services"
    case rideControl = "Ride Control"
    case maintenence = "Maintenance"
    case manager = "Manager"
    case contractEmployee = "Contract Employee"
    case acme = "Acme"
    case orkin = "Orkin"
    case fedex = "Fedex"
    case nwElectrical = "NW Electrical"
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
    case missingCompany = "Missing Company"
    case missingDov = "Missing Date Of Visit"
    case missingProjectNum = "Missing Project Number"
}

enum EntrantPass: String {
    case classicPass = "Classic Guest Pass"
    case vipPass = "VIP Guest Pass"
    case childPass = "Free Child Pass"
    case seniorPass = "Senior Guest Pass"
    case seasonPass = "Season Pass"
    case foodServicesPass = "Hourly Food Services Employee Pass"
    case rideControlPass = "Hourly Ride Control Employee Pass"
    case maintenancePass = "Maintenance Employee Pass"
    case managerPass = "Employee Manager Pass"
    case acmeVendorPass = "Acme Vendor Pass"
    case orkinVendorPass = "Orkin Vendor Pass"
    case fedexVendorPass = "Fedex Vendor Pass"
    case nwElectricalVendorPass = "NW Electrical Vendor Pass"
    case contractEmployeePass = "Contract Employee Pass"
    case noPassSelected = "NO PASS SELECTED"
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
    case noRides = "No Access to Rides"
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
































































