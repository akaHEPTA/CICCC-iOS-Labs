//
//  DetailViewController.swift
//  SimpleTodoApp
//
//  Created by Richard Cho on 2020-05-07.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var todo: todo! {
        didSet {
            updateUI(todo)
        }
    }
    
    var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priorityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Priority"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priorityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var isCompletedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(descriptionTitleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(priorityTitleLabel)
        stackView.addArrangedSubview(priorityLabel)
        stackView.addArrangedSubview(isCompletedLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    fileprivate func updateUI(_ todo: todo) {
        navigationItem.title = todo.title
        descriptionLabel.text = todo.todoDescription
        priorityLabel.text = todo.priority.description()
        isCompletedLabel.text = todo.isCompleted ? "Completed" : "Not completed"
    }
    
}
