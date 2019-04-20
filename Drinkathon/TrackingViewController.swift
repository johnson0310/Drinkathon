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
    
    //Body parameter
    let gender = ViewController.gender
    let weight = ViewController.weight
    
    //Image
    @IBOutlet weak var addDrink: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //secondScreenInitialization()
        toggleTimer(on: true)
        
        
    }
    

    //Initialize all fields on second screen
    func secondScreenInitialization() {
        /* Initialilze variables */
        
        //Image
        //addDrink.image = UIImage(named: "red_solo_cup.jpg")
//        // create tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
//        // add it to the image view;
//        addDrink.addGestureRecognizer(tapGesture)
//        // make sure imageView can be interacted with by user
//        addDrink.isUserInteractionEnabled = true
        
        
    }
    
    //Check if the image is tapped
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image2 Tapped")
            
        }
    }
    
    
    
    
    func toggleTimer(on: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.duration += 1
            strongSelf.drinkTimer.text = String(strongSelf.duration)
        })
    }
    
    
    
    
    
}
