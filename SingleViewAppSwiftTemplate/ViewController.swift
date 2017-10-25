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
    
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var seasonPassLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInteractionDisabled()
        checkBox.isHidden = true
        seasonPassLabel.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passViewController = segue.destination as? PassViewController {
            passViewController.nameOfEntrantText = "\(firstNameTextField.text!) \(lastNameTextField.text!)"
            passViewController.typeOfEntrantPassText = entrantPassType?.rawValue
            passViewController.typeOfRideAccessText =  "• \(rideAccess?.rawValue)"
            passViewController.foodDiscountText = "• \(discount.foodDiscount)% Food Discount"
            passViewController.merchDiscountText = "• \(discount.merchDiscount)% Merch Discount"
        }
    }
    


    // Entrant Type Button Actions
    @IBAction func selectedGuestType(_ sender: Any) {
        setGuestTitles()
        animateSubMenuDown()
        hideCheckBox()
    }
    @IBAction func selectedEmployeeType(_ sender: Any) {
        setEmployeeTitles()
        animateSubMenuDown()
        hideCheckBox()
    }
    @IBAction func selectedManagerType(_ sender: Any) {
        passType = .employee
        animateSubMenuUp()
        hideCheckBox()
        ssnLabel.text = "SSN"
        ssnTextField.placeholder = "###-##-####"
        employee = .manager
        rideAccess = .allRides
        entrantPassType = EntrantPass.managerPass
        print("Creating \(entrantPassType?.rawValue)")
        isSelected = true
        checkEmployeeSubType()
        checkSubTypeDiscount()
        highlightRequiredFieldsForEmployee()
    }
    @IBAction func selectedVendorType(_ sender: Any) {
        setVendorTitles()
        animateSubMenuDown()
        hideCheckBox()
        rideAccess = RideAccess.noRides
    }
    @IBAction func checkBoxClicked(_ sender: Any) {
        if checkBox.isSelected == true {
            checkBox.isSelected = false
            disableHighlightForTextFields()
            userInteractionDisabled()
        } else {
            guest = .seasonPassGuest
            isSelected = true
            rideAccess = RideAccess.skipLines
            checkBox.isSelected = true
            highlightRequiredFieldsForSeasonPass()
        }
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
        checkBox.isSelected = false
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
        checkBox.isSelected = false
        if passType == .guest {
            isSelected = true
            guest = .classic
            rideAccess = RideAccess.allRides
            hightlightRequiredFieldsForAdultAndVIPGuest()
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
        checkBox.isSelected = false
        if passType == .guest {
            isSelected = true
            guest = .senior
            rideAccess = RideAccess.skipLines
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
        checkBox.isSelected = false
        if passType == .guest {
            isSelected = true
            guest = .vip
            rideAccess = RideAccess.skipLines
            hightlightRequiredFieldsForAdultAndVIPGuest()
            checkGuestSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .employee {
            isSelected = true
            employee = .contractEmployee
            rideAccess = RideAccess.noRides
            highlightRequiredFieldsForContractEmployee()
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
        
        if guest == .child && entrantPassType == .childPass && dobTextField.text?.isEmpty == true && entrantPassType != .seniorPass {
            let alert = UIAlertController(title: "Error!", message: "Need Birthday Entered", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
            
        } else if guest == .child && dobTextField.text?.isEmpty == false {
            checkAge()
        }
        
        if guest == .seasonPassGuest {
            entrantPassType = EntrantPass.seasonPass
        }
        
        if rideAccess == nil {
            let alert = UIAlertController(title: "Error!", message: "No Entrant was Selected!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "I got it", style: .default, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        checkTextFieldForNil()
        
        
    }
    
    @IBAction func popuateData(_ sender: Any) {
        if guest == .seasonPassGuest {
            entrantPassType = EntrantPass.seasonPass
        }
        switch entrantPassType {
        case .some(.childPass): createChildGuest()
        case .some(.classicPass): createAdultGuest()
        case .some(.seniorPass): createSeniorGuest()
        case .some(.vipPass): createVIPGuest()
        case .some(.seasonPass): createSeasonPassGuest()
        case .some(.foodServicesPass): createFoodServicesPass()
        case .some(.rideControlPass): createRideControlPass()
        case .some(.maintenancePass): createMaintenancePass()
        case .some(.managerPass): createManagerPass()
        default: fatalError("Error! Something went wrong!")
        }
    }
    
    
    
    // Helper Methods
    
    // Populate Data Methods
    
    func createChildGuest() {
        if entrantPassType == .childPass {
            do {
                let childPass = try ChildGuest(firstName: "Max", lastName: "Ramirez", type: .child, birthday: "03/17/2015")
                dobTextField.text = childPass.birthday
                firstNameTextField.text = childPass.firstName
                lastNameTextField.text = childPass.lastName
            } catch EntrantError.missingFirstName {
            } catch EntrantError.missingLastName {
            } catch EntrantError.missingBirthday {
            } catch {
            }
        }
    }
    
    func createAdultGuest() {
        if entrantPassType == .classicPass {
            do {
                let classicPass = try ClassicGuest(firstName: "MyNameIs", lastName: "Jeff", type: .classic, birthday: "03/17/1998")
                firstNameTextField.text = classicPass.firstName
                lastNameTextField.text = classicPass.lastName
            } catch EntrantError.missingFirstName {
            } catch EntrantError.missingLastName {
            } catch {
            }
        }
    }
    
    func createSeniorGuest() {
        if entrantPassType == .seniorPass {
            do {
                let seniorPass = try SeniorGuest(firstName: "Bobby", lastName: "Bob", type: .senior, birthday: "03/17/1950")
                dobTextField.text = seniorPass.birthday
                firstNameTextField.text = seniorPass.firstName
                lastNameTextField.text = seniorPass.lastName
            } catch EntrantError.missingBirthday {
            } catch EntrantError.missingFirstName {
            } catch EntrantError.missingLastName {
            } catch {
            }
        }
    }
    
    func createVIPGuest() {
        if entrantPassType == .vipPass {
            do {
                let vipPass = try VIPGuest(firstName: "Bob", lastName: "Dyln", type: .vip, birthday: "02/19/2005")
                firstNameTextField.text = vipPass.firstName
                lastNameTextField.text = vipPass.lastName
            } catch EntrantError.missingFirstName {
            } catch EntrantError.missingLastName {
            } catch {
            }
        }
    }
    
    func createSeasonPassGuest() {
        if entrantPassType == .seasonPass {
            do {
                let seasonPass = try SeasonPass(firstName: "Fredo", lastName: "Gomez", type: .seasonPassGuest, birthday: "08/26/1993", address: "1 Forever Point", city: "Cupertino", state: "CA", zipCode: 55555)
                firstNameTextField.text = seasonPass.firstName
                lastNameTextField.text = seasonPass.lastName
                streetAddressTextField.text = seasonPass.address
                cityTextField.text = seasonPass.city
                stateTextField.text = seasonPass.state
                zipTextField.text = String(describing: seasonPass.zipCode)
            } catch EntrantError.missingFirstName {
            } catch EntrantError.missingLastName {
            } catch EntrantError.missingAddress {
            } catch EntrantError.missingCity {
            } catch EntrantError.missingState {
            } catch EntrantError.missingZip {
            } catch {
            }
        }
    }
    
    func createFoodServicesPass() {
        let foodServicesPass =  FoodServices(firstName: "Walter", lastName: "J.", address: "1 Infinite Loop", city: "Cupertino", state: "CA", zipCode: 95014, birthday: "02/14/1980")
        firstNameTextField.text = foodServicesPass.firstName
        lastNameTextField.text = foodServicesPass.lastName
        streetAddressTextField.text = foodServicesPass.address
        cityTextField.text = foodServicesPass.city
        stateTextField.text = foodServicesPass.state
        zipTextField.text = String(describing: foodServicesPass.zipCode!)
    }
    
    func createRideControlPass() {
        let rideControlPass =  RideControl(firstName: "George", lastName: "Lopez", address: "1 Infinite Loop", city: "Cupertino", state: "CA", zipCode: 95014, birthday: "03/10/1964")
        firstNameTextField.text = rideControlPass.firstName
        lastNameTextField.text = rideControlPass.lastName
        streetAddressTextField.text = rideControlPass.address
        cityTextField.text = rideControlPass.city
        stateTextField.text = rideControlPass.state
        zipTextField.text = String(describing: rideControlPass.zipCode!)
    }
    
    func createMaintenancePass() {
        let maintenancePass =  Maintenance(firstName: "Ray", lastName: "Wonderlich", address: "1 Infinite Loop", city: "Cupertino", state: "CA", zipCode: 95014, birthday: "01/15/1986")
        firstNameTextField.text = maintenancePass.firstName
        lastNameTextField.text = maintenancePass.lastName
        streetAddressTextField.text = maintenancePass.address
        cityTextField.text = maintenancePass.city
        stateTextField.text = maintenancePass.state
        zipTextField.text = String(describing: maintenancePass.zipCode)
    }
    
    func createManagerPass() {
        let managerPass =  EmployeeManager(firstName: "Abraham", lastName: "Lincoln", address: "1 Infinite Loop", city: "Cupertino", state: "CA", zipCode: 95014, birthday: "06/04/1850")
        firstNameTextField.text = managerPass.firstName
        lastNameTextField.text = managerPass.lastName
        streetAddressTextField.text = managerPass.address
        cityTextField.text = managerPass.city
        stateTextField.text = managerPass.state
        zipTextField.text = String(describing: managerPass.zipCode)
    }
    
    // Check if textFields are nil
    func checkTextFieldForNil() {
        let hourlyEmployeeTextFields = [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField]
        let contractEmployeeTextFields = [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField, projectNumTextField]
        let childAndSeniorTextFields = [dobTextField, firstNameTextField, lastNameTextField]
        let adultAndVIPTextFields = [firstNameTextField, lastNameTextField]
        let vendorTextFields = [dobTextField, ssnTextField, firstNameTextField, lastNameTextField, companyTextField]
        for field in hourlyEmployeeTextFields {
            if field?.text?.isEmpty == true && (entrantPassType == .foodServicesPass || entrantPassType == .rideControlPass || entrantPassType == .maintenancePass || entrantPassType == .seasonPass || entrantPassType == .managerPass) {
                let alert = UIAlertController(title: "Error!", message: "Fill In Required Fields", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        for field in contractEmployeeTextFields {
            if field?.text?.isEmpty == true && entrantPassType == .contractEmployeePass {
                let alert = UIAlertController(title: "Error!", message: "Fill In Required Fields", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }

        }
        
        for field in childAndSeniorTextFields {
            if field?.text?.isEmpty == true && ( entrantPassType == .childPass || entrantPassType == .seniorPass) {
                let alert = UIAlertController(title: "Error!", message: "Fill In Required Fields", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }

        }
        
        for field in adultAndVIPTextFields {
            if field?.text?.isEmpty == true && ( entrantPassType == .classicPass || entrantPassType == .vipPass) {
                let alert = UIAlertController(title: "Error!", message: "Fill In Required Fields", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }

        }
        
        for field in vendorTextFields {
            if field?.text?.isEmpty == true && passType == .vendor {
                let alert = UIAlertController(title: "Error!", message: "Fill In Required Fields", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }

        }
    }
    
    // Hide CheckBox
    
    func hideCheckBox() {
        if passType == .employee || passType == .vendor {
            checkBox.isHidden = true
            seasonPassLabel.isHidden = true
        } else {
            checkBox.isHidden = false
            seasonPassLabel.isHidden = false
        }
    }
    
    // UnHighlight all Text Fields
    
    func disableHighlightForTextFields() {
        let arrayofTextFields = [dobTextField, ssnTextField, projectNumTextField, firstNameTextField,
                                 lastNameTextField, companyTextField, streetAddressTextField, cityTextField,
                                 stateTextField, zipTextField]
        
        for field in arrayofTextFields {
            field?.backgroundColor = .clear
        }
    }
    
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
        } else if guest == .seasonPassGuest && isSelected == true {
            entrantPassType = EntrantPass.seasonPass
            print("Creating \(entrantPassType?.rawValue)")
        } else if guest == .senior && isSelected == true {
            entrantPassType = .seniorPass
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
        } else if guest == .senior {
            discount.foodDiscount = 10
            discount.merchDiscount = 10
        }
        
        if employee == .foodServices || employee == .rideControl || employee == .maintenence {
            discount.foodDiscount = 15
            discount.merchDiscount = 25
        } else if employee == .manager {
            discount.foodDiscount = 25
            discount.merchDiscount = 25
        } else if employee == .contractEmployee {
            discount.foodDiscount = 0
            discount.merchDiscount = 0
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
    
    func hightlightRequiredFieldsForAdultAndVIPGuest() {
        let arrayOfLabels = [firstNameLabel, secondNameLabel]
        let arrayOfRequiredTextFields = [firstNameTextField, lastNameTextField]
        let arrayOfNotRequiredTextFields = [dobTextField, ssnTextField, projectNumTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField]
        
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
    
    func highlightRequiredFieldsForSeasonPass() {
        let arrayOfLabel = [firstNameLabel, secondNameLabel, streetAddressLabel, cityLabel, stateLabel, zipLabel]
        let arrayOfRequiredTextFields = [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField]
        let arrayOfNotRequiredTextFields = [ssnTextField, projectNumTextField, dobTextField, companyTextField]
        
        for label in arrayOfLabel {
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
    
    // Employee Helper Methods
    
    func setEmployeeTitles() { // Sets all the titles
        entrantTypeSubType1.setTitle(EntrantType.foodServices.rawValue, for: .normal)
        entrantTypeSubType2.setTitle(EntrantType.rideControl.rawValue, for: .normal)
        entrantTypeSubType3.setTitle(EntrantType.maintenence.rawValue, for: .normal)
        entrantTypeSubType4.setTitle(EntrantType.contractEmployee.rawValue, for: .normal)
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
        } else if employee == .contractEmployee && isSelected == true {
            entrantPassType = EntrantPass.contractEmployeePass
            print("Creating \(entrantPassType?.rawValue)")
        } else if employee == .manager && isSelected == true {
            entrantPassType = EntrantPass.managerPass
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
    
    func highlightRequiredFieldsForContractEmployee() {
        let arrayOfLabels = [firstNameLabel, secondNameLabel, streetAddressLabel, cityLabel, stateLabel, zipLabel, projectLabel]
        let arrayOfTextFields = [firstNameTextField, lastNameTextField, streetAddressTextField, cityTextField, stateTextField, zipTextField, projectNumTextField]
        let arrayOfNotRequiredTextFields = [ssnTextField, companyTextField, dobTextField]
        
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



















































