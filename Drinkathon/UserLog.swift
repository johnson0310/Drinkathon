//
//  UserLog.swift
//  Drinkathon
//
//  Created by Johnson on 4/24/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import Foundation

class userProfile {
    private var name : String
    private var gender : String
    private var weight : Int
    private var numDrinkTipsy : Int
    private var numDrinkBlackOut : Int
    private var historicHighBAC = 0.0
    private var totalNumDrinkSinceInstall = 0.0
    
    
    init(name: String, gender: String, weight: Int, tipsy: Int, blackOut: Int) {
        self.name = name
        self.gender = gender
        self.weight = weight
        self.numDrinkTipsy = tipsy
        self.numDrinkBlackOut = blackOut
        print("Initialized")
        print(name,gender,weight,numDrinkTipsy,numDrinkBlackOut)
    }
    
    func setName(name: String) {
        self.name = name
        print("Name changed to: \(self.name)")
    }
    
    func getNmae() -> String {
        return self.name
    }
    
    func setWeight(weight: Int) {
        self.weight = weight
        print("Weight changed to: \(self.weight)")
    }
    
    func getWeight() -> Int {
        return self.weight
    }
    
    func setGender(gender: String) {
        self.gender = gender
        print("Gender changed to: \(self.gender)")
    }
    
    func getGender() -> String {
        return self.gender
    }
    
    func setNumDrinkTipsy(tipsy: Int) {
        self.numDrinkTipsy = tipsy
        print("Number of drinks till tipsy changed to: \(self.numDrinkTipsy)")
    }
    
    func getNumDrinkTipsy() -> Int {
        return self.numDrinkTipsy
    }
    
    func setNumDrinkBlackOut(blackOut: Int) {
        self.numDrinkBlackOut = blackOut
        print("Number of drinks till blacked out changed to: \(self.numDrinkBlackOut)")
    }
    
    func getNumDrinkBlackOut() -> Int {
        return self.numDrinkBlackOut
    }
    
    func setHistoricHighBAC(newBAC: Double) {
        self.historicHighBAC = newBAC
        print("The new historic high BAC level is: \(self.historicHighBAC)")
    }
    
    func getHistoricHighBAC() -> Double {
        return self.historicHighBAC
    }
    
    func updateDrinkStats(currentBAC: Double) {
        totalNumDrinkSinceInstall += 1
        if currentBAC > historicHighBAC {
            historicHighBAC = currentBAC
        }
    }
}
