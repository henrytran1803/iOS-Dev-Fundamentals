//
//  CatCell.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//


import UIKit

class DogCell: UITableViewCell {
    
    private let tagsLabel = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
  
        tagsLabel.numberOfLines = 0
        tagsLabel.font = UIFont.systemFont(ofSize: 14)
        tagsLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(tagsLabel)

        NSLayoutConstraint.activate([
         
            tagsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            tagsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            tagsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with dog: Dog) {
        tagsLabel.text = "name: " + (dog.attributes.name )
    }
}
