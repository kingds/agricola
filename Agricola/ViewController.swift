//
//  ViewController.swift
//  Agricola
//
//  Created by Daniel King on 12/14/14.
//  Copyright (c) 2014 Daniel King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Points labels on the right side of the view
    @IBOutlet var grainPointsLabel : UILabel!
    @IBOutlet var vegetablesPointsLabel : UILabel!
    @IBOutlet var sheepPointsLabel : UILabel!
    @IBOutlet var boarPointsLabel : UILabel!
    @IBOutlet var cattlePointsLabel : UILabel!
    @IBOutlet var fieldsPointsLabel : UILabel!
    @IBOutlet var pasturesPointsLabel : UILabel!
    @IBOutlet var unusedSpacesPointsLabel : UILabel!
    @IBOutlet var fencedStablesPointsLabel : UILabel!
    @IBOutlet var roomsPointsLabel : UILabel!
    @IBOutlet var familyMembersPointsLabel : UILabel!
    @IBOutlet var improvementPointsLabel : UILabel!
    @IBOutlet var bonusPointsLabel : UILabel!
    
    // Input fields in the center of the view
    @IBOutlet var grainInputField : UITextField!
    @IBOutlet var vegetablesInputField : UITextField!
    @IBOutlet var sheepInputField : UITextField!
    @IBOutlet var boarInputField : UITextField!
    @IBOutlet var cattleInputField : UITextField!
    @IBOutlet var fieldsInputField : UITextField!
    @IBOutlet var pasturesInputField : UITextField!
    @IBOutlet var unusedSpacesInputField : UITextField!
    @IBOutlet var fencedStablesInputField : UITextField!
    @IBOutlet var roomsInputField : UITextField!
    @IBOutlet var familyMembersInputField : UITextField!
    @IBOutlet var improvementPointsInputField : UITextField!
    @IBOutlet var bonusPointsInputField : UITextField!
    
    // Room type selector
    @IBOutlet var roomTypeSelector : UISegmentedControl!
    
    // Scroll View
    @IBOutlet var scrollView: UIScrollView!
    
    // Content View
    @IBOutlet var contentView: UIView!
    
    // Create the calculator class
    let calc = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.    
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.3176, green: 0.6902, blue: 0.5176, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        // Setup the keyboard for data entry
        keyboardSetup()
        
        // Set up the scroll view
        scrollViewSetup()

    }
    
    func showGrainKeyboard() {
        grainInputField.becomeFirstResponder()
    }
    func showVegetablesKeyboard() {
        vegetablesInputField.becomeFirstResponder()
    }
    func showSheepKeyboard() {
        sheepInputField.becomeFirstResponder()
    }
    func showBoarKeyboard() {
        boarInputField.becomeFirstResponder()
    }
    func showCattleKeyboard() {
        cattleInputField.becomeFirstResponder()
    }
    func showFieldsKeyboard() {
        fieldsInputField.becomeFirstResponder()
    }
    func showPasturesKeyboard() {
        pasturesInputField.becomeFirstResponder()
    }
    func showUnusedSpacesKeyboard() {
        unusedSpacesInputField.becomeFirstResponder()
    }
    func showFencedStablesKeyboard() {
        fencedStablesInputField.becomeFirstResponder()
    }
    func showRoomsKeyboard() {
        roomsInputField.becomeFirstResponder()
    }
    func showFamilyMembersKeyboard() {
        familyMembersInputField.becomeFirstResponder()
    }
    func showImprovementPointsKeyboard() {
        improvementPointsInputField.becomeFirstResponder()
    }
    func showBonusPointsKeyboard() {
        bonusPointsInputField.becomeFirstResponder()
    }
    
    func keyboardToolbar(nextAction: String, previousAction: String) -> UIToolbar {
    
        var toolbar: UIToolbar = UIToolbar(frame:CGRectMake(0, 524, 320, 44))
        
        var previousButton = UIBarButtonItem(title: "Previous", style: UIBarButtonItemStyle.Plain, target: self, action: Selector(previousAction))
        if previousAction == "None" {
            previousButton.enabled = false
        }
    
        var nextButton = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: Selector(nextAction))
        if nextAction == "None" {
            nextButton.enabled = false
        }
        
        let fillerSpace = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)

        
        toolbar.setItems([previousButton, fillerSpace, nextButton], animated: false)
        
        return toolbar
        
    }
    
    func moveToInputField(field: UITextField) {
        field.becomeFirstResponder()
    }

    func keyboardSetup() {
        
        grainInputField.inputAccessoryView = keyboardToolbar("showVegetablesKeyboard", previousAction: "None")
        vegetablesInputField.inputAccessoryView = keyboardToolbar("showSheepKeyboard", previousAction:"showGrainKeyboard")
        sheepInputField.inputAccessoryView = keyboardToolbar("showBoarKeyboard", previousAction: "showVegetablesKeyboard")
        boarInputField.inputAccessoryView = keyboardToolbar("showCattleKeyboard", previousAction: "showSheepKeyboard")
        cattleInputField.inputAccessoryView = keyboardToolbar("showFieldsKeyboard", previousAction: "showBoarKeyboard")
        fieldsInputField.inputAccessoryView = keyboardToolbar("showPasturesKeyboard", previousAction: "showCattleKeyboard")
        pasturesInputField.inputAccessoryView = keyboardToolbar("showUnusedSpacesKeyboard", previousAction: "showFieldsKeyboard")
        unusedSpacesInputField.inputAccessoryView = keyboardToolbar("showFencedStablesKeyboard", previousAction: "showPasturesKeyboard")
        fencedStablesInputField.inputAccessoryView = keyboardToolbar("showRoomsKeyboard", previousAction: "showUnusedSpacesKeyboard")
        roomsInputField.inputAccessoryView = keyboardToolbar("showFamilyMembersKeyboard", previousAction: "showFencedStablesKeyboard")
        familyMembersInputField.inputAccessoryView = keyboardToolbar("showImprovementPointsKeyboard", previousAction: "showRoomsKeyboard")
        improvementPointsInputField.inputAccessoryView = keyboardToolbar("showBonusPointsKeyboard", previousAction: "showFamilyMembersKeyboard")
        bonusPointsInputField.inputAccessoryView = keyboardToolbar("None", previousAction: "showFamilyMembersKeyboard")
    }
    
    func scrollViewSetup() {
        scrollView.scrollEnabled = true
        scrollView.contentSize = CGSizeMake(320, 1000)
        scrollView.addSubview(contentView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    override func shouldAutorotate() -> Bool{
        return false
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
        grainInputField.resignFirstResponder()
        vegetablesInputField.resignFirstResponder()
        sheepInputField.resignFirstResponder()
        boarInputField.resignFirstResponder()
        cattleInputField.resignFirstResponder()
        fieldsInputField.resignFirstResponder()
        pasturesInputField.resignFirstResponder()
        unusedSpacesInputField.resignFirstResponder()
        fencedStablesInputField.resignFirstResponder()
        roomsInputField.resignFirstResponder()
        familyMembersInputField.resignFirstResponder()
        improvementPointsInputField.resignFirstResponder()
        bonusPointsInputField.resignFirstResponder()
    }
    
    func calculateTotal() {  
        let score = calc.calculateTotal()
        self.title = "Total: " + String(score)
    }
    
    func getPointsString(score: Int) -> String {
        var pointsString: String
        if score == -1 || score == 1 {
            pointsString = " Point"
        } else {
            pointsString = " Points"
        }        
        return pointsString
    }
    
    @IBAction func reset(sender: AnyObject) {
        calc.grain = 0
        calc.vegetables = 0
        calc.sheep = 0
        calc.boar = 0
        calc.cattle = 0
        calc.fields = 0
        calc.unusedSpaces = 0
        calc.pastures = 0
        calc.fencedStables = 0
        calc.rooms = 2
        calc.roomType = "Wood"
        calc.familyMembers = 2
        calc.improvementPoints = 0
        calc.bonusPoints = 0

        grainInputField.text = nil
        vegetablesInputField.text = nil
        sheepInputField.text = nil
        boarInputField.text = nil
        cattleInputField.text = nil
        fieldsInputField.text = nil
        pasturesInputField.text = nil
        unusedSpacesInputField.text = nil
        fencedStablesInputField.text = nil
        roomsInputField.text = nil
        familyMembersInputField.text = nil
        improvementPointsInputField.text = nil
        bonusPointsInputField.text = nil

        roomTypeSelector.selectedSegmentIndex = 0

        grainChanged(self)
        vegetablesChanged(self)
        sheepChanged(self)
        boarChanged(self)
        cattleChanged(self)
        fieldsChanged(self)
        pasturesChanged(self)
        unusedSpacesChanged(self)
        fencedStablesChanged(self)
        roomsChanged(self)
        familyMembersChanged(self)
        improvementPointsChanged(self)
        bonusPointsChanged(self)
        
        
        

        calculateTotal()
        
        self.title = "Agricola Calculator"
         
    }

    
    @IBAction func grainChanged(sender : AnyObject) {
        var grain: Int? = grainInputField.text.toInt()
        if grain == nil {
            grain = 0
        }
        calc.grain = grain!
        let score = calc.grainScore(grain!)
        let pointsString = getPointsString(score)
        grainPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func vegetablesChanged(sender : AnyObject) {
        var vegetables : Int? = vegetablesInputField.text.toInt()
        if vegetables == nil {
            vegetables = 0
        }
        calc.vegetables = vegetables!
        let score = calc.vegetableScore(calc.vegetables)
        let pointsString = getPointsString(score)
        vegetablesPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func sheepChanged(sender : AnyObject) {
        var sheep : Int? = sheepInputField.text.toInt()
        if sheep == nil {
            sheep = 0
        }
        calc.sheep = sheep!
        let score = calc.sheepScore(calc.sheep)
        let pointsString = getPointsString(score)
        sheepPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func boarChanged(sender : AnyObject) {
        var boar : Int? = boarInputField.text.toInt()
        if boar == nil {
            boar = 0
        }
        calc.boar = boar!
        let score = calc.boarScore(calc.boar)
        let pointsString = getPointsString(score)
        boarPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func cattleChanged(sender : AnyObject) {
        var cattle : Int? = cattleInputField.text.toInt()
        if cattle == nil {
            cattle = 0
        }
        calc.cattle = cattle!
        let score = calc.cattleScore(calc.cattle)
        let pointsString = getPointsString(score)
        cattlePointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func fieldsChanged(sender : AnyObject) {
        var fields : Int? = fieldsInputField.text.toInt()
        if fields == nil {
            fields = 0
        }
        calc.fields = fields!
        let score = calc.fieldsScore(calc.fields)
        let pointsString = getPointsString(score)
        fieldsPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func pasturesChanged(sender : AnyObject) {
        var pastures : Int? = pasturesInputField.text.toInt()
        if pastures == nil {
            pastures = 0
        }
        calc.pastures = pastures!
        let score = calc.pasturesScore(calc.pastures)
        let pointsString = getPointsString(score)
        pasturesPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func unusedSpacesChanged(sender : AnyObject) {
        var unusedSpaces : Int? = unusedSpacesInputField.text.toInt()
        if unusedSpaces == nil {
            unusedSpaces = 0
        }
        calc.unusedSpaces = unusedSpaces!
        let score = calc.unusedSpaces * -1
        let pointsString = getPointsString(score)
        unusedSpacesPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func fencedStablesChanged(sender : AnyObject) {
        var fencedStables : Int? = fencedStablesInputField.text.toInt()
        if fencedStables == nil {
            fencedStables = 0
        }
        calc.fencedStables = fencedStables!
        let score = calc.fencedStables
        let pointsString = getPointsString(score)
        fencedStablesPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func familyMembersChanged(sender : AnyObject) {
        var familyMembers : Int? = familyMembersInputField.text.toInt()
        if familyMembers == nil {
            familyMembers = 0
        }
        calc.familyMembers = familyMembers!
        let score = calc.familyMembers * 3
        let pointsString = getPointsString(score)
        familyMembersPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func roomTypeChanged(sender : AnyObject) {
        var roomTypeIndex: Int? = roomTypeSelector.selectedSegmentIndex
        var roomType = "Wood"
        if roomTypeIndex == nil {
            roomTypeIndex = 0
        }
        if roomTypeIndex == 0 {
            roomType = "Wood"
        } else if roomTypeIndex == 1 {
            roomType = "Clay"
        } else if roomTypeIndex == 2 {
            roomType = "Stone"
        }
        calc.roomType = roomType
        let score = calc.roomsScore(calc.rooms, roomType: calc.roomType)
        let pointsString = getPointsString(score)
        roomsPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }
    
    @IBAction func roomsChanged(sender : AnyObject) {
        var rooms : Int? = roomsInputField.text.toInt()
        if rooms == nil {
            rooms = 0
        }
        calc.rooms = rooms!
        let score = calc.roomsScore(calc.rooms, roomType: calc.roomType)
        let pointsString = getPointsString(score)
        roomsPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func improvementPointsChanged(sender : AnyObject) {
        var improvementPoints : Int? = improvementPointsInputField.text.toInt()
        if improvementPoints == nil {
            improvementPoints = 0
        }
        calc.improvementPoints = improvementPoints!
        let score = calc.improvementPoints
        let pointsString = getPointsString(score)
        improvementPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }

    @IBAction func bonusPointsChanged(sender : AnyObject) {
        var bonusPoints : Int? = bonusPointsInputField.text.toInt()
        if bonusPoints == nil {
            bonusPoints = 0
        }
        calc.bonusPoints = bonusPoints!
        let score = calc.bonusPoints
        let pointsString = getPointsString(score)
        bonusPointsLabel.text = String(score) + pointsString
        calculateTotal()
    }
    
}

