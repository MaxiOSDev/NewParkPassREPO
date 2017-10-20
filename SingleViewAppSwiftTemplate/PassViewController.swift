//
//  PassViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 10/17/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class PassViewController: UIViewController {
    @IBOutlet weak var nameOfEntrant: UILabel!
    @IBOutlet weak var typeOfEntrantPass: UILabel!
    @IBOutlet weak var typeOfRideAccess: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    
    var nameOfEntrantText: String? = nil
    var typeOfEntrantPassText: String? = nil
    var typeOfRideAccessText: String? = nil
    var foodDiscountText: String? = nil
    var merchDiscountText: String? = nil
    
    
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
}
