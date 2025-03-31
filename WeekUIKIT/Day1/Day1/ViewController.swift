//
//  ViewController.swift
//  Day1
//
//  Created by Việt Anh Trần on 31/3/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("[ViewController] viewDidLoad ✅")

        let customView = CustomView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        view.addSubview(customView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("[ViewController] viewWillAppear 👀")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[ViewController] viewDidAppear 🎬")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("[ViewController] viewWillDisappear 👋")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("[ViewController] viewDidDisappear 🚪")
    }

    deinit {
        print("[ViewController] ViewController bị giải phóng 🗑️")
    }
}

