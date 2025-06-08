//
//  MainViewController.swift
//  Networking
//
//  Created by Việt Anh Trần on 7/6/25.
//

import UIKit

class MainViewController: UIViewController {
    let basicButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Basic Networking", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let advancedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Advanced Networking", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(basicButton)
        view.addSubview(advancedButton)
        NSLayoutConstraint.activate([
            basicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            basicButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            advancedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            advancedButton.topAnchor.constraint(equalTo: basicButton.bottomAnchor, constant: 20),
        ])
        // Do any additional setup after loading the view.

        // Set up button actions
        basicButton.addTarget(self, action: #selector(basicButtonTapped), for: .touchUpInside)
        advancedButton.addTarget(self, action: #selector(advancedButtonTapped), for: .touchUpInside)
    }

    @objc func basicButtonTapped() {
        let basicVC = BasicViewController()
        navigationController?.pushViewController(basicVC, animated: true)
    }

    @objc func advancedButtonTapped() {
        let advancedVC = LibViewController()
        navigationController?.pushViewController(advancedVC, animated: true)
    }
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
