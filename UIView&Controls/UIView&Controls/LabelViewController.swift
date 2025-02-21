//
//  LabelViewController.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/21/25.
//

import UIKit

class LabelViewController: UIViewController {
    
    // MARK: - UI Components
    var buttonBar: UIBarButtonItem!
    
    var buttonOK: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(selected), for: .touchUpInside) // Sửa target thành `self`
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.shadowColor = UIColor.black
        label.shadowOffset = CGSize(width: 2, height: 2)
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // ✅ Khởi tạo buttonBar đúng cách
        buttonBar = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = buttonBar
        
        setUpUI()
        setUpConstraints()
    }
    
    // MARK: - Setup UI
    func setUpUI() {
        view.addSubview(label)
        view.addSubview(buttonOK) // ✅ Đã thêm buttonOK vào view
    }
    
    // MARK: - Setup Constraints
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            // ✅ Căn giữa label
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // ✅ Căn buttonOK phía dưới label
            buttonOK.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            buttonOK.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonOK.widthAnchor.constraint(equalToConstant: 120),
            buttonOK.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Actions
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func selected() {
        let attributedText = NSMutableAttributedString(string: "Swift UIKit",
                                                       attributes: [
                                                        .font: UIFont.systemFont(ofSize: 24, weight: .bold),
                                                        .foregroundColor: UIColor.red
                                                       ])
        
        attributedText.append(NSAttributedString(string: " là tuyệt vời!",
                                                 attributes: [
                                                    .font: UIFont.systemFont(ofSize: 20),
                                                    .foregroundColor: UIColor.blue
                                                 ]))
        
        label.attributedText = attributedText
    }
}
