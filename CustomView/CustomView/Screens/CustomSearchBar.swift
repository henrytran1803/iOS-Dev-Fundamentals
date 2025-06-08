//
//  CustomSearchBar.swift
//  CustomView
//
//  Created by Việt Anh Trần on 16/5/25.
//

import UIKit

final class CustomSearchBar: UIView {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "search_ic"))
        imageView.tintColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search .."
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = .label
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray6
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 25 
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Setup
    private func setupView() {
        addSubview(backgroundView)
        backgroundView.addSubview(iconImageView)
        backgroundView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconImageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 12),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -12),
            textField.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // MARK: - Public API
    func setPlaceholder(_ text: String) {
        textField.placeholder = text
    }

    func getText() -> String? {
        return textField.text
    }
}
