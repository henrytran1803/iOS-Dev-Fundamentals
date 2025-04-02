//
//  ViewController.swift
//  Day3
//
//  Created by Việt Anh Trần on 2/4/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let products: [Product] = [
        Product(name: "iPhone 15", price: "$999"),
        Product(name: "MacBook Pro", price: "$1999"),
        Product(name: "iPad Air", price: "$599")
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        cell.configure(with: products[indexPath.row]) // Sửa lại để đảm bảo không lỗi
        return cell
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
                 tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                 tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                 tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                 tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
             ])
        
    }


}

