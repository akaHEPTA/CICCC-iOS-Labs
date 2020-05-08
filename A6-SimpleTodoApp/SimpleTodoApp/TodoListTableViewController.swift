//
//  TodoListTableViewController.swift
//  SimpleTodoApp
//
//  Created by Richard Cho on 2020-05-03.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    struct Identifier {
        static let todo = "TodoCell"
    }
    
    private var todoList: [todo] = [
        todo(title: "Take shower", todoDescription: "Taking shower with warm water.", priority: .medium),
        todo(title: "Clean kitchen", todoDescription: "Clean dishes and silverwares.", priority: .low),
        todo(title: "Assignment", todoDescription: "Finish assignment 6 until the midnight.", priority: .high),
        todo(title: "Recieve package", todoDescription: "Bring back package from Canada Post.", priority: .medium),
        todo(title: "Prepare interview", todoDescription: "Prepare documents for an interview.", priority: .high)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Todo"
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(reorder)),
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddTodo))
        ]
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: Identifier.todo)
        updateUI()
    }
    
    @objc func goToAddTodo(_ sender: UIBarButtonItem) {
        let addViewController = AddTableViewController(style: .grouped)
        addViewController.delegate = self
        navigationController?.pushViewController(addViewController, animated: true)
    }
    
    @objc func reorder() {
        todoList.sort{ $0.priority.rawValue > $1.priority.rawValue }
        tableView.reloadData()
        updateUI()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.todo, for: indexPath) as! TodoTableViewCell
        cell.titleLabel.text = todoList[indexPath.row].title
        cell.descriptionLabel.text = todoList[indexPath.row].todoDescription
        cell.priorityLabel.text = todoList[indexPath.row].priority.description()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.todo = todoList[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            todoList.remove(at: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .automatic)
    //        }
    //    }
    
    //    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //        return .delete
    //    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = todoList[sourceIndexPath.row]
        todoList.remove(at: sourceIndexPath.row)
        todoList.insert(temp, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Remove", handler: { (action, view, handler)  in
                self.todoList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }),
            UIContextualAction(style: .normal, title: "Complete", handler: { (action, view, handler) in
                self.todoList[indexPath.row].isCompleted.toggle()
                tableView.reloadRows(at: [indexPath], with: .automatic)
                self.updateUI()
            })
        ])
    }
    
    func updateUI() {
        if let indexPaths = tableView.indexPathsForVisibleRows {
            for indexPath in indexPaths {
                tableView.cellForRow(at: indexPath)?.accessoryType = todoList[indexPath.row].isCompleted ? .checkmark : .none
            }
        }
    }
    
}

extension TodoListTableViewController: AddTableViewControllerDelegate {
    
    func add(todo: todo) {
        todoList.append(todo)
        tableView.insertRows(at: [IndexPath(row: todoList.count - 1, section: 0)], with: .automatic)
        updateUI()
    }
    
}
