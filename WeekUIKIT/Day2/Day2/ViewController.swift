//
//  ViewController.swift
//  Day2
//
//  Created by Việt Anh Trần on 1/4/25.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        // thêm vào redview
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        // contraint cho nó
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueView)
        let viewsDictionary = ["blueView": blueView]
        let horizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-20-[blueView]-20-|", options: [], metrics: nil, views: viewsDictionary)
        NSLayoutConstraint.activate(horizontalConstraints)

        //đặt nó ở giữa x,y cao 100 dài 100
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redView.widthAnchor.constraint(equalToConstant: 100),
            redView.heightAnchor.constraint(equalToConstant: 100)
        ])

    }


}

class UIStackViewController: UIViewController {
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .yellow
//
//        // Tạo Red View
//        let redView = UIView()
//        redView.backgroundColor = .red
//        redView.translatesAutoresizingMaskIntoConstraints = false
//
//        // Tạo Blue View
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
//        blueView.translatesAutoresizingMaskIntoConstraints = false
//
//        // Thêm StackView chứa hai view trên
//        let stackView = UIStackView(arrangedSubviews: [redView, blueView])
//        stackView.axis = .horizontal
//        stackView.spacing = 10
//        stackView.alignment = .fill
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            // Canh giữa StackView
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.widthAnchor.constraint(equalToConstant: 200),
//            stackView.heightAnchor.constraint(equalToConstant: 300)
//        ])
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        let safeArea = view.safeAreaLayoutGuide

        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)

        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            redView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            redView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

}

class LogLoginViewController: UIViewController {
    
    let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpUI()
        setupConstraints()
    }
    
    func setUpUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

