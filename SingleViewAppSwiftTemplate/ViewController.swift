//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hasHid: Bool = false
    var passType: EntrantPassType? = nil
    var guest: EntrantType? = nil
    var employee: EntrantType? = nil
    var vendor: EntrantType? = nil
    var entrantPassType: EntrantPass? = nil
    var isSelected: Bool = false
    var rideAccess: RideAccess?
    var discount = EntrantDiscount()
    
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
    // Views
    @IBOutlet weak var subMenuView: UIView!
    
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
            passViewController.typeOfRideAccessText = "• " + (rideAccess?.rawValue)!
            passViewController.foodDiscountText = "• \(discount.foodDiscount)% Food Discount"
            passViewController.merchDiscountText = "• \(discount.merchDiscount)% Merch Discount"
        }
    }
    


    // Entrant Type Button Actions
    @IBAction func selectedGuestType(_ sender: Any) {
        setGuestTitles()
        animateSubMenuDown()
    }
    @IBAction func selectedEmployeeType(_ sender: Any) {
        setEmployeeTitles()
        animateSubMenuDown()
    }
    @IBAction func selectedManagerType(_ sender: Any) {
        animateSubMenuUp()
    }
    @IBAction func selectedVendorType(_ sender: Any) {
        setVendorTitles()
        animateSubMenuDown()
        rideAccess = RideAccess.noRides
    }
    
    // Animate SubMenu
    func animateSubMenuUp() {
        hasHid = true
        let top = CGAffineTransform(translationX: 0, y: -50)
        UIView.animateKeyframes(withDuration: 0.4, delay: 0.0, options: [], animations: { 
            self.subMenuView.transform = top
        }, completion: nil)
        
    }
    
    func animateSubMenuDown() {
    if hasHid == true {
    let down = CGAffineTransform(translationX: 0, y: 0)
    UIView.animateKeyframes(withDuration: 0.4, delay: 0.0, options: [], animations: {
    self.subMenuView.transform = down
        }, completion: nil)
    }
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
            checkSubTypeDiscount()
        }
        
        if passType == .vendor {
            isSelected = true
            vendor = .acme
            highlightRequiredFieldsForVendor()
            checkVendorSubType()
            checkSubTypeDiscount()
        }
    }
    
    @IBAction func selectedEntrantSubTwo(_ sender: Any) { // Adult
        if passType == .guest {
            isSelected = true
            guest = .classic
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForGuest()
            checkGuestSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .employee {
            isSelected = true
            employee = .rideControl
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .vendor {
            isSelected = true
            vendor = .orkin
            highlightRequiredFieldsForVendor()
            checkVendorSubType()
            checkSubTypeDiscount()
        }


    }
    
    @IBAction func selectedEntrantSubThree(_ sender: Any) { // Senior
        if passType == .guest {
            isSelected = true
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForGuest()
            checkGuestSubType()
            checkSubTypeDiscount()

        }
        
        if passType == .employee {
            isSelected = true
            employee = .maintenence
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .vendor {
            isSelected = true
            vendor = .fedex
            highlightRequiredFieldsForVendor()
            checkVendorSubType()
            checkSubTypeDiscount()
        }


    }
    @IBAction func selectedEntrantSubFour(_ sender: Any) { // VIP
        if passType == .guest {
            guest = .vip
            rideAccess = RideAccess.skipLines
            highlightRequiredFieldsForGuest()
            checkGuestSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .employee {
            isSelected = true
            employee = .manager
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .vendor {
            isSelected = true
            vendor = .nwElectrical
            highlightRequiredFieldsForVendor()
            checkVendorSubType()
            checkSubTypeDiscount()
        }


    }
    
    @IBAction func generatePass(_ sender: Any) {
        if guest == .child {
            checkAge()
        }
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
    
    func checkAge() { // Checks Age and determines if under 5 for child guest
        let today = Date()
        let components = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let formattedBirthday = dateFormatter.date(from: dobTextField.text!)
        let ageComponents = components.dateComponents([.year], from: formattedBirthday!, to: today)
        let age = ageComponents.year
        
        if let entrantAge = age {
            if entrantAge > 5 {
                let alert = UIAlertController(title: "Error!", message: "Entrant is older than 5!", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    
    // Guest Helper Methods
    func setGuestTitles() { // Sets titles
        entrantTypeSubType1.setTitle("Child", for: .normal)
        entrantTypeSubType2.setTitle("Adult", for: .normal)
        entrantTypeSubType3.setTitle("Senior", for: .normal)
        entrantTypeSubType4.setTitle("VIP", for: .normal)
        ssnLabel.text = "SSN"
        ssnTextField.placeholder = "###-##-####"
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
        if guest == .classic || guest == .child {
            discount.foodDiscount = 0
            discount.merchDiscount = 0
        } else if guest == .vip {
            discount.foodDiscount = 10
            discount.merchDiscount = 20
        }
        
        if employee == .foodServices || employee == .rideControl || employee == .maintenence {
            discount.foodDiscount = 15
            discount.merchDiscount = 25
        } else if employee == .manager {
            discount.foodDiscount = 25
            discount.merchDiscount = 25
        }
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
        ssnLabel.text = "SSN"
        ssnTextField.placeholder = "###-##-####"
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
    
    // Vendor Helper Methods
    
    func setVendorTitles() {
        entrantTypeSubType1.setTitle(EntrantType.acme.rawValue, for: .normal)
        entrantTypeSubType2.setTitle(EntrantType.orkin.rawValue, for: .normal)
        entrantTypeSubType3.setTitle(EntrantType.fedex.rawValue, for: .normal)
        entrantTypeSubType4.setTitle(EntrantType.nwElectrical.rawValue, for: .normal)
        ssnLabel.text = "Date Of Visit"
        ssnTextField.placeholder = "MM/DD/YYYY"
        
        isSelected = false
        passType = .vendor
        print("Type is \(passType!)")
    }
    
    func checkVendorSubType() {
        if vendor == .acme && isSelected == true {
            entrantPassType = EntrantPass.acmeVendorPass
            print("Creating \(entrantPassType?.rawValue)")
        } else if vendor == .orkin && isSelected == true {
            entrantPassType = EntrantPass.orkinVendorPass
            print("Creating \(entrantPassType?.rawValue)")
        } else if vendor == .fedex && isSelected == true {
            entrantPassType = EntrantPass.fedexVendorPass
            print("Creating \(entrantPassType?.rawValue)")
        } else if vendor == .nwElectrical && isSelected == true {
            entrantPassType = EntrantPass.nwElectricalVendorPass
            print("Creating \(entrantPassType?.rawValue)")
        }
    }
    
    func highlightRequiredFieldsForVendor() {
        let arrayOfLabels = [firstNameLabel, secondNameLabel, companyLabel, ssnLabel, dobLabel]
        let arrayOfTextFields = [firstNameTextField, lastNameTextField, companyTextField, ssnTextField, dobTextField]
        let arrayOfNotRequiredTextFields = [projectNumTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField]
        
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



















































