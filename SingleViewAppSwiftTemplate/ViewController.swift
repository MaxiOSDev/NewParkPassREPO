//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Checking Guest Type
        print(classicGuest.type)
        print(vipGuest.type)
        print(childGuest.type)
        // ______________________________________________________________________________________________
        // Checking access of guest
        print(classicGuest.checkAccess(.classic))
        print(vipGuest.checkAccess(.vip))
        print(childGuest.checkAccess(.child))
        // ______________________________________________________________________________________________
        // Checking if able to skip lines for guest
        print(classicGuest.skipLines)
        print(vipGuest.skipLines)
        print(childGuest.skipLines)
        // ______________________________________________________________________________________________
        // Checking Employee Type
        print(foodEmployee.type)
        print(rideEmployee.type)
        print(maintenanceEmployee.type)
        print(employeeManager.type)
        // ______________________________________________________________________________________________
        // Checking Employee Access
        print(foodEmployee.checkAccess(.foodServices))
        print(rideEmployee.checkAccess(.rideControl))
        print(maintenanceEmployee.checkAccess(.maintenence))
        print(employeeManager.checkAccess(.manager))
        // ______________________________________________________________________________________________
        // Checking if able to skip lines for employee
        print(foodEmployee.skipLines)
        print(rideEmployee.skipLines)
        print(maintenanceEmployee.skipLines)
        print(employeeManager.skipLines)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

