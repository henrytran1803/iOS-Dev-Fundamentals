//
//  ViewController.swift
//  LearnAnimation
//
//  Created by Việt Anh Trần on 8/4/25.
//

import UIKit

class ViewController: UIViewController {
    let robotFaceImageView = UIImageView()
    let happyButton = UIButton()
    let angryButton = UIButton()
    let sadButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRobotFace()
        setupButtons()
    }
    
    private func setupRobotFace() {
        // Thiết lập ảnh ban đầu
        robotFaceImageView.image = UIImage(named: "happy")
        robotFaceImageView.contentMode = .scaleAspectFit
        robotFaceImageView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(robotFaceImageView)

        // Auto Layout: căn giữa
        NSLayoutConstraint.activate([
            robotFaceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            robotFaceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            robotFaceImageView.widthAnchor.constraint(equalToConstant: 200),
            robotFaceImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupButtons() {
        // Setup Happy Button
        happyButton.setTitle("Happy", for: .normal)
        happyButton.backgroundColor = .systemGreen
        happyButton.layer.cornerRadius = 8
        happyButton.translatesAutoresizingMaskIntoConstraints = false
        happyButton.addTarget(self, action: #selector(happyButtonTapped), for: .touchUpInside)
        
        // Setup Angry Button
        angryButton.setTitle("Angry", for: .normal)
        angryButton.backgroundColor = .systemRed
        angryButton.layer.cornerRadius = 8
        angryButton.translatesAutoresizingMaskIntoConstraints = false
        angryButton.addTarget(self, action: #selector(angryButtonTapped), for: .touchUpInside)
        
        // Setup Sad Button
        sadButton.setTitle("Sad", for: .normal)
        sadButton.backgroundColor = .systemBlue
        sadButton.layer.cornerRadius = 8
        sadButton.translatesAutoresizingMaskIntoConstraints = false
        sadButton.addTarget(self, action: #selector(sadButtonTapped), for: .touchUpInside)
        
        // Add buttons to view
        view.addSubview(happyButton)
        view.addSubview(angryButton)
        view.addSubview(sadButton)
        
        // Setup constraints for buttons
        NSLayoutConstraint.activate([
            happyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            happyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            happyButton.widthAnchor.constraint(equalToConstant: 100),
            happyButton.heightAnchor.constraint(equalToConstant: 44),
            
            angryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            angryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            angryButton.widthAnchor.constraint(equalToConstant: 100),
            angryButton.heightAnchor.constraint(equalToConstant: 44),
            
            sadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sadButton.widthAnchor.constraint(equalToConstant: 100),
            sadButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func happyButtonTapped() {
        changeEmotion(to: "happy")
    }
    
    @objc func angryButtonTapped() {
        changeEmotion(to: "angry")
    }
    
    @objc func sadButtonTapped() {
        changeEmotion(to: "sad")
    }
    
    func changeEmotion(to emotion: String) {
        guard let newImage = UIImage(named: emotion) else { return }
        animateChange(to: newImage, imageView: robotFaceImageView)
    }

    func animateChange(to newImage: UIImage, imageView: UIImageView) {
        UIView.animate(withDuration: 0.2, animations: {
            imageView.alpha = 0
            imageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            imageView.image = newImage
            UIView.animate(withDuration: 0.3) {
                imageView.alpha = 1
                imageView.transform = .identity
            }
        }
    }
}

