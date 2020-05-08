//
//  AddTableViewCell.swift
//  SimpleTodoApp
//
//  Created by Richard Cho on 2020-05-07.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class AddTextFieldTableViewCell: UITableViewCell {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class AddSelectTableViewCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

