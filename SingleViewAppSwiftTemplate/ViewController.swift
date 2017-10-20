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
    var guest: Guest?
    
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
            passViewController.nameOfEntrantText = "\(firstNameTextField.text) \(lastNameTextField.text)"

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
            highlightRequiredFieldsForGuest()
            print("Type is: \(passType!)")
        }
        
        if passType == .employee {
            highlightRequiredFieldsForEmployee()
            print("Type is: \(passType!)")
        }
    }
    
    @IBAction func selectedEntrantSubTwo(_ sender: Any) { // Adult
        if passType == .guest {
            highlightRequiredFieldsForGuest()
            print("Type is: \(passType!)")
        }
        
        if passType == .employee {
            highlightRequiredFieldsForEmployee()
            print("Type is: \(passType!)")
        }

    }
    
    @IBAction func selectedEntrantSubThree(_ sender: Any) { // Senior
        if passType == .guest {
            highlightRequiredFieldsForGuest()
            print("Type is: \(passType!)")
        }
        
        if passType == .employee {
            highlightRequiredFieldsForEmployee()
            print("Type is: \(passType!)")
        }

    }
    @IBAction func selectedEntrantSubFour(_ sender: Any) { // VIP
        if passType == .guest {
            highlightRequiredFieldsForGuest()
            print("Type is: \(passType!)")
        }
        
        if passType == .employee {
            highlightRequiredFieldsForEmployee()
            print("Type is: \(passType!)")
        }

    }
    
    @IBAction func generatePass(_ sender: Any) {
    
    }
    
    
    // Helper Methods
    // Deaactive user interaction
    func userInteractionDisabled() {
        let arrayOfTextFields = [dobTextField, ssnTextField, projectNumTextField, firstNameTextField,
                                 lastNameTextField, companyTextField, streetAddressTextField, cityTextField,
                                 stateTextField, zipTextField]
        
        for field in arrayOfTextFields {
            field?.isUserInteractionEnabled = false
        }
    }
    
    
    // Guest Helper Methods
    func setGuestTitles() {
        entrantTypeSubType1.setTitle("Child", for: .normal)
        entrantTypeSubType2.setTitle("Adult", for: .normal)
        entrantTypeSubType3.setTitle("Senior", for: .normal)
        entrantTypeSubType4.setTitle("VIP", for: .normal)
        passType = EntrantPassType.guest
    }
    
    func highlightRequiredFieldsForGuest() {
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
    
    func setEmployeeTitles() {
        entrantTypeSubType1.setTitle("Food Services", for: .normal)
        entrantTypeSubType2.setTitle("Ride Control", for: .normal)
        entrantTypeSubType3.setTitle("Maintenance", for: .normal)
        entrantTypeSubType4.setTitle("Manager", for: .normal)
        passType = EntrantPassType.employee
    }
    
    func highlightRequiredFieldsForEmployee() {
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
            }
        }
        
    }

}

// Extensions

extension UIFont {
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    func setBold() -> UIFont {
        if (isBold) {
            return self
        } else {
            var fontAtyAry = fontDescriptor.symbolicTraits
            fontAtyAry.insert([.traitBold])
            let fontAtrDetails = fontDescriptor.withSymbolicTraits(fontAtyAry)
            return UIFont(descriptor: fontAtrDetails!, size: pointSize)
        }
    }
    
    func desetBold() -> UIFont {
        if (!isBold) {
            return self
        } else {
            var fontAtrAry = fontDescriptor.symbolicTraits
            fontAtrAry.remove([.traitBold])
            let fontAtrDetails = fontDescriptor.withSymbolicTraits(fontAtrAry)
            return UIFont(descriptor: fontAtrDetails!, size: pointSize)
        }
    }
}



























































