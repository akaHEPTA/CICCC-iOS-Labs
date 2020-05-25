//
//  FilterCollectionViewCell.swift
//  MyRestaurants
//
//  Created by Richard Cho on 2020-05-24.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var isFiltering = false {
        didSet {
            changeColor()
        }
    }
    
    var label: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.font = .systemFont(ofSize: 15, weight: .semibold)
        lb.setContentHuggingPriority(.required, for: .horizontal)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 5.0
        
        contentView.addSubview(label)
        label.matchParent(padding: .init(top: 8, left: 12, bottom: 8, right: 12))
        
        changeColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeColor() {
        if isFiltering {
            DispatchQueue.main.async {
                self.backgroundColor = .skyblueTint
                self.label.textColor = .white
            }
        } else {
            DispatchQueue.main.async {
                self.backgroundColor = .white
                self.label.textColor = .skyblueTint
            }
        }
    }
    
}
