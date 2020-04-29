//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Richard Cho on 2020-04-27.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!
    
    var eventNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let existingText = statusLabel.text {
             statusLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidLoad"
             eventNumber += 1
         }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let existingText = statusLabel.text {
            statusLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewWillAppear"
            eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let existingText = statusLabel.text {
            statusLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidAppear"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let existingText = statusLabel.text {
            statusLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewWillDisappear"
            eventNumber += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let existingText = statusLabel.text {
            statusLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidDisappear"
            eventNumber += 1
        }
    }
    
}
