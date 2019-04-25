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
    //Background
    let backgroundImageView = UIImageView()
    
    @IBOutlet weak var backgroundDebug: UIImageView!
    
    /* Fields on welcome screen*/
    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var getStarted: SubmitButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        WelcomeScreenViewControllerInit()
    }
    
    
    //Initialize all variables needed to display welcome screen
    func WelcomeScreenViewControllerInit() {
        //Get started button
        getStarted.setTitle("Get Started", for: .normal)
        getStarted.addTarget(self, action: #selector(getStartedAction), for: .touchUpInside)
    
        //Set Background
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "welcomeScreen_background1.jpg")
        view.sendSubviewToBack(backgroundImageView)
    
    }
    
    @objc func getStartedAction() {
        performSegue(withIdentifier: "welcomeScreen-profileCreation", sender: nil)
        print("Get started button tapped, going to profile creation scene")
    }

}
