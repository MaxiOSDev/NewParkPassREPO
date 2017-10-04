//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Guest: Entrant, CheckAccess {
    var name: String?
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var type: EntrantType
    
    init(name: String?, type: EntrantType) throws {
        guard name != "", name != nil else { throw EntrantError.missingName }
        self.name = name
        self.type = type
    }
    
    func checkAccess(_ access: EntrantType) -> (Bool, String) {
        for area in areaAccess {
            if area == .amusementAreas {
                return (true, "Access Granted for \(type)")
            }
        }
        return (false, "ACCESS REJECTED")
    }
    
    
}

class ClassicGuest: Guest {
    let skipLines: Bool
    
    init(name: String, type: EntrantType = .classic, skipLines: Bool = false) {
        self.skipLines = skipLines
        try!  super.init(name: name, type: type)
    }
}

class VIPGuest: Guest {
    let skipLines: Bool
    
    init(name: String, type: EntrantType = .vip, skipLines: Bool = true) {
        self.skipLines = skipLines
        try! super.init(name: name, type: type)
    }
}

class ChildGuest: Guest {
    let skipLines: Bool
    
    init(name: String, type: EntrantType = .child, skipLines: Bool = false) {
        self.skipLines = skipLines
        try! super.init(name: name, type: type)
    }
}











































