//
//  ViewController.swift
//  TipPro
//
//  Created by Connie Guan on 7/5/17.
//  Copyright © 2017 Connie Guan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //bill amount
    @IBOutlet weak var billAmountField: UITextField!

    //tip selector
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    //tip amount
    @IBOutlet weak var tipAmountField: UITextField!
    
    //total amount
    @IBOutlet weak var totalAmountField: UITextField!
   
    //calculate tip button
    @IBAction func calculateTip(_ sender: Any) {
        
        //if billAmount contains a number, use switch statement then calculate tipAmount and totalAmount, and update text fields
        if let billAmount = Double(billAmountField.text!) {
            var tipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex{
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100 * tipAmount) / 100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if (!billAmountField.isEditing){
                billAmountField.text = String(format: "%.2f", roundedBillAmount)
            }
            tipAmountField.text = String(format: "%.2f", roundedTipAmount)
            totalAmountField.text = String(format: "%.2f", totalAmount)
        
        //if billAmount does not contain a number, reset all fields
        }else{
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

