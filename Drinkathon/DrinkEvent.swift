//
//  DrinkEvent.swift
//  Drinkathon
//
//  Created by Johnson on 4/25/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import Foundation

class DrinkEvent {
    var numDrinks = 0.0
    
    var timer = Timer()
    var isTimerOn = false;
    var timeStartedDrinking = 0
    var timeSinceFirstDrink = 0
    var longestTimeBetweenDrinks = 0
    var shortestTimeBetweenDrinks = 0
    
    var currentBAC = 0.0
    var totalCalories = 0.0
    var firstDrink = true
    var drinksHad = [Drinks]()
    let user : userProfile
    
    init(user: userProfile) {
        self.user = user
    }
    
    func addDrinks (newDrink: Drinks){
        if firstDrink {
            timeStartedDrinking = Int(CFAbsoluteTime())
            firstDrink = false;
        }
        drinksHad.append(newDrink)
        numDrinks += newDrink.standardDrink
        totalCalories += newDrink.calories
        currentBAC = getBAC(newDrink: newDrink, user: user)
        
        if currentBAC > self.user.getHistoricHighBAC() {self.user.setHistoricHighBAC(newBAC: currentBAC)}
        
    }
    
    func getBAC(newDrink: Drinks, user: userProfile) -> Double{
        /*
         BAC = [Alcohol consumed in grams / (Body weight in grams x r)] x 100 - Hours since first drink * 0.015
         */
        
        let alcInGrams = newDrink.standardDrink * 14
        let weight = Double(user.getWeight()) * 453.592
        var ratio : Double
        
        if Int(user.getGender()) == 0 {
            ratio = 0.68
        } else {
            ratio = 0.55
        }

        var bac = alcInGrams / (weight * ratio) * 100.0
        bac = bac - Double(timeSinceFirstDrink) * (0.015 / 3600)
        return bac
    }
    
    
    
    
    
    
}

