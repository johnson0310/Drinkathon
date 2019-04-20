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
    let genderPicker = UIPickerView()
    let genderPickerData : [String] = ["Male","Female"]
    //Male: 0, Female: 1
    static var gender : Int = 0
    
    
    //Weight
    @IBOutlet weak var weightInputTextField: UITextField!
    let weightPicker = UIPickerView()
    let weightPickerData : [Int] = [100,110,120,130,140,150,160,170,180,190,200,210,220,230,240]
    static var weight : Int?
    
    //Image
    @IBOutlet weak var redSoloCup: UIImageView!
    
    //ToolBar
    let toolBar = UIToolbar()
    
    //Background
    let firstScreenBackgroundImageView = UIImageView()
    
    //Debug
    
    @IBOutlet weak var debugButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstScreenInitialization()
        toolBarSetUp()
        

        /* Connect PickerView to TextFields, add ToolBar to PickerView */
        genderInputTextField.inputView = genderPicker
        genderInputTextField.inputAccessoryView = toolBar
        
        weightInputTextField.inputView = weightPicker
        weightInputTextField.inputAccessoryView = toolBar
       
        
    }
    
    
    //Initialize all fields on first screen
    func firstScreenInitialization() {
        /* Initialilze variables */
        //GenderPicker
        genderPicker.selectRow(0, inComponent: 0, animated: true)
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        
        //WeightPicker
        weightPicker.selectRow(2, inComponent: 0, animated: true)
        weightPicker.delegate = self
        weightPicker.dataSource = self
        
        
        //Image
        redSoloCup.image = UIImage(named: "first_scene_button.JPG")
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(gesture:)))
        // add it to the image view;
        redSoloCup.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        redSoloCup.isUserInteractionEnabled = true
        
        
        //Set Background
        view.addSubview(firstScreenBackgroundImageView)
        firstScreenBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        firstScreenBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        firstScreenBackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        firstScreenBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        firstScreenBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        firstScreenBackgroundImageView.image = UIImage(named: "foamed_beer_background.jpg")
        view.sendSubviewToBack(firstScreenBackgroundImageView)
        
        
        //Debug
        debugButton.addTarget(self, action: #selector(debugButton1), for: .touchUpInside)
        
    }
    
    @objc func debugButton1() {
        performSegue(withIdentifier: "first_to_second", sender: nil)
    }
    
    //Set up the tool bar with Cancel and Done functionality
    func toolBarSetUp() {
        /* Create Cancel and Done button on UIPickerView*/
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
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
            
            //Check if both textfields are filled
            if genderInputTextField.text == "" || weightInputTextField.text == "" {
                //If any of the textfield is not filled, create an alert
                let incompleteAlert = UIAlertController(title: "Incomplete Profile", message: "Please complete both fields so we can better calculate your BAC level later!", preferredStyle: .alert)
                incompleteAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(incompleteAlert, animated: true)
            } else {
                getInputFromTextFields()
                //Here you can initiate your new ViewController
                performSegue(withIdentifier: "first_to_second", sender: nil)
            }
        }
    }
    
    // Record user input and store them into the global variable
    func getInputFromTextFields(){
        if genderInputTextField.text == "Male"{
            ViewController.gender = 0
        } else {
            ViewController.gender = 1
        }
        ViewController.weight = Int(weightInputTextField.text!)
        print(ViewController.gender)
        print(ViewController.weight!)
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
