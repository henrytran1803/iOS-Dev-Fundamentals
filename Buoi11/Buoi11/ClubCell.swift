//
//  ClubCell.swift
//  Buoi11
//
//  Created by Việt Anh Trần on 22/4/25.
//

import UIKit

class ClubCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 6

        self.layer.masksToBounds = false // QUAN TRỌNG để shadow hiện
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(name: String, image: String) {
        lblName.text = name
        imgIcon.image = UIImage(named: image)
    }
}
