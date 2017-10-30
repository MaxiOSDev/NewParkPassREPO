//
//  PassViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 10/17/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import AVFoundation

class PassViewController: UIViewController {
    
    var player: AVAudioPlayer? // Needed for "ding" and "buzz" sounds
    // Variables for data
    var typeOfPass: EntrantPass? = nil
    var entrantType: EntrantPassType? = nil
    var areaAccess: [AreaAccess] = []
    var projectNumber: String? = nil
    // Needed Variable for transition of card
    var flippedCard = false
    // IBOutlets
    @IBOutlet weak var nameOfEntrant: UILabel!
    @IBOutlet weak var typeOfEntrantPass: UILabel!
    @IBOutlet weak var typeOfRideAccess: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    @IBOutlet weak var resultsLable: UILabel!
    @IBOutlet weak var projectNumberLabel: UILabel!
    
    @IBOutlet weak var amusementAreasButton: UIButton!
    @IBOutlet weak var rideControlAreasButton: UIButton!
    @IBOutlet weak var kitchenAreasButton: UIButton!
    @IBOutlet weak var maintainenceAreaButton: UIButton!
    @IBOutlet weak var officeAreasButton: UIButton!
    @IBOutlet weak var discountAccess: UIButton!
    @IBOutlet weak var passHoleView: UIButton!
    @IBOutlet weak var backPassHoleView: UIButton!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var backOfPassView: UIView!
    // More variables for data
    var nameOfEntrantText: String? = nil
    var typeOfEntrantPassText: String? = nil
    var typeOfRideAccessText: String? = nil
    var foodDiscountText: String? = nil
    var merchDiscountText: String? = nil
    
    @IBOutlet weak var resultsView: UIView! // Results view
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextWithData() // Updates labels and text with data from other view controller
        curveBoarders() // Curves boarders of views and buttons
        projectNumberLabel.isHidden = true
        updateProjectLabel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Updates text with data
    func updateTextWithData() {
        nameOfEntrant.text = nameOfEntrantText
        typeOfEntrantPass.text = typeOfEntrantPassText
        typeOfRideAccess.text = typeOfRideAccessText
        foodDiscountLabel.text = foodDiscountText
        merchDiscountLabel.text = merchDiscountText
        projectNumberLabel.text = projectNumber
    }
    // Updates project label and un hides it when employee pass is a contract employee
    func updateProjectLabel() {
        if typeOfEntrantPass.text == EntrantPass.contractEmployeePass.rawValue {
            if let unwrappedProjectNumber = projectNumber {
                projectNumberLabel.isHidden = false
                projectNumberLabel.text = "• Project Number: \(unwrappedProjectNumber)"
            }
        }
    }
    // Flips Card Transition! just thought it was a nice thing to add
    @IBAction func flipCard(_ sender: UIButton) {
        flippedCard = !flippedCard
        
        let fromView = flippedCard ? passView : backOfPassView
        let toView = flippedCard ? backOfPassView : passView
        
        UIView.transition(from: fromView!, to: toView!, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
    }
    // Swipe pass and check each areas access depending on the pass with a lock method using a timer for 5 seconds
    @IBAction func swipePass(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            
            checkAmusementAreaAccess()
            self.amusementAreasButton.isEnabled = false
            
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.enableAmusementButton), userInfo: nil, repeats: false)
            
