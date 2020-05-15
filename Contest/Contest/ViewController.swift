//
//  ViewController.swift
//  Contest
//
//  Created by Richard Cho on 2020-05-14.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        if emailTextField.text?.isEmpty ?? false {
            UIView.animate(withDuration: 0.2, animations: {
                let rightTransform = CGAffineTransform(translationX: 20, y: 0)
                self.emailTextField.transform = rightTransform
            }) { (_) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.emailTextField.transform = CGAffineTransform.identity
                })
            }
        } else {
            performSegue(withIdentifier: "SubmitSegue", sender: nil)
        }
    }
    

}

