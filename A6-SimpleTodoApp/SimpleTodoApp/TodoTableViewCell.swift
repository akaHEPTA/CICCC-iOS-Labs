//
//  TodoTableViewCell.swift
//  SimpleTodoApp
//
//  Created by Richard Cho on 2020-05-04.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let insideStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 1
        return stackView
    }()
    
    let priorityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let outsideStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(outsideStackView)
        outsideStackView.addArrangedSubview(insideStackView)
        outsideStackView.addArrangedSubview(priorityLabel)
        insideStackView.addArrangedSubview(titleLabel)
        insideStackView.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            outsideStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            outsideStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            outsideStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            outsideStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            priorityLabel.trailingAnchor.constraint(equalTo: outsideStackView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: insideStackView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: insideStackView.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: insideStackView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: insideStackView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
