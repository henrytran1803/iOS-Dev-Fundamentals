//
//  PhotoCollectionViewCell.swift
//  Day3
//
//  Created by Việt Anh Trần on 2/4/25.
//

import Foundation
import UIKit
class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    private func setUpUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func configure(with photo: UIImage) {
        imageView.image = photo
    }
}
