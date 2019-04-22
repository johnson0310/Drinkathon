//
//  TrackingViewController.swift
//  Drinkathon
//
//  Created by Johnson on 4/18/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class TrackingViewController: UIViewController {

    /* Variable initialization */
    //Timer
    @IBOutlet weak var drinkTimer: UILabel!
    var duration = 0
    var timer = Timer()
    var isTimerOn = false
    var bacTimeCounter = 0
    
    let calendar = Calendar.current
    
    var start: CFAbsoluteTime!
    var startTime = Int()
    var currentTime = Int()
    
    //Body parameter
    let gender = ViewController.gender
    let weight = ViewController.weight
    
    //Image
    @IBOutlet weak var addDrink: UIImageView!
    
    //Drink counter
    @IBOutlet weak var drinkCounter: UILabel!
    var numDrinks = 0
    
    //BAC
    @IBOutlet weak var bacLevelLable: UILabel!
    
    //Background
    let secondScreenBackgroundImageView = UIImageView()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Pop up alert to notify user how to add drinks
        let howToAddDrinkAlert = UIAlertController(title: "", message: "Tap the Red Solo Cup to add a drink!", preferredStyle: .alert)
        howToAddDrinkAlert.addAction(UIAlertAction(title: "Got it!", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(howToAddDrinkAlert, animated: true, completion: nil)
        }
        
        
        //self.present(howToAddDrinkAlert, animated: true)
        
        secondScreenInitialization()
        
        
        
    }
    

    //Initialize all fields on second screen
    func secondScreenInitialization() {
        
        
        /* Initialilze variables */
        
        //Image
        
        
        addDrink.image = UIImage(named: "red_solo_cup_burned.png")
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        // add it to the image view;
        addDrink.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        addDrink.isUserInteractionEnabled = true
        
        //Set Background
        view.addSubview(secondScreenBackgroundImageView)
        secondScreenBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        secondScreenBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        secondScreenBackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        secondScreenBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        secondScreenBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        secondScreenBackgroundImageView.image = UIImage(named: "foamed_beer_background.jpg")
        view.sendSubviewToBack(secondScreenBackgroundImageView)
        
        
    }
    
    //Calculate timer time in the format of HH:MM:SS
    func formattedTimer (time: Int) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    //Calculate BAC
    func bacLevel(numDrinks: Int, sex: Int, weight: Int, timeSinceFirst: Int) -> Double {
        var ratio = Double()
        let numDrinksF = Double(numDrinks)
        let weightF = Double(weight)
        let timeSinceFirstF = Double(timeSinceFirst)
        
        if sex == 0 {
            ratio = 0.73
        } else {
            ratio = 0.68
        }
        
        //Liquid ounces of alchohol consumed
        var bac = ((numDrinksF * 1.5) * 0.4) * 5.14
        
        bac = bac / (weightF * ratio)
        bac = bac - timeSinceFirstF * 0.15
        
        return bac
    }
    
    
    
    
    //Check if the image is tapped
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image2 Tapped")
            
            //Check if the image was clicked for the first time
            if isTimerOn == false {
                //Set start time of the first drink
                startTime = Int(CFAbsoluteTimeGetCurrent())
                toggleTimer(on: true)
                isTimerOn = true
            }
            
            numDrinks += 1
            drinkCounter.text = String(numDrinks)
            
            updateBACLevel()
        }
    }
    
    
    
    //Start a timer
    //Updates time label
    //Updates BAC level label
    func toggleTimer(on: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { [weak self] (_) in
            guard let strongSelf = self else { return }

            //Find the new duration
            strongSelf.currentTime = Int(CFAbsoluteTimeGetCurrent())
            strongSelf.duration = strongSelf.currentTime - strongSelf.startTime
            
            strongSelf.drinkTimer.text = self?.formattedTimer(time: strongSelf.duration)
            strongSelf.bacTimeCounter += 1
        
            strongSelf.updateBACLevel()
        })
    }
    
    
    //Updates BAC level
    func updateBACLevel() {
        //Update BAC every second
        var currentBAC = String(format: "%.3f", self.bacLevel(numDrinks: self.numDrinks, sex: Int(self.gender), weight: Int(self.weight!), timeSinceFirst: Int(self.duration) / 3600))
        currentBAC = currentBAC + " %"
        self.bacLevelLable.text = currentBAC
    }

    
    
}
