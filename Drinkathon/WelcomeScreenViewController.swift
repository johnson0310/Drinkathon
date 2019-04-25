//
//  WelcomeScreenViewController.swift
//  Drinkathon
//
//  Created by Johnson on 4/24/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    /* Variable initialization */

    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var getStarted: SubmitButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        WelcomeScreenViewControllerInitialization()
    }
    

    func WelcomeScreenViewControllerInitialization() {
        //Get started button
        getStarted.setTitle("Get Started", for: .normal)
        getStarted.addTarget(self, action: #selector(getStartedAction), for: .touchUpInside)
    }
    
    @objc func getStartedAction() {
        performSegue(withIdentifier: "welcomeScreen-profileCreation", sender: nil)
    }

}
