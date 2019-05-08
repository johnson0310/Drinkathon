//
//  CustomDrinksViewController.swift
//  Drinkathon
//
//  Created by Johnson on 5/4/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class CustomDrinksViewController: UIViewController {

    
    
    
    //Images to add drinks
    @IBOutlet weak var addBeerImage: UIImageView!
    @IBOutlet weak var addIPAImage: UIImageView!
    @IBOutlet weak var addWineImage: UIImageView!
    @IBOutlet weak var addChampagneImage: UIImageView!
    @IBOutlet weak var addSpiritsImage: UIImageView!
    
    
    @IBOutlet weak var cancelButton: UIButton!
    
    
    //Debug
    @IBOutlet weak var debug: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        debug.addTarget(self, action: #selector(debugAction), for: .touchUpInside)
    }
    
    @objc func debugAction() {
        performSegue(withIdentifier: "customDrink-AddBeer", sender: nil)
    }
    

}
