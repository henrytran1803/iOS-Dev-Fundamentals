//
//  ViewController.swift
//  LifeCycle
//
//  Created by henrytran1803 on 2/1/25.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("RedViewController controller - View did load")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("RedViewController controller - viewWillAppear")

    }
    override func viewDidAppear(_ animated: Bool) {
        print("RedViewController controller - viewDidAppear")

    }
    override func viewDidDisappear(_ animated: Bool) {
        print("RedViewController controller - viewDidDisappear")

    }
    override func viewWillDisappear(_ animated: Bool) {
        print("RedViewController controller - viewWillDisappear")

    }
}

