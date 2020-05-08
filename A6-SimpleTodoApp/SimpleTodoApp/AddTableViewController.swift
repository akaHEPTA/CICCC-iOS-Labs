//
//  AddTableViewController.swift
//  SimpleTodoApp
//
//  Created by Richard Cho on 2020-05-07.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

protocol AddTableViewControllerDelegate: class {
    func add(todo: todo)
}

class AddTableViewController: UITableViewController {
    
    struct Identifier {
        static let addText = "AddTextFieldCell"
        static let addSelect = "AddSelectCell"
    }
    
    private let priority = ["None", "Low", "Medium", "High"]
    private let header = ["Title", "Description", "Priority"]
    private var selectedPriority: Int? = nil
    
    var cells: [UITableViewCell] = []
    
    let addTitleCell = AddTextFieldTableViewCell()
    let addDescriptionCell = AddTextFieldTableViewCell()
    let priorityCells: [AddSelectTableViewCell] = {
        var cellArray: [AddSelectTableViewCell] = []
        for i in 0...3 { cellArray.append(AddSelectTableViewCell()) }
        return cellArray
    }()
    
    weak var delegate: AddTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewTodo))
        tableView.register(AddTextFieldTableViewCell.self, forCellReuseIdentifier: Identifier.addText)
        tableView.register(AddSelectTableViewCell.self, forCellReuseIdentifier: Identifier.addSelect)
        cells = [addTitleCell, addDescriptionCell]
    }
    
    @objc func saveNewTodo(_ sender: UIBarButtonItem) {
        if let title = addTitleCell.textField.text, let todoDescription = addDescriptionCell.textField.text, let priority = selectedPriority{
            
            let newTodo = todo(title: title, todoDescription: todoDescription, priority: Priority(rawValue: priority)!)
            self.delegate?.add(todo: newTodo)
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 { return 4 }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 2 {
            let cell = priorityCells[indexPath.row]
            cell.label.text = priority[indexPath.row]
            cell.accessoryView?.isHidden = true
            return cell
        }
        return cells[indexPath.section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let selectedCell = priorityCells[indexPath.row]
            if selectedCell.accessoryType == .none {
                selectedCell.accessoryType = .checkmark
                let indexPath = tableView.indexPath(for: selectedCell)!
                selectedPriority = indexPath.row
                deselectOthers(ip: indexPath)
            }
        }
    }
    
    func deselectOthers(ip: IndexPath) {
        let tappedCellIndexPath = ip
        let indexPaths = tableView.indexPathsForVisibleRows
        for indexPath in indexPaths! {
            if indexPath.row != tappedCellIndexPath.row && indexPath.section == 2 {
                priorityCells[indexPath.row].accessoryType = .none
            }
        }
    }
    
    
}
