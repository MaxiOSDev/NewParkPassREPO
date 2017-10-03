//
//  EntrantModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/25/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

protocol Entrant {
    var type: String { get }
    var areaAccess: [String] { get }
    var rideAccess: [String] { get }
}

protocol Discount {
    var foodDiscount: Double { get }
    var merchDiscount: Double { get }
}



enum AreaAccess: String {
    case amusement = "Amusement Areas"
    case kitchen = "Kitchen Areas"
    case rideControl = "Ride Control Areas"
    case maintenance = "Maintenance Areas"
    case office = "Office Areas"
}

enum RideAccess: String {
    case allRides = "All Rides you can enjoy!"
    case skipLines = "Skip All Ride Lines >:)"
}

enum EntrantError: Error {
    case missingName(String)
    case missingAddress(String)
    case missingCity(String)
    case missingState(String)
    case missingZipCode(String)
    case missingBirthday(String)
}


enum EmployeeType: Entrant, Discount {
    case foodServices
    case rideServices
    case maintenanceServices
    case manager
    
    var type: String {
        switch self {
        case .foodServices: return "Food Services Employee"
        case .rideServices: return "Ride Services Employee"
        case .maintenanceServices: return "Maintenance Services Employee"
        case .manager: return "Manager of Employees"
        }
    }
    
    var areaAccess: [String] {
        switch self {
        case .foodServices: return [AreaAccess.amusement.rawValue, AreaAccess.kitchen.rawValue]
        case .rideServices: return [AreaAccess.amusement.rawValue, AreaAccess.rideControl.rawValue]
        case .maintenanceServices: return [AreaAccess.amusement.rawValue, AreaAccess.kitchen.rawValue, AreaAccess.rideControl.rawValue, AreaAccess.maintenance.rawValue]
        case .manager: return [AreaAccess.amusement.rawValue, AreaAccess.kitchen.rawValue, AreaAccess.rideControl.rawValue, AreaAccess.maintenance.rawValue, AreaAccess.office.rawValue]
        }
    }
    
    var rideAccess: [String] {
        switch self {
        case .foodServices, .rideServices, .maintenanceServices, .manager: return [RideAccess.allRides.rawValue]
        }
    }
    
    var foodDiscount: Double {
        switch self {
        case .foodServices, .rideServices, .maintenanceServices: return 0.15
        case .manager: return 0.25
        }
    }
    
    var merchDiscount: Double {
        switch self {
        case .foodServices, .rideServices, .maintenanceServices, .manager: return 0.25
        }
    }
}


enum GuestType: Entrant, Discount {
    case classic
    case vip
    case child
    
    var type: String {
        switch self {
        case .classic: return "Classic Guest"
        case .vip: return "VIP Guest"
        case .child: return "Child Guest"
        }
    }
    
    var areaAccess: [String] {
        switch self {
        case .classic: return [AreaAccess.amusement.rawValue]
        case .vip: return [AreaAccess.amusement.rawValue]
        case .child: return [AreaAccess.amusement.rawValue]
        }
    }
    
    var rideAccess: [String] {
        switch self {
        case .classic: return [RideAccess.allRides.rawValue]
        case .vip: return [RideAccess.allRides.rawValue, RideAccess.skipLines.rawValue]
        case .child: return [RideAccess.allRides.rawValue]
        }
    }
    
    var foodDiscount: Double {
        switch self {
        case .classic: return 0.00
        case .vip: return 0.10
        case .child: return 0.00
        }
    }
    
    var merchDiscount: Double {
        switch self {
        case .classic: return 0.00
        case .vip: return 0.20
        case .child: return 0.00
        }
    }
}

































































