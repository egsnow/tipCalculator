//
//  ViewController.swift
//  TipCalculator
//
//  Created by Eric Snow on 1/18/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        billText.text = String("")
        textFieldDidChange(billText)
    }
    
    
    var currentValue = 20
    var billAmount = 0.00
    
    
    @IBAction func tipPercentageChanged(_ sender: UISlider) {
        currentValue = lroundf(slider.value)
        percentageLabel.text = "\(currentValue)%"
        updateLabels()
    }
    
    func updateLabels() {
        
        let tipAmount = Double(currentValue) * billAmount / 100
        let totalBillAmount = tipAmount + billAmount
        tipLabel.text = String(format: "%.2f%", tipAmount)
        totalLabel.text = String(format: "%.2f%", totalBillAmount)
        billLabel.text = String(format: "%.2f%", billAmount)

    }
    
    @objc func textFieldDidChange(_ billText: UITextField){
        let text = billText.text ?? ""
        let billAmount = Double(text) ?? 0.0
        self.billAmount = billAmount / 100
        updateLabels()
        print(self.billAmount)
        print(billText.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billText.becomeFirstResponder()
        billText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    

}

