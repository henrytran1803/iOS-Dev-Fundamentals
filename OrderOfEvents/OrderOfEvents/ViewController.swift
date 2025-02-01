//
//  ViewController.swift
//  OrderOfEvents
//
//  Created by henrytran1803 on 2/1/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showLifeCycleTapped(_ sender: Any) {
        performSegue(withIdentifier: "middle", sender: nil)

    }
    
}

