//
//  StudentCell.swift
//  Buoi11
//
//  Created by Việt Anh Trần on 22/4/25.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(name: String) {
        lblName.text = name
    }
}
