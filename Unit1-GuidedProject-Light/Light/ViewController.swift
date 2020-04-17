//
//  ViewController.swift
//  Light
//
//  Created by Richard Cho on 2020-04-16.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn.toggle()
        updateUI()
    }
    
    private func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
}

