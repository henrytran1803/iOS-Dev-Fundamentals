//
//  GreenViewController.swift
//  LifeCycle
//
//  Created by henrytran1803 on 2/1/25.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("GreenViewController controller - View did load")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("GreenViewController controller - viewWillAppear")

    }
    override func viewDidAppear(_ animated: Bool) {
        print("GreenViewController controller - viewDidAppear")

    }
    override func viewDidDisappear(_ animated: Bool) {
        print("GreenViewController controller - viewDidDisappear")

    }
    override func viewWillDisappear(_ animated: Bool) {
        print("GreenViewController controller - viewWillDisappear")

    }

}
