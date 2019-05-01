//
//  Drinks.swift
//  Drinkathon
//
//  Created by Johnson on 5/1/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import Foundation

class Drinks {
    var alcPercentage : Double
    //Volume is in fl oz
    var volume : Double
    var calories : Double
    var description : String {
        return"""
        Main drinks class, with defult parameters:
        Alchohol Percentage: \(alcPercentage)
        Volume: \(volume)
        Calories: \(calories)
        """
    }
    
    init() {
        alcPercentage = 40.0
        volume = 1.5
        calories = 100
    }
    
}


class StandardDrink : Drinks {
    override var description : String {
        return"""
        This Standard Drink has:
        Alchohol Percentage: \(alcPercentage)
        Volume: \(volume)
        Calories: \(calories)
        """
    }
    
    override init() {
        super.init()
    }
}


class Beer : Drinks {
    override var description : String {
        return"""
        This Beer has:
        Alchohol Percentage: \(alcPercentage)
        Volume: \(volume)
        Calories: \(calories)
        """
    }
    
    //Init for standart beer
    override init() {
        super.init()
        //Regular Beer
        self.alcPercentage = 5.0
        self.volume = 12.0
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //Init for custum beer
    init(alcPercentage: Double, volume: Double) {
        super.init()
        self.alcPercentage = alcPercentage
        self.volume = volume
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //Beer: Estimate the calories in the beer from ALC% and volume
    func calorieCalculation (alcPercentage: Double, volume: Double ) -> Double {
        return (alcPercentage * 2.5) * volume
    }
}


class IPA : Drinks {
    override var description : String {
        return"""
        This IPA has:
        Alchohol Percentage: \(alcPercentage)
        Volume: \(volume)
        Calories: \(calories)
        """
    }
    
    //Init IPA, all IPAs must be custom
    init(alcPercentage: Double, volume: Double) {
        super.init()
        self.alcPercentage = alcPercentage
        self.volume = volume
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //IPA: Estimate the calories in the beer from ALC% and volume
    func calorieCalculation (alcPercentage: Double, volume: Double ) -> Double {
        return (alcPercentage * 2.5) * volume
    }
}


class Wine : Drinks {
    override var description : String {
        return"""
        This Wine has:
        Alchohol Percentage: \(alcPercentage)
        Volume: \(volume)
        Calories: \(calories)
        """
    }
    
    //Init for standart wine
    override init() {
        super.init()
        //Standard Wine
        self.alcPercentage = 12.5
        self.volume = 5.0
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //Init for custum beer
    init(alcPercentage: Double, volume: Double) {
        super.init()
        self.alcPercentage = alcPercentage
        self.volume = volume
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //Wine: Estimate the calories in the beer from ALC% and volume
    func calorieCalculation (alcPercentage: Double, volume: Double ) -> Double {
        //ALC% * Volume(ml) * 8 / 1000 = grams of alcohol
        return (alcPercentage * volume * 29.5735) * 8.0 / 1000.0 * 7.0
    }
}


class Champagne : Drinks {
    override var description : String {
        return"""
        This Champagne has:
        Alchohol Percentage: \(alcPercentage)
        Volume: \(volume)
        Calories: \(calories)
        """
    }
    
    //Init for standart wine
    override init() {
        super.init()
        //Standard Wine
        self.alcPercentage = 12.0
        self.volume = 5.0
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //Init for custum beer
    init(alcPercentage: Double, volume: Double) {
        super.init()
        self.alcPercentage = alcPercentage
        self.volume = volume
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //Champagne: Estimate the calories in the beer from ALC% and volume
    func calorieCalculation (alcPercentage: Double, volume: Double ) -> Double {
        //ALC% * Volume(ml) * 8 / 1000 = grams of alcohol
        return (alcPercentage * volume * 29.5735) * 8.0 / 1000.0 * 7.0
    }
}

class Spirits : Drinks {
    override var description : String {
        return"""
        This Spirit has:
        Alchohol Percentage: \(alcPercentage)
        Volume: \(volume)
        Calories: \(calories)
        """
    }
    
    //Init for standart wine
    override init() {
        super.init()
        //Standard Wine
        self.alcPercentage = 40.0
        self.volume = 1.5
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //Init for custum beer
    init(alcPercentage: Double, volume: Double) {
        super.init()
        self.alcPercentage = alcPercentage
        self.volume = volume
        self.calories = calorieCalculation(alcPercentage: self.alcPercentage, volume: self.volume)
    }
    
    //Champagne: Estimate the calories in the beer from ALC% and volume
    func calorieCalculation (alcPercentage: Double, volume: Double ) -> Double {
        /*
         40 % = 64 cal / oz
         45 & = 73 cal / oz
         50% + = 82 cal / oz
         */
        if alcPercentage >= 30.0 {
            return volume * 64.0
        } else if alcPercentage > 40.0 {
            return volume * 73.0
        } else if alcPercentage >= 50.0 {
            return volume * 82.0
        }
        return volume * 64.0
    }
    
}
