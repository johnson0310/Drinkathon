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
    
    //Debug
    @IBOutlet weak var jumpToMain: UIButton!
    var testUser : userProfile!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        WelcomeScreenViewControllerInit()
        var testUser = userProfile(name: "John", age: 21, gender: 0, weight: 155, tipsy: 9999, blackOut: 9999)
        var newEvent = DrinkEvent(user: testUser)
        let newDrink = Beer()
        newEvent.addDrinks(newDrink: newDrink)
        print(newEvent.currentBAC)
        print(newEvent.drinksHad[0].timeWhenAdded)
        
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
        
        
        //Debug button
        //jumpToMain.addTarget(self, action: #selector(jumpAction), for: .touchUpInside)
        
        
    }
    
    @objc func getStartedAction() {
        performSegue(withIdentifier: "welcomeScreen-profileCreation", sender: nil)
        print("Get started button tapped, going to profile creation scene")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "debugSeagueToMain"{
            if let middleVC = segue.destination as? UITabBarController {
                let destVC = middleVC.viewControllers?.first as? AddDrinkViewController
                destVC?.user = self.testUser
            }
        }
    }
    
}
