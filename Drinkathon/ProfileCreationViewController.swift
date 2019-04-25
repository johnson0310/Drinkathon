//
//  ViewController.swift
//  Drinkathon
//
//  Created by Johnson on 4/17/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class ProfileCreationViewController: UIViewController {
    

    /*Variables for main screen*/
    //User log object
    var user : userProfile?
    //Name
    @IBOutlet weak var nameInputTextField: UITextField!
    
    //Age
    @IBOutlet weak var ageInputTextField: UITextField!
    
    
    //Gender
    @IBOutlet weak var genderInputTextField: UITextField!
    let genderPicker = UIPickerView()
    let genderPickerData : [String] = ["Male","Female"]
    //Male: 0, Female: 1
    static var gender : Int = 0
    var genderDidSelect = false
    
    
    //Weight
    @IBOutlet weak var weightInputTextField: UITextField!
    let weightPicker = UIPickerView()
    let weightPickerData : [Int] = [80, 85, 90, 95, 100,105, 110, 115, 120, 125, 130, 135, 140, 145, 150, 155, 160, 165, 170, 175, 180,185, 190, 195, 200, 205, 210, 215, 220, 225, 230, 235, 240]
    static var weight : Int?
    
    //ToolBar
    let toolBar = UIToolbar()
    
    //Background
    let ProfileCreationBackgroundImageView = UIImageView()
    
    //Submit Button
    @IBOutlet weak var submitButton: SubmitButton!
    
    
    //Debug
    
    @IBOutlet weak var backgroundImageDebug: UIImageView!
    @IBOutlet weak var debugButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ProfileCreationViewControllerInit()
        
        
        let user = userProfile(name: "John", age: 21, gender: 0, weight: 150, tipsy: 1, blackOut: 1)
        user.setName(name: "bob")
    }

    
    //Initialize all fields on first screen
    func ProfileCreationViewControllerInit() {
        /* Initialilze variables */
        //GenderPicker
        genderPicker.selectRow(0, inComponent: 0, animated: true)
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        
        //WeightPicker
        weightPicker.selectRow(5, inComponent: 0, animated: true)
        weightPicker.delegate = self
        weightPicker.dataSource = self
        
        
//        //Image
//        redSoloCup.image = UIImage(named: "first_scene_button.JPG")
//        // create tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
//        // add it to the image view;
//        redSoloCup.addGestureRecognizer(tapGesture)
//        // make sure imageView can be interacted with by user
//        redSoloCup.isUserInteractionEnabled = true
        
        //Number of drinkers till tipsy input text field set tup
        //numDrinksTipsyInputTextField.keyboardType = UIKeyboardType.numberPad
        
        //Number of drinkers till black out input text field set tup
        //numDrinksBlackOutInputTextfield.keyboardType = UIKeyboardType.numberPad
        
        
        //Set Background
        view.addSubview(ProfileCreationBackgroundImageView)
        ProfileCreationBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        ProfileCreationBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        ProfileCreationBackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        ProfileCreationBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        ProfileCreationBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        ProfileCreationBackgroundImageView.image = UIImage(named: "welcomeScreen_background1.jpg")
        view.sendSubviewToBack(ProfileCreationBackgroundImageView)
        
        //Setup Submit Button
        submitButton.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)
        
        //Debug
        debugButton.addTarget(self, action: #selector(debugButton1), for: .touchUpInside)
        
        /* Connect PickerView to TextFields, add ToolBar to PickerView */
        toolBarSetUp()
        linkInputComponentsToTextFields()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    
    //Check if all textfields are completed and regulated
    @objc func submitButtonAction() {
        if checkTextFieldEmpty() {
            getInputFromTextFields()
        } else {
            let incompleteAlert = UIAlertController(title: "Incomplete Profile", message: "Please complete all fields so we can better track your stats!", preferredStyle: .alert)
            incompleteAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(incompleteAlert, animated: true)
        }
    }
    
    @objc func debugButton1() {
        performSegue(withIdentifier: "first_to_second", sender: nil)
    }
    
    
    //Set up the tool bar with Cancel and Done functionality
    func toolBarSetUp() {
        /* Create Cancel and Done button on UIPickerView*/
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
    }
    
    //Close the UIPickerView after making a selection
    @objc func donePicker() {
        nameInputTextField.resignFirstResponder()
        ageInputTextField.resignFirstResponder()
        weightInputTextField.resignFirstResponder()
        genderInputTextField.resignFirstResponder()
    }
    
    //Connect textfields with input methods
    //Connect tool bars to input method
    func linkInputComponentsToTextFields(){
        nameInputTextField.inputAccessoryView = toolBar
        
        ageInputTextField.inputAccessoryView = toolBar
        genderInputTextField.inputView = genderPicker
        genderInputTextField.inputAccessoryView = toolBar
        
        weightInputTextField.inputView = weightPicker
        weightInputTextField.inputAccessoryView = toolBar
    }
    
    
    //Check if the image is tapped
//    @objc func imageTapped(gesture: UIGestureRecognizer) {
//        // if the tapped view is a UIImageView then set it to imageview
//        if (gesture.view as? UIImageView) != nil {
//            print("Image Tapped")
//
//            //Check if both textfields are filled
//            if genderInputTextField.text == "" || weightInputTextField.text == "" {
//                //If any of the textfield is not filled, create an alert
//                let incompleteAlert = UIAlertController(title: "Incomplete Profile", message: "Please complete both fields so we can better calculate your BAC level later!", preferredStyle: .alert)
//                incompleteAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
//                self.present(incompleteAlert, animated: true)
//            } else {
//                getInputFromTextFields()
//                //Here you can initiate your new ViewController
//                performSegue(withIdentifier: "first_to_second", sender: nil)
//            }
//        }
//    }
    
    
    
    //Check if any textfield's empty
    func checkTextFieldEmpty() -> Bool {
        if nameInputTextField.text == "" || ageInputTextField.text == "" || genderInputTextField.text == "" || weightInputTextField.text == ""{
            return false
        }
        return true
    }
    
    // Record user input and and create a user log object
    func getInputFromTextFields(){
        //If name contains more than letters, show alert
        if isValidInput(Input: nameInputTextField.text!) == false {
            let alert = UIAlertController(title: "", message: "Name should be all letters!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        let name = nameInputTextField.text
        let age = Int(ageInputTextField.text!)
        let gender : Int
        if genderInputTextField.text == "Male" {
            gender = 0
        } else {
            gender = 1
        }
        let weight = Int(weightInputTextField.text!)
        
        //Init userProfile object
        user = userProfile(name: name!, age: age!, gender: gender, weight: weight!, tipsy: 9999, blackOut: 9999)
        
        print(user!)
    }
  
    
    /* Text field reqiurements*/
    //Check if the characters are all letters
    func isValidInput(Input:String) -> Bool {
        let myCharSet=CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let output: String = Input.trimmingCharacters(in: myCharSet.inverted)
        let isValid: Bool = (Input == output)
        print("\(isValid)")
        
        return isValid
    }
    
}


/* Controls UIPickerView parameters */
extension ProfileCreationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
