//
//  AddBeerViewController.swift
//  Drinkathon
//
//  Created by Johnson on 5/4/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class AddBeerViewController: UIViewController {

    
    @IBOutlet weak var beer_label: UILabel!
    
    //Set up pickerview data
    @IBOutlet weak var beerParamPicker: UIPickerView!
    
    var beerVolumeInOz: Double!
    var beerABV : Double!
    var beerNumAdded : Int!
    let beerPickerDataVolume = ["5.5 oz","6.3 oz","8 oz","8.4 oz","11.2 oz","12 oz","12.7 oz","14.9 oz","16 oz","16.9 oz","19.2 oz","22 oz","24 oz","25.4 oz","32 oz","40 oz","50.7 oz","64 oz"]
    
    let beerPickerDataABV = ["3.0%", "3.1%", "3.2%", "3.3%", "3.4%", "3.5%", "3.6%", "3.7%", "3.8%", "3.9%", "4.0%", "4.1%", "4.2%", "4.3%", "4.4%", "4.5%", "4.6%", "4.7%", "4.8%", "4.9%", "5.0%", "5.1%", "5.2%", "5.3%", "5.4%", "5.5%", "5.6%", "5.7%", "5.8%", "5.9%", "6.0%", "6.1%", "6.2%", "6.3%", "6.4%", "6.5%", "6.6%", "6.7%", "6.8%", "6.9%", "7.0%", "7.1%", "7.2%", "7.3%", "7.4%", "7.5%", "7.6%", "7.7%", "7.8%", "7.9%", "8.0%", "8.1%", "8.2%", "8.3%", "8.4%", "8.5%", "8.6%", "8.7%", "8.8%", "8.9%", "9.0%", "9.1%", "9.2%", "9.3%", "9.4%", "9.5%", "9.6%", "9.7%", "9.8%", "9.9%", "10.0%", "10.1%", "10.2%", "10.3%", "10.4%", "10.5%", "10.6%", "10.7%", "10.8%", "10.9%", "11.0%", "11.1%", "11.2%", "11.3%", "11.4%", "11.5%", "11.6%", "11.7%", "11.8%", "11.9%", "12.0%", "12.1%", "12.2%", "12.3%", "12.4%", "12.5%", "12.6%", "12.7%", "12.8%", "12.9%", "13.0%", "13.1%", "13.2%", "13.3%", "13.4%", "13.5%", "13.6%", "13.7%", "13.8%", "13.9%", "14.0%", "14.1%", "14.2%", "14.3%", "14.4%", "14.5%", "14.6%", "14.7%", "14.8%", "14.9%", "15.0%", "15.1%", "15.2%", "15.3%", "15.4%", "15.5%", "15.6%", "15.7%", "15.8%", "15.9%", "16.0%", "16.1%", "16.2%", "16.3%", "16.4%", "16.5%", "16.6%", "16.7%", "16.8%", "16.9%", "17.0%", "17.1%", "17.2%", "17.3%", "17.4%", "17.5%", "17.6%", "17.7%", "17.8%", "17.9%", "18.0%", "18.1%", "18.2%", "18.3%", "18.4%", "18.5%", "18.6%", "18.7%", "18.8%", "18.9%", "19.0%", "19.1%", "19.2%", "19.3%", "19.4%", "19.5%", "19.6%", "19.7%", "19.8%", "19.9%", "20.0%"]
    let beerPickerDataNumDrinks = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Param pickerview init
        beerParamPickerInit()
    }
    
    func beerParamPickerInit() {
        beerParamPicker.delegate = self
        beerParamPicker.dataSource = self
        //Preselect Volume 12oz
        beerParamPicker.selectRow(5, inComponent: 0, animated: true)
        //Preselect ABV 4.5%
        beerParamPicker.selectRow(15, inComponent: 1, animated: true)
        beerParamPicker.selectRow(0, inComponent: 2, animated: true)
    }

    
}

/* Controls UIPickerView parameters */
extension AddBeerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return beerPickerDataVolume.count
        } else if component == 1 {
            return beerPickerDataABV.count
        } else {
            return beerPickerDataNumDrinks.count
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            beerVolumeInOz = Double(beerPickerDataVolume[row].dropLast(3))
        } else if component == 1 {
            beerABV = Double(beerPickerDataABV[row].dropLast(1))
        } else {
            beerNumAdded = Int(beerPickerDataNumDrinks[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return beerPickerDataVolume[row]
        } else if component == 1 {
            return beerPickerDataABV[row]
        } else {
            return beerPickerDataNumDrinks[row]
        }

    }
}
