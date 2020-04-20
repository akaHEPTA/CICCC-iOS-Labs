//
//  ViewController.swift
//  Two Buttons
//
//  Created by Richard Cho on 2020-04-19.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        if let text = textField.text {
            label.text = text
        }
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        textField.text = ""
        label.text = ""
    }
    
}

