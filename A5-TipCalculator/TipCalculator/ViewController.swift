//
//  ViewController.swift
//  TipCalculator
//
//  Created by Richard Cho on 2020-04-27.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var tipPercentageTextField: UITextField!
    @IBOutlet var tipPercentageSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        updateUI()
    }
    
    @IBAction func calculateTip() {
        if let billAmount = billAmountTextField.text {
            let tipAmount = Float(billAmount)! * 0.15
            tipAmountLabel.text = String.init(format: "$ %.2f", tipAmount)
        }
    }
    
    func updateUI() {
        tipAmountLabel.text = "$ 0.00"
    }
    
    @objc func dismissKeyboard(_ recognizer: UITapGestureRecognizer) {
        billAmountTextField.resignFirstResponder()
        tipPercentageTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= (keyboardSize.height) / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                view.frame.origin.y += (keyboardSize.height) / 2
            }
        }
    }
    
    @IBAction func adjustTipPercentage(_ sender: Any) {
        if let billAmount = billAmountTextField.text, !billAmount.isEmpty {
            if sender as? UITextField != nil {
                guard tipPercentageTextField.text != nil else { return }
                if let tipPercentage = Float(tipPercentageTextField!.text!) {
                    var ratio = tipPercentage > 100 ? 1 : tipPercentage / 100
                    let tipAmount = Float(billAmount)! * ratio
                    tipPercentageSlider.setValue(ratio, animated: true)
                    tipAmountLabel.text = String.init(format: "$ %.2f", tipAmount)
                }
            } else if sender as? UISlider != nil {
                let ratio = tipPercentageSlider.value
                let tipAmount = Float(billAmount)! * ratio
                tipPercentageTextField.text = String(format:"%.2f", ratio * 100)
                tipAmountLabel.text = String.init(format: "$ %.2f", tipAmount)
            }
        }
    }
    
}
// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
