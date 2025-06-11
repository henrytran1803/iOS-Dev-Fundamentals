//
//  HomeViewController.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var cats: [CatEntity] = []
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
        tableView.register(CatCell.self, forCellReuseIdentifier: "CatCell")
        tableView.rowHeight = 120
    }

    private func fetchCats() {
        let api = CatAPI()
        api.execute { [weak self] result in
            switch result {
            case .success(let response):
                self?.cats = response
                self?.tableView.reloadData()
                self?.tabBarController?.tabBar.items?[0].badgeValue = response.isEmpty ? nil : "\(response.count)"

            case .failure(let error):
                print("Error fetching cats: \(error.localizedDescription)")
            }
        }
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as? CatCell else {
            return UITableViewCell()
        }
        cell.configure(with: cats[indexPath.row])
        return cell
    }
}
