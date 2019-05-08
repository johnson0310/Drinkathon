//
//  AddDrinkViewController.swift
//  Drinkathon
//
//  Created by Johnson on 4/25/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class AddDrinkViewController: UIViewController {
    
    /*Variables Declaration*/
    //User log object
    var user : userProfile!
    
    //Add drink buttons
    @IBOutlet weak var addOneStandardDrink: AddDrinkButton!
    @IBOutlet weak var addCustomDrinks: SubmitButton!
    @IBOutlet weak var addPreviousCustomDrink: UIButton!
    
    //Amount of drinks label
    @IBOutlet weak var amountOfDrinksText: UILabel!
    @IBOutlet weak var drinkCounter: UILabel!
    
    //Target Progress Bar
    @IBOutlet weak var drinkTargetProgress: UIProgressView!
    
    //Drink event control
    var drinkEvent : DrinkEvent?
    var isFirstDrink = true
    var drinkEvents = [DrinkEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AddDrinkViewControllerInit()
        AddDrinkViewControllerButtonSetup()
    }
    
    func AddDrinkViewControllerInit() {
        //Set Backgrond color
        self.view.backgroundColor = UIColor(red:0.98, green:0.82, blue:0.52, alpha:1.0)
        
        //Add one drink button
        addOneStandardDrink.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 55.0)
        addOneStandardDrink.layer.cornerRadius = 20
        addOneStandardDrink.titleLabel?.numberOfLines = 0
        addOneStandardDrink.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        //Add custom drink button
        addCustomDrinks.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 35.0)
        addCustomDrinks.layer.cornerRadius = 20
        addCustomDrinks.titleLabel?.numberOfLines = 0
        addCustomDrinks.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        addCustomDrinks.backgroundColor = UIColor(red:0.36, green:0.63, blue:0.83, alpha:1.0)
        
        //Add one drink button
        addPreviousCustomDrink.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 30.0)
        addPreviousCustomDrink.layer.cornerRadius = 20
        addPreviousCustomDrink.titleLabel?.numberOfLines = 0
        addPreviousCustomDrink.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        addPreviousCustomDrink.backgroundColor = UIColor(red:0.46, green:0.79, blue:0.76, alpha:1.0)

        //Amount of drinks label
        drinkTargetProgress.progress = 9/10
    }
    
    func AddDrinkViewControllerButtonSetup() {
        addOneStandardDrink.addTarget(self, action: #selector(addOneStandardDrinkAction), for: .touchUpInside)
        addCustomDrinks.addTarget(self, action: #selector(addCustomDrinksAction), for: .touchUpInside)
        addPreviousCustomDrink.addTarget(self, action: #selector(addPreviousCustomDrinkAction), for: .touchUpInside)
    }
    
    @objc func addOneStandardDrinkAction() {
        //If it's the first drink, create a new drink event
        if isFirstDrink { startEvent() }
        let newDrink = standardDrink()
        drinkEvent?.addDrinks(newDrink: newDrink)
    }
    
    @objc func addCustomDrinksAction() {
        //If it's the first drink, create a new drink event
        if isFirstDrink { startEvent() }
        performSegue(withIdentifier: "addDrinks-CustomDrinkSelection", sender: self)
    }
    
    @objc func addPreviousCustomDrinkAction() {
        //If it's the first drink, create a new drink event
        if isFirstDrink { startEvent() }
    }
    
    func startEvent() {
        var newEvent = DrinkEvent(user: user)
        isFirstDrink = false
        drinkEvent = newEvent
    }
    
    func endEvent() {
        drinkEvents.append(drinkEvent!)
        isFirstDrink = true
    }

}
