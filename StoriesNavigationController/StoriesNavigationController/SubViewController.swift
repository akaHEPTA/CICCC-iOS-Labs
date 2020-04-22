//
//  SubViewController.swift
//  StoriesNavigationController
//
//  Created by Richard Cho on 2020-04-22.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doorwayButton = UIBarButtonItem(title: "Doorway", style: .plain, target: self, action: #selector(doorwayButtonTapped(_:)))
        self.navigationItem.setRightBarButton(doorwayButton, animated: true)
    }
    
    @IBAction func doorwayButtonTapped(_ sender: Any?) {
        self.performSegue(withIdentifier: "unwindToDoorway", sender: self)
    }
    
}
