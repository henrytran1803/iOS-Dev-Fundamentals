//
//  ProductTableViewCell.swift
//  Day3
//
//  Created by Việt Anh Trần on 2/4/25.
//

import Foundation
import UIKit
class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"
    
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "cart"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = product.price
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            button.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
