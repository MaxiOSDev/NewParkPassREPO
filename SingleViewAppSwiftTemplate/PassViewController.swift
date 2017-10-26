//
//  PassViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 10/17/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit


class PassViewController: UIViewController {
    var typeOfPass: EntrantPass? = nil
    var entrantType: EntrantPassType? = nil
    var areaAccess: [AreaAccess] = []
    
    @IBOutlet weak var nameOfEntrant: UILabel!
    @IBOutlet weak var typeOfEntrantPass: UILabel!
    @IBOutlet weak var typeOfRideAccess: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    
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

    }
    
    func checkAccess(for entrant: EntrantPass) {
        
        
        
    }
    
    
}
    















