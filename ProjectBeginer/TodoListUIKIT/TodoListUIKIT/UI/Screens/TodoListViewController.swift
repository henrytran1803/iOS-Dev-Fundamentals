//
//  TodoListViewController.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/17/25.
//

import UIKit
import SwiftData


// MARK: - View Controller
class TodoListViewController: UIViewController {
    private let viewModel: TodoListViewModel
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(TodoCell.self, forCellReuseIdentifier: TodoCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var addButton: UIBarButtonItem = {
        return UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }()
    
    init(viewModel: TodoListViewModel = TodoListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.loadTasks()
    }
    
    private func setupUI() {
        title = "Todo List"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = addButton
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func addButtonTapped() {
        showAddTaskAlert()
    }
    
    private func showAddTaskAlert() {
        let alert = UIAlertController(
            title: "New Task",
            message: "Enter task name",
            preferredStyle: .alert
        )
        
        alert.addTextField { textField in
            textField.placeholder = "Task name"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let taskName = alert.textFields?.first?.text, !taskName.isEmpty else { return }
            self?.viewModel.addTask(taskName)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    private func showEditTaskAlert(for task: TodoModel) {
        let alert = UIAlertController(
            title: "Edit Task",
            message: "Update task name",
            preferredStyle: .alert
        )
        
        alert.addTextField { textField in
            textField.text = task.taskname
        }
        
        let updateAction = UIAlertAction(title: "Update", style: .default) { [weak self] _ in
            guard let newName = alert.textFields?.first?.text, !newName.isEmpty else { return }
            self?.viewModel.updateTask(task, with: newName)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(updateAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}

// MARK: - UITableView Extensions
extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfTasks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier, for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
        
        let task = viewModel.task(at: indexPath.row)
        cell.configure(with: task)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = viewModel.task(at: indexPath.row)
        showEditTaskAlert(for: task)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
            let task = self?.viewModel.task(at: indexPath.row)
            if let task = task {
                self?.viewModel.deleteTask(task)
            }
            completion(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}


// MARK: - TodoListViewModelDelegate
extension TodoListViewController: TodoListViewModelDelegate {
    func didUpdateTasks() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func didReceiveError(_ error: Error) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(
                title: "Error",
                message: error.localizedDescription,
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }
}
