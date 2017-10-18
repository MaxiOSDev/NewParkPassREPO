//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoInputTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        // _________________________________________________________________________________________________
        //                                      ***********Guest Test Cases***************  // MARK: GuestTestCases
        // Guest Test Instances. Prints AreaAccess, If Entrants Birthday, If Entrant Has Discounts. **NOTE!. If you build with two swipe methods it will only execute 1 and lock it for 5 seconds!**
        /* // Comment Section Marker 1
        do {
         
            // Classic Guest Access Granted and Rejected
            let classicGuest = try ClassicGuest(firstName: "Max", lastName: "R.", type: .classic, birthday: "10/09/1995")
            //try classicGuest.swipe(.amusementAreas) // Access Granted
            //try classicGuest.swipe(.kitchenAreas)  // Access Rejected
            
            let vipGuest = try VIPGuest(firstName: "Jeff", lastName: "c.", type: .vip, birthday: "01/01/2000")
            //try vipGuest.swipe(.amusementAreas) // Access Granted
            //try vipGuest.swipe(.rideControlAreas) // Access Rejected
            
            let childGuest = try ChildGuest(firstName: "Jeff Jr", lastName: "C.", type: .child, birthday: "06/17/2015")
            //try childGuest.swipe(.amusementAreas) // Access Granted
            //try childGuest.swipe(.maintenenceAreas) // Access Rejected
            
            
            
            
        } catch {
            print("Error: \(error)")
        }
        */ // Comment Section Marker 2
        // _________________________________________________________________________________________________
        //                                      ***********Employee Test Cases***************   // MARK: EmployeeTestCases
        /* // Comment Section Marker 1
        do {
            // Food Service Employee Access Granted and Rejected.
            //let foodServicesEmployee = try FoodServices(firstName: "Max", lastName: "Mang", type: .foodServices, address: "SomeAddress", city: "someCity", state: "CA", zipCode: 12345, birthday: "10/06/2001")
            // foodServicesEmployee.swipe(area: .kitchenAreas) // Access Granted
            // foodServicesEmployee.swipe(area: .rideControlAreas) // Rejection
            
            // _________________________________________________________________________________________________
            // Ride Control Employee Access Granted and Rejected.
            // let rideControlEmployee = try RideControl(firstName: "Max", lastName: "Fickle", type: .rideControl, address: "someAddress", city: "Los Angeles", state: "CA", zipCode: 21245, birthday: "04/28/2000")
           // rideControlEmployee.swipe(area: .rideControlAreas)
           // rideControlEmployee.swipe(area: .maintenanceAreas)
             
            
            // _________________________________________________________________________________________________
            // Maintenance Employee Access Granted and Rejected.
            //let maintenanceEmployee = try Maintenance(firstName: "Mrs. Jeff", lastName: "Peppersmith", type: .maintenence, address: "someAddress", city: "someCity", state: "PA", zipCode: 32124, birthday: "03/15/1980")
            
           // maintenanceEmployee.swipe(area: .maintenenceAreas) // Granted Access
           // maintenanceEmployee.swipe(area: .office) // Rejected Access
            
 
 
 
            
            // _________________________________________________________________________________________________
            // Employee Manager has access to all areas, two are listed.
            // let employeeManager = try EmployeeManager(firstName: "Maximus", lastName: "Rodriguez", type: .manager, address: "someOtherAddress", city: "HollyWood City", state: "FL", zipCode: 54321, birthday: "08/18/1996")
            
            //employeeManager.swipe(area: .amusementAreas) // Granted
            //employeeManager.swipe(area: .office) // Granted
 
        } catch {
            print("Error: \(error)")
        }
        */ // Comment Section Marker 2
        // _________________________________________________________________________________________________
        /*   // Comment Section Marker 1                 // *********ERRORS**************   // MARK: GuestErrors
        // Error Guest Without First Name
        do {
            let guestWithoutFirstName = try Guest(firstName: "", lastName: "", type: .child, birthday: "01/25/2016")
        } catch EntrantError.missingFirstName {
            print("Error: \(EntrantError.missingFirstName.rawValue) for entrant \(EntrantType.child.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _______________________________________________________
        // Error Guest Without Last Name
        do {
            let guestWithoutLastName = try Guest(firstName: "Max", lastName: "", type: .vip, birthday: "01/01/2006")
        } catch EntrantError.missingLastName {
            print("Error: \(EntrantError.missingLastName.rawValue) for entrant \(EntrantType.vip.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _______________________________________________________
        // Error Guest Without Birthday
        do {
            let guestWithoutBirthday = try Guest(firstName: "Max", lastName: "Vale", type: .classic, birthday: "")
        } catch EntrantError.missingBirthday {
            print("Error: \(EntrantError.missingBirthday.rawValue) for entrant \(EntrantType.classic.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _________________________________________________________________________________________________
        // Error Employee Without First Name            // MARK: EmployeeErrors
        do {
            let employeeWithoutFirstName = try Employee(firstName: "", lastName: "Snow", type: .foodServices, address: "someAddress", city: "someCity", state: "someState", zipCode: 12345, birthday: "01/14/1993")
        } catch EntrantError.missingFirstName {
            print("Error: \(EntrantError.missingFirstName.rawValue) for entrant \(EntrantType.foodServices.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _______________________________________________________
        // Error Employee Without Last Name
        do {
            let employeeWithoutLastName = try Employee(firstName: "Max", lastName: "", type: .manager, address: "someAddress", city: "someCity", state: "someState", zipCode: 46464, birthday: "02/01/1980")
        } catch EntrantError.missingLastName {
            print("Error: \(EntrantError.missingLastName.rawValue) for entrant \(EntrantType.foodServices.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _______________________________________________________
        // Error Employee Without Address
        do {
            let employeeWithoutAddress = try Employee(firstName: "Max", lastName: "Lanister", type: .foodServices, address: "", city: "someCity", state: "someState", zipCode: 12345, birthday: "01/12/1992")
        } catch EntrantError.missingAddress {
            print("Error: \(EntrantError.missingAddress.rawValue) for entrant \(EntrantType.foodServices.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _______________________________________________________
        // Error Employee Without City
        do {
            let employeeWithoutCity = try Employee(firstName: "Max", lastName: "Ketchum", type: .rideControl, address: "someAddress", city: "", state: "someState", zipCode: 12345, birthday: "01/26/1997")
        } catch EntrantError.missingCity {
            print("Error: \(EntrantError.missingCity.rawValue) for entrant \(EntrantType.rideControl.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _______________________________________________________
        // Error Employee Without State
        do {
            let employeeWithoutState = try Employee(firstName: "Max", lastName: "Uzumaki", type: .maintenence, address: "someAddress", city: "someCity", state: "", zipCode: 12345, birthday: "01/21/1991")
        } catch EntrantError.missingState {
            print("Error: \(EntrantError.missingState.rawValue) for entrant \(EntrantType.maintenence.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _______________________________________________________
        // Error Employee Without Zip
        do {
            let employeeWithoutZip = try Employee(firstName: "Max", lastName: "Son", type: .manager, address: "someAddress", city: "someCity", state: "someState", zipCode: nil, birthday: "01/28/1990")
        } catch EntrantError.missingZip {
            print("Error: \(EntrantError.missingZip.rawValue) for entrant \(EntrantType.manager.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        // _______________________________________________________
        // Error Employee Without Birthday
        do {
            let employeeWithoutBirthday = try Employee(firstName: "Max", lastName: "Gato", type: .rideControl, address: "someAddresS", city: "someCity", state: "someState", zipCode: 12345, birthday: "")
        } catch EntrantError.missingBirthday {
            print("Error: \(EntrantError.missingBirthday.rawValue) for entrant \(EntrantType.rideControl.rawValue)")
        } catch {
            print("Error: \(error)")
        }
        */ // Comment Section Marker 2
        // ______________________________________________________________________________________________________________
        
        // ****************** Extra Credit***********************
        // Test Cases for Guest Birthday & Employee Birthday. As you will notice with other test before. It prints two possibilites, "Happy Birthday!" or "It is not your birthday."
        // Birthday year does not matter only month and day do thanks to calendar components, and if statments.
        /*
        do {
         //   let guestBirthdayTest = try Guest(firstName: "Mr/Ms/Mrs.", lastName: "Reviewer", type: .classic, birthday: "10/10/1975").swipe(.amusementAreas) // Make sure birthday day is todays date
            
        //  let employeeBirthdayTest = try FoodServices(firstName: "Mr/Ms/Mrs.", lastName: "Reviewer", address: "someAddress", city: "someCity", state: "someState", zipCode: 00000, birthday: "10/10/1986").swipe(area: .kitchenAreas)
        } catch {
            print("Error: \(error)")
        }
         */
        // _________________________________________________________
        // Test Cases for denying an Entrant access before 5 seconds after 1 entrant has swipped. Works for Employees as well
        /*
        do {
            let guestEntrant = try VIPGuest(firstName: "Max", lastName: "R.", type: .vip, birthday: "06/01/1950")
            guestEntrant.swipe(.amusementAreas) // Only this entrant will be able to have access at the moment.
            let otherGuestEntrant = try ClassicGuest(firstName: "Jeff", lastName: "M.", type: .classic, birthday: "10/11/1994")
            otherGuestEntrant.swipe(.amusementAreas) // This entrant will not be able to get through. The timer blocks the execution of code.
        } catch {
            print("Error: \(error)")
        }
        */
        /*
         // Employee Test Cases
        do {
            let employeeEntrant = try RideControl(firstName: "Max", lastName: "R.", address: "someAddress", city: "someCity", state: "SomeState", zipCode: 00000, birthday: "10/12/1940")
            employeeEntrant.swipe(area: .rideControlAreas)
            let employeeEntrant2 = try Maintenance(firstName: "Max", lastName: "B", address: "Address", city: "someCity", state: "someState", zipCode: 00000, birthday: "10/12/1973")
        } catch {
            print("Error: \(error)")
        }
        */
        /*
         // Mixture of Guest and Employee
        do {
            let guestEntrant = try VIPGuest(firstName: "Max", lastName: "R.", type: .vip, birthday: "06/01/1950")
            guestEntrant.swipe(.amusementAreas) // Only this entrant will be able to have access at the moment.
            let employeeEntrant = try RideControl(firstName: "Max", lastName: "R.", address: "someAddress", city: "someCity", state: "SomeState", zipCode: 00000, birthday: "10/12/1940")
            employeeEntrant.swipe(area: .rideControlAreas)
        }
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! InfoTableViewCell
            // Set up cell.label
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! NameTableViewCell
            // Set up cell.button
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! CompanyTableViewCell
            // Set up cell.textField
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4") as! AddressTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5") as! PopulateTableViewCell
            return cell
        }
    }
    

    
}































































