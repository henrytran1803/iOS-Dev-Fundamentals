//
//  CustomView.swift
//  Day1
//
//  Created by Việt Anh Trần on 31/3/25.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("[CustomView] init(frame) 🎨")
        backgroundColor = .systemBlue
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("[CustomView] init(coder) 🏗️")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        print("[CustomView] layoutSubviews 🔧")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("[CustomView] draw 🖌️")
    }

    deinit {
        print("[CustomView] CustomView bị giải phóng 🗑️")
    }
}
