//
//  SizeCell.swift
//  HomeWork_Buoi11_TranVietAnh
//
//  Created by Việt Anh Trần on 25/4/25.
//

import UIKit

class SizeCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
    }

    func bindData(size: SizeOption) {
        let coffeeColor = UIColor(named: "coffecolor") ?? UIColor.brown
        label.text = size.size.shortLabel
   

        if size.isAvailable {
            backgroundColor = coffeeColor
            label.textColor = .white
            layer.borderColor = coffeeColor.cgColor
        } else {
            backgroundColor = .white
            label.textColor = coffeeColor
            layer.borderColor = coffeeColor.cgColor
        }
    }
}
