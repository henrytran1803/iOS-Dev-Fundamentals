//
//  SecondViewController.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//

import UIKit

class SecondViewController: UIViewController {
    var dogs: [Dog] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchCats()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.register(DogCell.self, forCellReuseIdentifier: "DogCell")
        tableView.rowHeight = 120
    }

    private func fetchCats() {
        let api = DogAPI()
        api.execute { [weak self] result in
            switch result {
            case .success(let response):
                self?.dogs = response.data
                self?.tableView.reloadData()
                self?.tabBarController?.tabBar.items?[1].badgeValue = response.data.isEmpty ? nil : "\(response.data.count)"

            case .failure(let error):
                print("Error fetching cats: \(error.localizedDescription)")
            }
        }
    }
}


extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath) as? DogCell else {
            return UITableViewCell()
        }
        cell.configure(with: dogs[indexPath.row])
        return cell
    }
}
