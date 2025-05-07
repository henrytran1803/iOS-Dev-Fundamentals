//
//  MainTabType.swift
//  CustomView
//
//  Created by Việt Anh Trần on 6/5/25.
//

import Foundation
import UIKit
enum MainTabType : String {
    case home
    case favorite
    case cart
    case profile
    var title: String {
        self.rawValue.capitalized
    }
    func icon(isSelected: Bool) -> UIImage? {
        print("ic_\(self.rawValue)\(isSelected ? "_selected" : "")")
        return UIImage(named: "ic_\(self.rawValue)\(isSelected ? "_selected" : "")")
    }
}
