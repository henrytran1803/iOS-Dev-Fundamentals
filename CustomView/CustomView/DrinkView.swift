//
//  DrinkView.swift
//  CustomView
//
//  Created by Việt Anh Trần on 6/5/25.
//

import UIKit

class DrinkView: UIView {
    let containerView = UIView()

    let drinkImageView = UIImageView()

    let favoriteImageView = UIImageView()

    let titleLabel = UILabel()

    let sizeStackView = UIStackView()

    let priceLabel = UILabel()

    let addButton = UIButton()
    // dùng khởi tạo trong file code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    // dùng khởi tạo trong file xib, storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    func setUp() {
        configUI()
        // tạo ra các view thành phần
        // tạo ra cấu trúc view
        // tạo layoutview
        addContentView()
        addLayoutConstraints()
    }

    func configUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false

        drinkImageView.image = UIImage(named: "capu")
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        drinkImageView.contentMode = .scaleAspectFill

        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        favoriteImageView.image = UIImage(systemName: "ic_heart")
        favoriteImageView.contentMode = .scaleAspectFit

        titleLabel.text = "Cappuccino"
        titleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left

        sizeStackView.translatesAutoresizingMaskIntoConstraints = false
        sizeStackView.axis = .horizontal
        sizeStackView.spacing = 2
        sizeStackView.distribution = .fillEqually
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "$4.99"
        priceLabel.font = .systemFont(ofSize: 12, weight: .bold)
        priceLabel.textAlignment = .left

        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setBackgroundImage(UIImage(named: "ic_add"), for: .normal)
    }

    func addContentView() {
        addSubview(containerView)
        containerView.addSubview(drinkImageView)
        containerView.addSubview(favoriteImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(sizeStackView)
        containerView.addSubview(priceLabel)
        containerView.addSubview(addButton)
    }

    func addLayoutConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            drinkImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 7),
            drinkImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            drinkImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -7),
            
            drinkImageView.heightAnchor.constraint(equalTo: drinkImageView.widthAnchor, multiplier: 99/129),
            titleLabel.topAnchor.constraint(equalTo: drinkImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            sizeStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            sizeStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 7),
            sizeStackView.heightAnchor.constraint(equalToConstant: 10),
            sizeStackView.widthAnchor.constraint(equalToConstant: 76),
            
            priceLabel.topAnchor.constraint(equalTo: sizeStackView.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            priceLabel.heightAnchor.constraint(equalToConstant: 12),
            
            
            addButton.topAnchor.constraint(equalTo: sizeStackView.topAnchor, constant: 7),
            addButton.trailingAnchor.constraint(equalTo:containerView.trailingAnchor, constant:  -13),
            addButton.widthAnchor.constraint(equalToConstant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            
            

        ])
    }
}

enum DrinkSize {
    case sizeS
    case sizeM
    case sizeL
}
