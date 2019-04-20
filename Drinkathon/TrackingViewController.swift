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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       toggleTimer(on: true)
        
        
        
    }
    

    func toggleTimer(on: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.duration += 1
            strongSelf.drinkTimer.text = String(strongSelf.duration)
        })
    }
    
    
    
}