        case 2:
            checkRideControlAccess()
            self.rideControlAreasButton.isEnabled = false
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.enableRideControlButton), userInfo: nil, repeats: false)
        case 3:
            checkKitchenAccess()
            self.kitchenAreasButton.isEnabled = false
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.enableKitchenButton), userInfo: nil, repeats: false)
        case 4:
            checkMaintenanceAccess()
            self.maintainenceAreaButton.isEnabled = false
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.enableMaitenanceButton), userInfo: nil, repeats: false)
        case 5:
            checkOfficeAccess()
            self.officeAreasButton.isEnabled = false
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.enableOfficeButton), userInfo: nil, repeats: false)
        case 6: checkDiscountAccess()
        self.discountAccess.isEnabled = false
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.enableDiscountButton), userInfo: nil, repeats: false)
        default: fatalError("Something went horribly wrong! Oh Snap")
        }
    }
    
    // Checks Area Access and animates results view with appropriate color and sounds
    func checkAmusementAreaAccess() {
        let when = DispatchTime.now() + 5
        if entrantType == .guest || typeOfPass == EntrantPass.foodServicesPass || typeOfPass == EntrantPass.rideControlPass || typeOfPass == EntrantPass.maintenancePass || typeOfPass == EntrantPass.managerPass  || projectNumber == "1001" || projectNumber == "1002" || projectNumber == "1003" ||
            typeOfEntrantPass.text == EntrantPass.orkinVendorPass.rawValue || typeOfEntrantPass.text == EntrantPass.nwElectricalVendorPass.rawValue {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                swipeTimer.isTimerRunning = true
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .green
                self.playGrantedSound()
                self.resultsLable.text = "Access Granted For Amusement Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: { 
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        } else {
           UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
            self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            self.resultsView.alpha = 1.0
            self.resultsView.backgroundColor = .red
            self.playRejectedSound()
            self.resultsLable.text = "Access Denied For Amusement Areas"
           }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: { 
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        }
        
        
    }
    // Checks Ride Control Access and animates results view with appropriate color and sounds
    func checkRideControlAccess() {
        let when = DispatchTime.now() + 5
        if typeOfPass == .rideControlPass || typeOfPass == .maintenancePass || typeOfPass == .managerPass || typeOfPass == .nwElectricalVendorPass || typeOfPass == .orkinVendorPass || projectNumber == "1001" || projectNumber == "1002" || projectNumber == "1003" {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .green
                self.playGrantedSound()
                self.resultsLable.text = "Access Granted For Ride Control Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .red
                self.playRejectedSound()
                self.resultsLable.text = "Access Denied For Ride Control Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        }
    }
    // Checks Kitchen Access and animates results view with appropriate color and sounds
    func checkKitchenAccess() {
        let when = DispatchTime.now() + 5
        if typeOfPass == .foodServicesPass || typeOfPass == .maintenancePass || typeOfPass == .managerPass || typeOfPass == .nwElectricalVendorPass || typeOfPass == .acmeVendorPass || typeOfPass == .orkinVendorPass || projectNumber == "1003" || projectNumber == "2002" {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .green
                self.playGrantedSound()
                self.resultsLable.text = "Access Granted For Kitchen Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .red
                self.playRejectedSound()
                self.resultsLable.text = "Access Denied For Amusement Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        }
    }
    // Checks Maintenance Access and animates results view with appropriate color and sounds
    func checkMaintenanceAccess() {
        let when = DispatchTime.now() + 5
        if typeOfPass == .maintenancePass || typeOfPass == .managerPass || typeOfPass == .nwElectricalVendorPass || typeOfPass == .fedexVendorPass || projectNumber == "1002" || projectNumber == "1003" || projectNumber == "2002" {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .green
                self.playGrantedSound()
                self.resultsLable.text = "Access Granted For Maintenance Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .red
                self.playRejectedSound()
                self.resultsLable.text = "Access Denied For Maintenance Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        }
    }
    // Checks Office Access and animates results view with appropriate color and sounds
    func checkOfficeAccess() {
        let when = DispatchTime.now() + 5
        if typeOfPass == .managerPass || typeOfPass == .nwElectricalVendorPass || typeOfPass == .fedexVendorPass || projectNumber == "1003" || projectNumber == "2001" {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .green
                self.playGrantedSound()
                self.resultsLable.text = "Access Granted For Office Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .red
                self.playRejectedSound()
                self.resultsLable.text = "Access Denied For Office Areas"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
        }
    }
    
    // Checks disount access if it even has any
    func checkDiscountAccess() {
        let when = DispatchTime.now() + 5
        if (typeOfPass == .vipPass || typeOfPass == .seniorPass || typeOfPass == .seasonPass || entrantType == .employee) && typeOfPass != .contractEmployeePass {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .green
                self.playGrantedSound()
                self.resultsLable.text = "\(self.foodDiscountText!)\n\(self.merchDiscountText!)"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
            
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
                self.resultsView.alpha = 1.0
                self.resultsView.backgroundColor = .red
                self.playRejectedSound()
                self.resultsLable.text = "No Food or Merchandise Discount"
            }, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.resultsView.layer.removeAllAnimations()
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
            })
            
        }
    }
    // Sound helper methods
    // Granted Sound
    func playGrantedSound() {
        guard let url = Bundle.main.url(forResource: "AccessGranted", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    // Rejected Sound
    func playRejectedSound() {
        guard let url = Bundle.main.url(forResource: "AccessDenied", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }

    }
    // Locks access alert. Un used, idea didn't work out
    func lockAccess() {
        let alert = UIAlertController(title: "Locked Access", message: "Access locked after 5 Seconds", preferredStyle: .alert)
         self.present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    // When timer is on locks buttons but when it is off it enables them.
    @objc func enableAmusementButton() {
        self.amusementAreasButton.isEnabled = true
    }
    
    @objc func enableRideControlButton() {
        self.rideControlAreasButton.isEnabled = true
    }
    
    @objc func enableMaitenanceButton() {
        self.maintainenceAreaButton.isEnabled = true
    }
    
    @objc func enableKitchenButton() {
        self.kitchenAreasButton.isEnabled = true
    }
    
    @objc func enableOfficeButton() {
        self.officeAreasButton.isEnabled = true
    }
    
    @objc func enableDiscountButton() {
        self.discountAccess.isEnabled = true
    }
    // Curve my view and button boarders
    func curveBoarders() {
        // Curve Passes/ UIViews
        backPassHoleView.layer.cornerRadius = 15.0
        backPassHoleView.clipsToBounds = true
        passHoleView.layer.cornerRadius = 15.0
        passHoleView.clipsToBounds = true
        passView.layer.cornerRadius = 5.0
        passView.clipsToBounds = true
        backOfPassView.layer.cornerRadius = 5.0
        backOfPassView.clipsToBounds = true
        
        // Curve Buttons
        let buttons = [amusementAreasButton, kitchenAreasButton, rideControlAreasButton, maintainenceAreaButton, officeAreasButton, discountAccess]
        
        for button in buttons {
            button?.layer.cornerRadius = 5.0
            button?.clipsToBounds = true
        }
    }
}
    















