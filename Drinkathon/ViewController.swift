//
//  ViewController.swift
//  Drinkathon
//
//  Created by Johnson on 4/17/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*Variables for body parameters*/
    //Gender
    @IBOutlet weak var genderInputTextField: UITextField!
    var genderPicker = UIPickerView()
    var genderPickerData : [String] = ["Male","Female"]
    
    @IBOutlet weak var check: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        genderInputTextField.inputView = genderPicker
        
        /* Create Cancel and Done button on UIViewPicker*/
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        genderInputTextField.inputView = genderPicker
        genderInputTextField.inputAccessoryView = toolBar
       
        
    }
    
    @objc func donePicker() {
        genderInputTextField.resignFirstResponder()
        
    }
  
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderPickerData.count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderInputTextField.text = genderPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderPickerData[row]
    }
    
    

}
