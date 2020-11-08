//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipAmount = 0.0
    var numberofPeople = 2
    var eachPersonOwes = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercentButton.isSelected = false
        billTextField.endEditing(true)
        switch sender {
        case zeroPercentButton:
            zeroPercentButton.isSelected = true
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
            tipAmount = 0.0
        case tenPercentButton:
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = true
            twentyPercentButton.isSelected = false
            tipAmount = 0.1
        case twentyPercentButton:
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = true
            tipAmount = 0.2
        default:
            print("Error")
        }
    }
    
    
    @IBAction func stepperValueXChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberofPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //print(tipAmount)
        //print(billTextField.text)
        let billTotal = Double(billTextField.text!)!
        eachPersonOwes = ((1+tipAmount)*billTotal)/Double(numberofPeople)
        print(eachPersonOwes)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
    
            destinationVC.result = eachPersonOwes
            destinationVC.split = numberofPeople
            destinationVC.tip = tipAmount
            
        }
    }
    
    
}

