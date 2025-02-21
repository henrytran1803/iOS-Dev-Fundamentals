//
//  SecondVViewController.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/21/25.
//

import UIKit

class SecondVViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Second View"

        // Khởi tạo UIBarButtonItem và đặt target là self
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
    }

    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}

