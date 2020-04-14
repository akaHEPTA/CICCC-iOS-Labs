//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Richard Cho on 2020-04-14.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var changeTitle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(mainLabel)
        mainLabel.text = "I'm learning how to make really awesome apps!"
        view.backgroundColor = UIColor(red: 0xF7 / 255, green: 0x9D / 255, blue: 0x74 / 255, alpha: 1.0)
    }
    
    @IBAction func changeTitle(_ sender: UIButton) {
        mainLabel.text = "This app rocks!"
    }
}

