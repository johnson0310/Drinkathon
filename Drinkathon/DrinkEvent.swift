//
//  DrinkEvent.swift
//  Drinkathon
//
//  Created by Johnson on 4/25/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import Foundation

class DrinkEvent {
    private var numDrinks = 0.0
    private var timeSinceFirstDrink = 0
    private var currentBAC = 0.0
    private var singleDrinkCalorie = 0
    private var totalCalories = 0.0
    
    init() {}
    
    func updateBAC(drinkVolume: Double, sex: Int, weight: Int, timeSinceFirst: Double) {
        var ratio = Double()
        let weightDouble = Double(weight)
        
        if sex == 0 {
            ratio = 0.73
        } else {
            ratio = 0.68
        }
        
        //Liquid ounces of alchohol consumed
        var bac = drinkVolume * 5.14
        
        bac = bac / (weightDouble * ratio)
        bac = bac - timeSinceFirst * 0.15
        
        currentBAC = bac
    }
    
    
    
    
    
    
}
