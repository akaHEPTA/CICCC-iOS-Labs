//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by Richard Cho on 2020-04-22.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // Dependency Injection
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //        let countryLabel = UICustomLabel(isBold: true, text: "Country")
        //        let countryFlagLabel = UICustomLabel(text: "\(City.flags[city.icon]!)")
        //        let cityLabel = UICustomLabel(isBold: true, text: "City")
        //        let cityContentLabel = UICustomLabel(text: "\(city.name)")
        //        let tempuratureLabel = UICustomLabel(isBold: true, text: "Temperature")
        //        let tempuratureContentLabel = UICustomLabel(text: "\(city.temp)")
        //        let summaryLabel = UICustomLabel(isBold: true, text: "Summary")
        //        let summaryContentLabel = UICustomLabel(text: "\(city.summary)")
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews:[
                UICustomLabel(isBold: true, text: "Country"),
                UICustomLabel(text: "\(City.flags[city.icon]!)"),
                UICustomLabel(isBold: true, text: "City"),
                UICustomLabel(text: "\(city.name)"),
                UICustomLabel(isBold: true, text: "Temperature"),
                UICustomLabel(text: "\(city.temp)"),
                UICustomLabel(isBold: true, text: "Summary"),
                UICustomLabel(text: "\(city.summary)")
            ])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.spacing = 50
            return stackView
        }()
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
