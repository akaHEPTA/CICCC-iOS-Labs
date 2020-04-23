//
//  UICustomLabel.swift
//  Assignment4
//
//  Created by Richard Cho on 2020-04-22.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class UICustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(isBold: Bool = false, text: String) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        if isBold { self.font = UIFont.boldSystemFont(ofSize: 16.0) }
        else { self.font = UIFont.systemFont(ofSize: 26.0)}
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
