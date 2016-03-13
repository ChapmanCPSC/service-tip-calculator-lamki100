//
//  ViewController.swift
//  TipCalc
//
//  Created by Katie on 3/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextbox: UITextField!
    @IBOutlet weak var numPeopleTextbox: UITextField!
    @IBOutlet weak var serviceLevelLabel: UILabel!
    @IBOutlet weak var serviceSlider: UISlider!
    @IBOutlet weak var outputTipLabel: UILabel!
    @IBOutlet weak var outputTotalBillLabel: UILabel!
    @IBOutlet weak var outputBillLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        serviceLevelLabel.text = String(serviceSlider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // reference http://stackoverflow.com/questions/12834140/increment-uislider-by-1-in-range-1-to-100
    @IBAction func sliderValueChanged(sender: AnyObject) {
        
        let currentSliderValue = String(roundf(serviceSlider.value * 1))
        serviceLevelLabel.text = currentSliderValue
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        // set current values
        let currentBillAmount = Double(billAmountTextbox.text!)
        let curSlideValue = Double(serviceLevelLabel.text!)
        let currentNumPeople = Double(numPeopleTextbox.text!)
        
        // make sure when unwrapped they aren't nil
        if currentBillAmount != nil && curSlideValue != nil && currentNumPeople != nil
        {
            // print for debugging
            print("Current Bill: \(currentBillAmount!)")
            print("Current slide value: \(curSlideValue!)")
            print("Current number of people: \(currentNumPeople!)")
            var tipPercentage: Double = 0.0

            // set tip percentage based on rating
            if curSlideValue >= 1.0 && curSlideValue < 4.0
            {
                tipPercentage = 0.1
                print("FIRST Current tip %: \(tipPercentage)")
            }
            else if curSlideValue >= 4.0 && curSlideValue < 6.0
            {
                tipPercentage = 0.13
                print("SECOND Current tip %: \(tipPercentage)")
            }
            else if curSlideValue >= 6.0 && curSlideValue < 8.0
            {
                tipPercentage = 0.15
                print("THIRD Current tip %: \(tipPercentage)")
            }
            else if curSlideValue >= 8.0 && curSlideValue < 10.0
            {
                tipPercentage = 0.2
                print("FOURTH Current tip %: \(tipPercentage)")
            }
            else
            {
                tipPercentage = 0.25
                print("FIFTH Current tip %: \(tipPercentage)")
            }
            
            // calculate and show tip
            let tip = currentBillAmount! * tipPercentage
            outputTipLabel.text = "$\(String(format: "%.2f", tip))"
            print("Current tip: $\(String(format: "%.2f", tip))")

            // calculate and show final bill
            let finalBill = currentBillAmount! + tip
            outputTotalBillLabel.text = "$\(String(format: "%.2f", finalBill))"
            
            // split between number of people
            let finalBillPerPerson = finalBill / currentNumPeople!
            outputBillLabel.text = "$\(String(format: "%.2f", finalBillPerPerson))"
            print("Current bill: $\(String(format: "%.2f", finalBill))")

        }
    }
}

