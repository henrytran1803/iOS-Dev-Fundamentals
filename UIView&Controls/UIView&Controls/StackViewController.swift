//
//  StackViewController.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/21/25.
//

import UIKit
import UIKit

class StackViewController: UIViewController {
    
    // MARK: - UI Components
    let stackView = UIStackView()
    
    let button1: UIButton = StackViewController.createButton(title: "Button 1", color: .systemRed)
    let button2: UIButton = StackViewController.createButton(title: "Button 2", color: .systemBlue)
    let button3: UIButton = StackViewController.createButton(title: "Button 3", color: .systemGreen)
    
    let toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Toggle Button 2", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(toggleButtonAction), for: .touchUpInside)
        return button
    }()
    
    let switchLayoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Switch Layout", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(switchStackViewAxis), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStackView()
        setupLayout()
    }
    
    // MARK: - Setup UIStackView
    func setupStackView() {
        stackView.axis = .vertical // Mặc định xếp theo chiều dọc
        stackView.spacing = 10
        stackView.alignment = .center // Căn giữa
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(toggleButton)
        stackView.addArrangedSubview(switchLayoutButton)
        
        view.addSubview(stackView)
    }
    
    // MARK: - Setup Constraints
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    // MARK: - Actions
    @objc func toggleButtonAction() {
        UIView.animate(withDuration: 0.3) {
            self.button2.isHidden.toggle() // Ẩn/hiện Button 2 có animation
        }
    }
    
    @objc func switchStackViewAxis() {
        UIView.animate(withDuration: 0.3) {
            self.stackView.axis = self.stackView.axis == .vertical ? .horizontal : .vertical
        }
    }
    
    // MARK: - Helper Function
    static func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }
}

