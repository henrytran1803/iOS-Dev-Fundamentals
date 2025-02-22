//
//  TodoListTableViewController.swift
//  TodoListUIkitApp
//
//  Created by henry tran on 22/02/2025.
//

import UIKit
import UIKit

// MARK: - Todo List Table View Controller
class TodoListViewController: UITableViewController {
    
    var items: [TodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Todo List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Nút Add được sử dụng khi TodoListViewController được trình bày độc lập.
        // Trong trường hợp này, nút Add sẽ được đặt trong HomeViewController nên bạn có thể bỏ hoặc giữ lại.
        // navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
        //                                                     target: self,
        //                                                     action: #selector(addButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Load dữ liệu từ TodoDataManager và làm mới bảng
        items = TodoDataManager.shared.loadItems()
        tableView.reloadData()
    }
    
    // MARK: - TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = items[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
}

class AddTodoViewController: UIViewController {
    
    private let textField: UITextField = {
       let tf = UITextField()
       tf.placeholder = "Enter new todo item"
       tf.borderStyle = .roundedRect
       return tf
    }()
    
    private let addButton: UIButton = {
       let btn = UIButton(type: .system)
       btn.setTitle("Add Todo", for: .normal)
       btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
       return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        addButton.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(textField)
        view.addSubview(addButton)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Đặt textField cách mép trên khoảng 40pt
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Đặt addButton bên dưới textField khoảng 20pt, căn giữa theo chiều ngang
            addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func addTodo() {
        guard let text = textField.text, !text.isEmpty else { return }
        let newTodo = TodoItem(title: text)
        TodoDataManager.shared.add(item: newTodo)
        dismiss(animated: true, completion: nil)
    }
}
