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
    
    var player: AVAudioPlayer?
    
    var typeOfPass: EntrantPass? = nil
    var entrantType: EntrantPassType? = nil
    var areaAccess: [AreaAccess] = []
    var projectNumber: String? = nil
    
    @IBOutlet weak var nameOfEntrant: UILabel!
    @IBOutlet weak var typeOfEntrantPass: UILabel!
    @IBOutlet weak var typeOfRideAccess: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    @IBOutlet weak var resultsLable: UILabel!
    
    @IBOutlet weak var amusementAreasButton: UIButton!
    @IBOutlet weak var rideControlAreasButton: UIButton!
    @IBOutlet weak var kitchenAreasButton: UIButton!
    @IBOutlet weak var maintainenceAreaButton: UIButton!
    @IBOutlet weak var officeAreasButton: UIButton!
    @IBOutlet weak var discountAccess: UIButton!
    
    var nameOfEntrantText: String? = nil
    var typeOfEntrantPassText: String? = nil
    var typeOfRideAccessText: String? = nil
    var foodDiscountText: String? = nil
    var merchDiscountText: String? = nil
    
    @IBOutlet weak var resultsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextWithData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTextWithData() {
        nameOfEntrant.text = nameOfEntrantText
        typeOfEntrantPass.text = typeOfEntrantPassText
        typeOfRideAccess.text = typeOfRideAccessText
        foodDiscountLabel.text = foodDiscountText
        merchDiscountLabel.text = merchDiscountText
    }
    
    @IBAction func swipePass(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            checkAmusementAreaAccess()
        case 2:
            checkRideControlAccess()
        case 3:
            checkKitchenAccess()
        case 4:
            checkMaintenanceAccess()
        case 5:
            checkOfficeAccess()
        case 6: checkDiscountAccess()
        default: fatalError("Something went horribly wrong! Oh Snap")
        }
    }
    
    func checkAmusementAreaAccess() {
        let when = DispatchTime.now() + 5
        if entrantType == .guest || entrantType == .employee || projectNumber == "1001" || projectNumber == "1002" || projectNumber == "1003" {
            UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .curveEaseInOut], animations: {
                self.resultsView.backgroundColor = UIColor(red: 203/255, green: 198/255, blue: 207/255, alpha: 1.0)
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
        }
        
        
    }
    
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
        }
    }
    
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
        }
    }
    
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
        }
    }
    
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
        }
    }
    
    
    
    func checkDiscountAccess() {
        if (typeOfPass == .vipPass || typeOfPass == .seniorPass || typeOfPass == .seasonPass || entrantType == .employee) && typeOfPass != .contractEmployeePass {
            foodDiscountLabel.backgroundColor = .green
            merchDiscountLabel.backgroundColor = .green
            discountAccess.backgroundColor = .green
            resultsView.backgroundColor = .green
            resultsLable.text = "Food Discount: \(foodDiscountText!), Merchandise Disocunt: \(merchDiscountText!)"
        } else {
            discountAccess.backgroundColor = .red
            resultsView.backgroundColor = .red
            resultsLable.text = "No Food or Merchandise Discount"
        }
    }
    
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
    
}
    















