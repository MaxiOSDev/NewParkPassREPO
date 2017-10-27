//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//
import GameKit
import UIKit

class ViewController: UIViewController {
    // MARK: VARIABLES
    var hasHid: Bool = false
    var passType: EntrantPassType? = nil
    var guest: EntrantType? = nil
    var employee: EntrantType? = nil
    var vendor: EntrantType? = nil
    var entrantPassType: EntrantPass? = nil
    var isSelected: Bool = false
    var rideAccess: RideAccess?
    var areaAccess: [AreaAccess]? = nil
    var discount = EntrantDiscount()
    // MARK: OUTLETS
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
    
    // MARK: PASS VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passViewController = segue.destination as? PassViewController {
            passViewController.nameOfEntrantText = "\(firstNameTextField.text!) \(lastNameTextField.text!)"
            passViewController.typeOfEntrantPassText = entrantPassType?.rawValue
            if let unwrappedRideAccess = rideAccess {
                passViewController.typeOfRideAccessText =  "• \(unwrappedRideAccess.rawValue)"
            }
            passViewController.foodDiscountText = "• \(discount.foodDiscount)% Food Discount"
            passViewController.merchDiscountText = "• \(discount.merchDiscount)% Merch Discount"
            passViewController.typeOfPass = entrantPassType
            passViewController.entrantType = passType
            if let nonOptionalArea = areaAccess {
                passViewController.areaAccess = nonOptionalArea
            }
            passViewController.projectNumber = projectNumTextField.text
        }
    }
    
    // MARK: IB ACTIONS
    // Entrant Type Button Actions
    @IBAction func selectedGuestType(_ sender: Any) {
        entrantPassType = .noPassSelected
        isSelected = false
        checkBox.isSelected = false
        disableHighlightForTextFields()
        setGuestTitles()
        animateSubMenuDown()
        hideCheckBox()
        print("PASS TYPE IS \(entrantPassType)")
    }
    
    @IBAction func selectedEmployeeType(_ sender: Any) {
        entrantPassType = .noPassSelected
        isSelected = false
        checkBox.isSelected = false
        
        disableHighlightForTextFields()
        setEmployeeTitles()
        animateSubMenuDown()
        hideCheckBox()
    }
    
    @IBAction func selectedManagerType(_ sender: Any) {
        print("PASS TYPE IS \(entrantPassType)")
        entrantPassType = .noPassSelected
        print("PASS TYPE IS \(entrantPassType)")
        isSelected = false
        checkBox.isSelected = false
        disableHighlightForTextFields()
        passType = .employee
        animateSubMenuUp()
        hideCheckBox()
        ssnLabel.text = "SSN"
        ssnTextField.placeholder = "###-##-####"
        employee = .manager
        areaAccess = [AreaAccess.amusementAreas, AreaAccess.kitchenAreas, AreaAccess.rideControlAreas, AreaAccess.maintenenceAreas, AreaAccess.office]
        print(areaAccess!)
        rideAccess = .allRides
        entrantPassType = EntrantPass.managerPass
        print("Creating \(entrantPassType?.rawValue)")
        checkEmployeeSubType()
        checkSubTypeDiscount()
        highlightRequiredFieldsForEmployee()
        isSelected = true
    }
    
    @IBAction func selectedVendorType(_ sender: Any) {
        entrantPassType = .noPassSelected
        print("PASS TYPE IS \(entrantPassType)")
        isSelected = false
        checkBox.isSelected = false
        disableHighlightForTextFields()
        setVendorTitles()
        animateSubMenuDown()
        hideCheckBox()
        rideAccess = RideAccess.noRides
    }
    
    @IBAction func checkBoxClicked(_ sender: Any) {
        
        if checkBox.isSelected == true {
            print("PASS TYPE IS \(entrantPassType)")
            checkBox.isSelected = false
            disableHighlightForTextFields()
            userInteractionDisabled()
            
        } else {
            
            populateDataButton.isUserInteractionEnabled = true
            guest = .seasonPassGuest
            print("PASS TYPE IS \(entrantPassType)")
            isSelected = true
            areaAccess = [.amusementAreas]
            rideAccess = RideAccess.skipLines
            checkBox.isSelected = true
            highlightRequiredFieldsForSeasonPass()
            checkSubTypeDiscount()
        }
    }
    
    // Entrant SubType Actions
    @IBAction func selectedEntrantSubOne(_ sender: Any) { // Child

        checkBox.isSelected = false
        if passType == .guest {

            isSelected = true
            guest = .child
            areaAccess = [AreaAccess.amusementAreas]
            print(areaAccess!)
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForGuest()
            checkGuestSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .employee {

            isSelected = true
            employee = .foodServices
            areaAccess = [AreaAccess.amusementAreas, AreaAccess.kitchenAreas]
            print(areaAccess!)
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .vendor {

            isSelected = true
            vendor = .acme
            areaAccess = [AreaAccess.kitchenAreas]
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
            areaAccess = [AreaAccess.amusementAreas]
            print(areaAccess!)
            rideAccess = RideAccess.allRides
            hightlightRequiredFieldsForAdultAndVIPGuest()
            checkGuestSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .employee {
            isSelected = true
            employee = .rideControl
            areaAccess = [AreaAccess.amusementAreas, AreaAccess.rideControlAreas]
            print(areaAccess!)
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .vendor {
            isSelected = true
            vendor = .orkin
            areaAccess = [AreaAccess.amusementAreas, AreaAccess.rideControlAreas, AreaAccess.kitchenAreas]
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
            areaAccess = [AreaAccess.amusementAreas]
            print(areaAccess!)
            rideAccess = RideAccess.skipLines
            highlightRequiredFieldsForGuest()
            checkGuestSubType()
            checkSubTypeDiscount()

        }
        
        if passType == .employee {
            isSelected = true
            employee = .maintenence
            areaAccess = [AreaAccess.amusementAreas, AreaAccess.kitchenAreas, AreaAccess.rideControlAreas, AreaAccess.maintenenceAreas]
            print(areaAccess!)
            rideAccess = RideAccess.allRides
            highlightRequiredFieldsForEmployee()
            checkEmployeeSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .vendor {

            isSelected = true
            vendor = .fedex
            areaAccess = [AreaAccess.maintenenceAreas, AreaAccess.office]
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
            areaAccess = [AreaAccess.amusementAreas]
            print(areaAccess!)
            rideAccess = RideAccess.skipLines
            hightlightRequiredFieldsForAdultAndVIPGuest()
            checkGuestSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .employee {
            isSelected = true
            employee = .contractEmployee
            areaAccess = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenenceAreas, .office]
            rideAccess = RideAccess.noRides
            highlightRequiredFieldsForContractEmployee()
            checkEmployeeSubType()
            checkSubTypeDiscount()
        }
        
        if passType == .vendor {
            isSelected = true
            vendor = .nwElectrical
            areaAccess = [AreaAccess.amusementAreas, AreaAccess.rideControlAreas, AreaAccess.kitchenAreas, AreaAccess.maintenenceAreas, AreaAccess.office]
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
        
        if entrantPassType == .noPassSelected {
            let alert = UIAlertController(title: "Error!", message: "No Entrant was Selected!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "I got it", style: .default, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)

        }
        
        
        if rideAccess == nil && areaAccess == nil {
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
        
        let textFields = [dobTextField, ssnTextField, projectNumTextField, firstNameTextField,
         lastNameTextField, companyTextField, streetAddressTextField, cityTextField,
         stateTextField, zipTextField]
        
        for field in textFields {
            if field?.backgroundColor == .clear && isSelected == true {
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
                case .some(.contractEmployeePass): createContractEmployeePass()
                case .some(.acmeVendorPass): createAcmeVendorPass()
                case .some(.orkinVendorPass): createOrkinVendorPass()
                case .some(.fedexVendorPass): createFedexPass()
                case .some(.nwElectricalVendorPass): creatNWElectricalPass()
                default:  let alert = UIAlertController(title: "Error!", message: "No Entrant was Selected!", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "I got it", style: .default, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
                }
            }
        }

    }
    
    
    // MARK: HELPER METHODS

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
    
    // Populate Data Methods
    // MARK: HARD CODED INSTANCES
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
                if let unwrappedZip = seasonPass.zipCode {
                    zipTextField.text = String(describing: unwrappedZip)
                }
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
        if let unwrappedZip = foodServicesPass.zipCode {
            zipTextField.text = String(describing: unwrappedZip)
        }
    }
    
    func createRideControlPass() {
        let rideControlPass =  RideControl(firstName: "George", lastName: "Lopez", address: "1 Infinite Loop", city: "Cupertino", state: "CA", zipCode: 95014, birthday: "03/10/1964")
        firstNameTextField.text = rideControlPass.firstName
        lastNameTextField.text = rideControlPass.lastName
        streetAddressTextField.text = rideControlPass.address
        cityTextField.text = rideControlPass.city
        stateTextField.text = rideControlPass.state
        if let unwrappedZip = rideControlPass.zipCode {
            zipTextField.text = String(describing: unwrappedZip)
        }
    }
    
    func createMaintenancePass() {
        let maintenancePass =  Maintenance(firstName: "Ray", lastName: "Wonderlich", address: "1 Infinite Loop", city: "Cupertino", state: "CA", zipCode: 95014, birthday: "01/15/1986")
        firstNameTextField.text = maintenancePass.firstName
        lastNameTextField.text = maintenancePass.lastName
        streetAddressTextField.text = maintenancePass.address
        cityTextField.text = maintenancePass.city
        stateTextField.text = maintenancePass.state
        if let unwrappedZip = maintenancePass.zipCode {
            zipTextField.text = String(describing: unwrappedZip)
        }
        
    }
    
    func createManagerPass() {
        let managerPass =  EmployeeManager(firstName: "Abraham", lastName: "Lincoln", address: "1 Infinite Loop", city: "Cupertino", state: "CA", zipCode: 95014, birthday: "06/04/1850")
        firstNameTextField.text = managerPass.firstName
        lastNameTextField.text = managerPass.lastName
        streetAddressTextField.text = managerPass.address
        cityTextField.text = managerPass.city
        stateTextField.text = managerPass.state
        if let unwrappedZip = managerPass.zipCode {
         zipTextField.text = String(describing: unwrappedZip)
        }
        
    }
    
    func createContractEmployeePass() {
        do {
        let contractEmployeePass = try ContractEmployee(projectNum: [1001,1002,1003,2001,2002], firstName: "Jerry", lastName: "Tom", address: "2001 Whatevr Rd.", city: "Los Angles", state: "CA", zipCode: 55555, birthday: "12/12/2000")
        let randomProject = Int(arc4random_uniform(UInt32(contractEmployeePass.projectsNumbers.count)))
        
            if randomProject == 0 {
                projectNumTextField.text = "1001"
            } else if randomProject == 1 {
                projectNumTextField.text = "1002"
            } else if randomProject == 2 {
                projectNumTextField.text = "1003"
            } else if randomProject == 3 {
                projectNumTextField.text = "2001"
            } else if randomProject == 4 {
                projectNumTextField.text = "2002"
            }
        
        firstNameTextField.text = contractEmployeePass.firstName
        lastNameTextField.text = contractEmployeePass.lastName
        streetAddressTextField.text = contractEmployeePass.address
        cityTextField.text = contractEmployeePass.city
        stateTextField.text = contractEmployeePass.state
            if let unwrappedZip = contractEmployeePass.zipCode {
               zipTextField.text = String(describing: unwrappedZip)
            }
        } catch EntrantError.missingProjectNum {
        } catch EntrantError.missingFirstName {
        } catch EntrantError.missingLastName {
        } catch EntrantError.missingAddress {
        } catch EntrantError.missingCity {
        } catch EntrantError.missingState {
        } catch EntrantError.missingZip {
        } catch {
        }
    }
    
    func createAcmeVendorPass() {
        let acmeVendorPass = VendorAcme(firstName: "Freddy", lastName: "Lahm", company: "Acme", dob: "06/20/1963", dov: "01/01/2017")
        dobTextField.text = acmeVendorPass.dob
        ssnTextField.text = acmeVendorPass.dov
        firstNameTextField.text = acmeVendorPass.firstName
        lastNameTextField.text = acmeVendorPass.lastName
        companyTextField.text = acmeVendorPass.company
    }

    func createOrkinVendorPass() {
        let orkinVendorPass = VendorOrkin(firstName: "Howard", lastName: "Vince", company: "Orkin", dob: "04/26/1982", dov: "05/01/2017")
        dobTextField.text = orkinVendorPass.dob
        ssnTextField.text = orkinVendorPass.dov
        firstNameTextField.text = orkinVendorPass.firstName
        lastNameTextField.text = orkinVendorPass.lastName
        companyTextField.text = orkinVendorPass.company
    }
    
    func createFedexPass() {
        let fedexVendorPass = VendorFedex(firstName: "Cristian", lastName: "Pulisic", company: "Fedex", dob: "10/30/1973", dov: "11/25/2017")
        dobTextField.text = fedexVendorPass.dob
        ssnTextField.text = fedexVendorPass.dov
        firstNameTextField.text = fedexVendorPass.firstName
        lastNameTextField.text = fedexVendorPass.lastName
        companyTextField.text = fedexVendorPass.company
    }
    
    func creatNWElectricalPass() {
        let nwElectricalPass = VendorNWElectrical(firstName: "Ulisis", lastName: "Grant", company: "NW Electrical", dob: "04/28/1993", dov: "05/25/2017")
        dobTextField.text = nwElectricalPass.dob
        ssnTextField.text = nwElectricalPass.dov
        firstNameTextField.text = nwElectricalPass.firstName
        lastNameTextField.text = nwElectricalPass.lastName
        companyTextField.text = nwElectricalPass.company
    }

    // MARK: TEXTFIELD HELPER METHODS
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
            entrantPassType = .noPassSelected
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
        let arrayOfLabel = [dobLabel, ssnLabel, projectLabel, firstNameLabel, secondNameLabel, companyLabel, streetAddressLabel, cityLabel, stateLabel, zipLabel]
        
        
        for field in arrayofTextFields {
            
            field?.backgroundColor = .clear
            field?.text?.removeAll()
            field?.isUserInteractionEnabled = false
        }
        
        for label in arrayOfLabel {
            label?.textColor = UIColor(red: 141/255, green: 136/255, blue: 145/255, alpha: 1.0)
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
    
    
    // MARK: Guest Helper Methods
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
        } else if guest == .seasonPassGuest {
            discount.foodDiscount = 10
            discount.merchDiscount = 20
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
    
    // MARK: Employee Helper Methods
    
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
    
    // MARK: Vendor Helper Methods
    
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



















































