//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var passType: EntrantPassType? = nil
    var guest: EntrantType? = nil
    var employee: EntrantType? = nil
    var entrantPassType: EntrantPass? = nil
    var isSelected: Bool = false
    var rideAccess: RideAccess?
    var discount: Discount? = nil
    
    // Entrant Types Outlets
    @IBOutlet weak var guestType: UIButton!
    @IBOutlet weak var employeeType: UIButton!
    @IBOutlet weak var managerType: UIButton!
    @IBOutlet weak var vendorType: UIButton!
    
    // Entrant Type Subtypes
    @IBOutlet weak var entrantTypeSubType1: UIButton!
    @IBOutlet weak var entrantTypeSubType2: UIButton!
    @IBOutlet weak var entrantTypeSubType3: UIButton!
    @IBOutlet weak var entrantTypeSubType4: UIButton!
    
    // Labels
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    
    // TextFields
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var ssnTextField: UITextField!
    @IBOutlet weak var projectNumTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    // Bottom Button Outlets
    @IBOutlet weak var generatePassButton: UIButton!
    @IBOutlet weak var populateDataButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInteractionDisabled()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passViewController = segue.destination as? PassViewController {
            passViewController.nameOfEntrantText = "\(firstNameTextField.text!) \(lastNameTextField.text!)"
            passViewController.typeOfEntrantPassText = entrantPassType?.rawValue
            passViewController.typeOfRideAccessText = rideAccess?.rawValue
            
        }
    }
    


    // Entrant Type Button Actions
    @IBAction func selectedGuestType(_ sender: Any) {
        setGuestTitles()
    }
    @IBAction func selectedEmployeeType(_ sender: Any) {
        setEmployeeTitles()
    }
    @IBAction func selectedManagerType(_ sender: Any) {
        
    }
    @IBAction func selectedVendorType(_ sender: Any) {
        
    }
    
    
    
    // Entrant SubType Actions
    @IBAction func selectedEntrantSubOne(_ sender: Any) { // Child
        if passType == .guest {
            isSelected = true
            guest = .child
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForGuest()
            checkGuestSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .employee {
            isSelected = true
            employee = .foodServices
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
        }
    }
    
    @IBAction func selectedEntrantSubTwo(_ sender: Any) { // Adult
        if passType == .guest {
            isSelected = true
            guest = .classic
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForGuest()
            checkGuestSubType()
        }
        
        if passType == .employee {
            isSelected = true
            employee = .rideControl
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
        }

    }
    
    @IBAction func selectedEntrantSubThree(_ sender: Any) { // Senior
        if passType == .guest {
            isSelected = true
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForGuest()

        }
        
        if passType == .employee {
            isSelected = true
            employee = .maintenence
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
        }

    }
    @IBAction func selectedEntrantSubFour(_ sender: Any) { // VIP
        if passType == .guest {
            guest = .vip
            rideAccess = RideAccess.skipLines
            highlightRequiredFieldsForGuest()
            checkGuestSubType()
        }
        
        if passType == .employee {
            isSelected = true
            employee = .manager
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
        }

    }
    
    @IBAction func generatePass(_ sender: Any) {
    
    }
    
    
    // Helper Methods
    // Deaactive user interaction for fields not required
    func userInteractionDisabled() {
        let arrayOfTextFields = [dobTextField, ssnTextField, projectNumTextField, firstNameTextField,
                                 lastNameTextField, companyTextField, streetAddressTextField, cityTextField,
                                 stateTextField, zipTextField]
        
        for field in arrayOfTextFields {
            field?.isUserInteractionEnabled = false
        }
    }
    
    
    // Guest Helper Methods
    func setGuestTitles() { // Sets titles
        entrantTypeSubType1.setTitle("Child", for: .normal)
        entrantTypeSubType2.setTitle("Adult", for: .normal)
        entrantTypeSubType3.setTitle("Senior", for: .normal)
        entrantTypeSubType4.setTitle("VIP", for: .normal)
        passType = EntrantPassType.guest
        print("Type is: \(passType!)") // Compiler knows what type it is
    }
    
    func checkGuestSubType() {
        if guest == .classic && isSelected == true {
            entrantPassType = EntrantPass.classicPass
            print("Creating \(entrantPassType?.rawValue)")
        } else if guest == .vip && isSelected == true {
            entrantPassType = EntrantPass.vipPass
            print("Creating \(entrantPassType?.rawValue)")
        } else if guest == .child && isSelected == true {
            entrantPassType = EntrantPass.childPass
            print("Creating \(entrantPassType?.rawValue)")
        }
    }
    
    func checkSubTypeDiscount() {
        
    }
    
    func highlightRequiredFieldsForGuest() { // Highlights required fields
        let arrayOfLabels = [dobLabel, firstNameLabel, secondNameLabel]
        let arrayOfRequiredTextFields = [dobTextField,firstNameTextField, lastNameTextField]
        let arrayOfNotRequiredTextFields = [ssnTextField, projectNumTextField, companyTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField]

        for label in arrayOfLabels {
            label?.textColor = .black
        }
        
        for field in arrayOfRequiredTextFields {
            field?.backgroundColor = .white
            field?.isUserInteractionEnabled = true
            for notRequiredField in arrayOfNotRequiredTextFields {
                notRequiredField?.backgroundColor = .clear
                notRequiredField?.isUserInteractionEnabled = false
                notRequiredField?.text?.removeAll()
            }
        }
        
        
        
    }
    
    func hightlightRequiredFieldsForAdultGuest() {
        
    }
    
    // Employee Helper Methods
    
    func setEmployeeTitles() { // Sets all the titles
        entrantTypeSubType1.setTitle(EntrantType.foodServices.rawValue, for: .normal)
        entrantTypeSubType2.setTitle(EntrantType.rideControl.rawValue, for: .normal)
        entrantTypeSubType3.setTitle(EntrantType.maintenence.rawValue, for: .normal)
        entrantTypeSubType4.setTitle(EntrantType.manager.rawValue, for: .normal)
        passType = EntrantPassType.employee
        isSelected = false
        print("Type is: \(passType!)") // Compiler knows what type it is
    }
    
    func checkEmployeeSubType() {
        
        if employee == .foodServices && isSelected == true {
            entrantPassType = EntrantPass.foodServicesPass
            print("Creating \(entrantPassType?.rawValue)")
            
        } else if employee == .rideControl && isSelected == true {
            entrantPassType = EntrantPass.rideControlPass
            print("Creating \(entrantPassType?.rawValue)")
            
        } else if employee == .maintenence && isSelected == true {
            entrantPassType = EntrantPass.maintenancePass
            print("Creating \(entrantPassType?.rawValue)")
        } else if employee == .manager && isSelected == true {
            entrantPassType = EntrantPass.managerPass
            print("Creating \(entrantPassType?.rawValue)")
        }
    }
    
    func highlightRequiredFieldsForEmployee() { // Highlights required fields
        let arrayOfLabels = [firstNameLabel, secondNameLabel, streetAddressLabel, cityLabel, stateLabel, zipLabel]
        let arrayOfTextFields = [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField]
        let arrayOfNotRequiredTextFields = [ssnTextField, projectNumTextField, companyTextField, dobTextField]
        for label in arrayOfLabels {
            label?.textColor = .black
        }
        
        for field in arrayOfTextFields {
            field?.backgroundColor = .white
            field?.isUserInteractionEnabled = true
            for notRequiredField in arrayOfNotRequiredTextFields {
                notRequiredField?.backgroundColor = .clear
                notRequiredField?.isUserInteractionEnabled = false
                notRequiredField?.text?.removeAll()
            }
        }
        
    }
    

}



















































