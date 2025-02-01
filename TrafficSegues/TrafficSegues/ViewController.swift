//
//  ViewController.swift
//  TrafficSegues
//
//  Created by henrytran1803 on 2/1/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segueSwitch: UISwitch!
    
    @IBAction func purpleButtonTapped(_ sender: Any) {
        if segueSwitch.isOn {
            performSegue(withIdentifier: "Purple", sender: nil)
        }
    }
    @IBAction func yelowButtonTapped(_ sender: Any) {
        if segueSwitch.isOn {
            performSegue(withIdentifier: "Yellow", sender: nil)
        }

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToRedWithUnwindSegue(unwindSegue: UIStoryboardSegue) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

