//
//  RestaurantCollectionViewCell.swift
//  MyRestaurants
//
//  Created by Richard Cho on 2020-05-24.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
//    let titleStackView: UIStackView = {
//        let sv = UIStackView()
//        sv.translatesAutoresizingMaskIntoConstraints = false
//        sv.axis = .horizontal
//        return sv
//    }()
    
    let outterStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 1
        return sv
    }()
    
    let labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 1
        return sv
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = .boldSystemFont(ofSize: 12)
        return lb
    }()
    
    let detailLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = .systemFont(ofSize: 10)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(outterStackView)
        outterStackView.addSubview(imageView)
        outterStackView.addSubview(labelStackView)
        labelStackView.addSubview(nameLabel)
        labelStackView.addSubview(detailLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
