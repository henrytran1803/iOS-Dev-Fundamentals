//
//  DrinkView.swift
//  HomeWork_Buoi12_TranVietAnh
//
//  Created by Việt Anh Trần on 7/5/25.
//

import UIKit

class DrinkView: UIView {
    private var isFavorite = false {
        didSet {
            updateFavoriteUI()
        }
    }
    
    // MARK: DECLARE
    let containerView = UIView()
    
    let imageView = UIImageView()
    
    let favoriteButton = UIButton()
    
    let titleLabel = UILabel()
    
    let sizeStackView = UIStackView()
    
    let priceLabel = UILabel()
    
    let addButton = UIButton()
    
    
    
    
    // MARK: INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    func setupView() {
        configUI()
        addContentView()
        addConstraints()
        setupEvent()
    }
    func configUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.borderColor = UIColor.brown.cgColor
        containerView.layer.borderWidth = 1.0 / UIScreen.main.scale
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "img_capuccino")
        imageView.contentMode = .scaleAspectFill
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.setBackgroundImage(UIImage(named: "ic_favorite"), for: .normal)
        
        titleLabel.text = "Cappuccino"
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceLabel.text = "3$"
        priceLabel.font = .systemFont(ofSize: 12, weight: .bold)
        priceLabel.textAlignment = .left
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setBackgroundImage(UIImage(named: "ic_add_btn"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        sizeStackView.axis = .horizontal
        sizeStackView.distribution = .fillEqually
        sizeStackView.spacing = 2
        sizeStackView.translatesAutoresizingMaskIntoConstraints = false

        
        
    }
    
    func addContentView() {
        addSubview(containerView)
        for size in sizeDrink.allCases {
            let button = UIButton()
            button.setTitle(size.title, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 6, weight: .medium)
            button.layer.cornerRadius = 5
            button.clipsToBounds = true

            button.translatesAutoresizingMaskIntoConstraints = false
            
            if size == .small {
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .brown
            } else {
                button.setTitleColor(.brown, for: .normal)
                button.backgroundColor = .white
                button.layer.borderColor = UIColor.brown.cgColor
                button.layer.borderWidth = 1
            }

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 24),
                button.heightAnchor.constraint(equalToConstant: 10)
            ])
            
            sizeStackView.addArrangedSubview(button)
        }
        
        containerView.addSubview(sizeStackView)
        containerView.addSubview(imageView)
        containerView.addSubview(favoriteButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(addButton)


    }
    
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            // containerView
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            // image view
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 7),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -7),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 99/129),
            
            // favoriteButton
            
            favoriteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 7),
            favoriteButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -7),
            favoriteButton.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 15/99),
            favoriteButton.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 15/99),
            // Title
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            // size
            
            sizeStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            sizeStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            sizeStackView.heightAnchor.constraint(equalToConstant: 10),
            sizeStackView.widthAnchor.constraint(equalToConstant: 76),
            //price
            
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            priceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -11),
            priceLabel.heightAnchor.constraint(equalToConstant: 16),
            
            addButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -13),
            addButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 30),
            
            
            ])
    }
    
    func setupEvent(){
        favoriteButton.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
    }
    @objc private func favoriteTapped() {
        isFavorite.toggle()
    }
    private func updateFavoriteUI() {
        let imageName = isFavorite ? "ic_favorite_selected" : "ic_favorite"
        favoriteButton.setBackgroundImage(UIImage(named: imageName), for: .normal)
    }
    
    
}

enum sizeDrink: String, CaseIterable {
    case small
    case medium
    case large
    
    var title: String {
        switch self {
        case .small:
            return "S"
        case .medium:
            return "M"
        case .large:
            return "L"
        }
    }
}
