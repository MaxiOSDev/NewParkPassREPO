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
        // Guest Test Instances. Prints AreaAccess, If Entrants Birthday, If Entrant Has Discounts.
        
        do {
            let classicGuest = try ClassicGuest(firstName: "Max", lastName: "R.", type: .classic, birthday: "10/09/1995")
            try classicGuest.swipe(.amusementAreas)
            
    
        } catch {
            print("Error: \(error)")
        }
        
        
        
        do {

            let vipGuest = try VIPGuest(firstName: "Jeff", lastName: "C.", type: .vip, birthday: "01/01/2000")
            try vipGuest.swipe(.amusementAreas)
            

        } catch {
            print("Error")
        }
        
        
        do {

            let childGuest = try ChildGuest(firstName: "Jeff Jr", lastName: "C.", type: .child, birthday: "06/17/2015")
            try childGuest.swipe(.amusementAreas)
            

        } catch {
            print("Error: \(error)")
        }
        
        
        /*
        do {
            let foodServicesEmployee = try FoodServices(firstName: "Max", lastName: "Mang", type: .foodServices, address: "SomeAddress", city: "someCity", state: "CA", zipCode: 12345, birthday: "10/06/2001").swipe(area: .kitchenAreas)
        } catch {
            print("Error: \(error)")
        }
        
        
        do {
            let rideControlEmployee = try RideControl(firstName: "Max", lastName: "Fickle", type: .rideControl, address: "someAddress", city: "Los Angeles", state: "CA", zipCode: 21245, birthday: "04/28/2000").swipe(area: .rideControlAreas)
            
        } catch {
            print("Error: \(error)")
        }
        
        do {
            let maintenanceEmployee = try Maintenance(firstName: "Mrs. Jeff", lastName: "Peppersmith", type: .maintenence, address: "someAddress", city: "someCity", state: "PA", zipCode: 32124, birthday: "03/15/1980").swipe(area: .amusementAreas)
            
        } catch {
            print("Error: \(error)")
        }
        
        do {
            let employeeManager = try EmployeeManager(firstName: "Maximus", lastName: "Rodriguez", type: .manager, address: "someOtherAddress", city: "HollyWood City", state: "FL", zipCode: 54321, birthday: "08/18/1996").swipe(area: .office)
            
        } catch {
            print("Error: \(error)")
        }

        */
    
        
        /*
        do {
            let guestWithoutName = try Guest(name: "", type: .child, birthday: "01/25/2016")
        } catch EntrantError.missingName {
            print("Error: \(EntrantError.missingName.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        
        do {
            let guestWithoutBirthday = try Guest(name: "Max", type: .classic, birthday: "")
        } catch EntrantError.missingBirthday {
            print("Error: \(EntrantError.missingBirthday.rawValue)")
        } catch {
            print("Error: \(error)")
        }

        do {
            let employeeWithoutName = try Employee(name: "", type: .foodServices, address: "someAddress", city: "someCity", state: "someState", zipCode: 12345, birthday: "01/14/1993")
        } catch EntrantError.missingName {
            print("Error: \(EntrantError.missingName.rawValue)")
        } catch {
            print("Error: \(error)")
        }

        do {
            let employeeWithoutAddress = try Employee(name: "Max", type: .foodServices, address: "", city: "someCity", state: "someState", zipCode: 12345, birthday: "01/12/1992")
        } catch EntrantError.missingAddress {
            print("Error: \(EntrantError.missingAddress.rawValue)")
        } catch {
            print("Error: \(error)")
        }

        do {
            let employeeWithoutCity = try Employee(name: "Max", type: .rideControl, address: "someAddress", city: "", state: "someState", zipCode: 12345, birthday: "01/26/1997")
        } catch EntrantError.missingCity {
            print("Error: \(EntrantError.missingCity.rawValue)")
        } catch {
            print("Error: \(error)")
        }

        do {
            let employeeWithoutState = try Employee(name: "Max", type: .maintenence, address: "someAddress", city: "someCity", state: "", zipCode: 12345, birthday: "01/21/1991")
        } catch EntrantError.missingState {
            print("Error: \(EntrantError.missingState.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        
        do {
            let employeeWithoutZip = try Employee(name: "Max", type: .manager, address: "someAddress", city: "someCity", state: "someState", zipCode: nil, birthday: "01/28/1990")
        } catch EntrantError.missingZip {
            print("Error: \(EntrantError.missingZip.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        
        do {
            let employeeWithoutBirthday = try Employee(name: "Max", type: .rideControl, address: "someAddresS", city: "someCity", state: "someState", zipCode: 12345, birthday: "")
        } catch EntrantError.missingBirthday {
            print("Error: \(EntrantError.missingBirthday)")
        } catch {
            print("Error: \(error)")
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        seconds -= 1
        
        if seconds <= 5 && seconds != 0 {
            print("Please Wait before next swipe")
        } else if seconds < 1 {
            timer.invalidate()
            resetTimer()
        }
        
    }
    
    
   
    
    func resetTimer() {
        seconds = 5
    }

}

