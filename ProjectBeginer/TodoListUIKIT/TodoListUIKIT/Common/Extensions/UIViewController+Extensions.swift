//
//  UIViewController+Extensions.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/17/25.
//

import UIKit

extension UIViewController {
    func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
