//
//  ViewController.swift
//  Drinkathon
//
//  Created by Johnson on 4/17/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*Variables for main screen*/
    //Gender
    @IBOutlet weak var genderInputTextField: UITextField!
    var genderPicker = UIPickerView()
    var genderPickerData : [String] = ["Male","Female"]
    
    
    //Weight
    @IBOutlet weak var weightInputTextField: UITextField!
    var weightPicker = UIPickerView()
    var weightPickerData : [Int] = [100,110,120,130,140,150,160,170,180,190,200,210,220,230,240]
    
    //Image
    @IBOutlet weak var redSoloCup: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        /* Initialilze variables*/
        //GenderPicker
        genderPicker.selectRow(0, inComponent: 0, animated: true)
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        //WeightPicker
        weightPicker.selectRow(2, inComponent: 0, animated: true)
        weightPicker.delegate = self
        weightPicker.dataSource = self
        
        //Image
        var redSoloCupFile: String = "red_solo_cup.jpg"
        redSoloCup.image = UIImage(named: "first_scene_button.JPG")
        
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(gesture:)))
        // add it to the image view;
        redSoloCup.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        redSoloCup.isUserInteractionEnabled = true
        
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//        for item in items {
//            if item == "red_solo_cup.jpg"{
//                redSoloCup = item
//            }
//        }
        
        
        
        
        /* Create Cancel and Done button on UIPickerView*/
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
        
        
        
        /* Connect PickerView to TextFields, add ToolBar to PickerView */
        genderInputTextField.inputView = genderPicker
        genderInputTextField.inputAccessoryView = toolBar
        
        weightInputTextField.inputView = weightPicker
        weightInputTextField.inputAccessoryView = toolBar
       
        
    }
    
    //Close the UIPickerView after making a selection
    @objc func donePicker() {
        weightInputTextField.resignFirstResponder()
        genderInputTextField.resignFirstResponder()
    }
    
    //Check if the image is tapped
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Here you can initiate your new ViewController
            
        }
    }
  
}


/* Controls UIPickerView parameters */
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderPicker{
            return genderPickerData.count
        } else if pickerView == weightPicker{
            return weightPickerData.count
        }
        return 1
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == genderPicker{
            return 1
        } else if pickerView == weightPicker{
            return 1
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == genderPicker{
            genderInputTextField.text = genderPickerData[row]
        } else if pickerView == weightPicker{
            weightInputTextField.text = String(weightPickerData[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderPicker{
            return genderPickerData[row]
        } else if pickerView == weightPicker{
            return String(weightPickerData[row])
        }
        
        return "2"
    }
}
