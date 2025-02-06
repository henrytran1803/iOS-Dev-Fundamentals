//
//  ViewController.swift
//  AutoLayout
//
//  Created by henrytran1803 on 2/5/25.
//

import UIKit
import UIKit

class ComplexView: UIView {
    // MARK: - UI Elements
    ///Tiêu đề Text: nội dung, font chữ, outolayout phải dùng
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    ///Profile image

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    /// textField
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 8
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [saveButton, cancelButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nameTextField,
            emailTextField,
            descriptionTextView
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .white
        
        // Add subviews
        addSubview(titleLabel)
        addSubview(profileImageView)
        addSubview(formStackView)
        addSubview(buttonStackView)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            // Profile Image
            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Form Stack View
            formStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            formStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            formStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            // Text Fields height
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            // Description Text View height
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100),
            
            // Button Stack View
            buttonStackView.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 20),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            // Buttons height
            saveButton.heightAnchor.constraint(equalToConstant: 44),
            cancelButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

class ViewController: UIViewController {
    private let complexView = ComplexView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(complexView)
        complexView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            complexView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            complexView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            complexView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            complexView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
