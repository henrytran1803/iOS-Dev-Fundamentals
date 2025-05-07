//
//  UICollectionView+Ext.swift
//  HomeWork_Buoi11_TranVietAnh
//
//  Created by Việt Anh Trần on 25/4/25.
//


import Foundation
import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(type: T.Type) {
        let name = String(describing: T.self)
        let nib = UINib(nibName: name, bundle: Bundle.main)
        self.register(nib, forCellWithReuseIdentifier: name)
    }
    
    func dequeueCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        let name = String(describing: T.self)
        return self.dequeueReusableCell(withReuseIdentifier: name, for: indexPath) as! T
    }
}
