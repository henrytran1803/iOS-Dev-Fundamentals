//
//  ViewController.swift
//  Login
//
//  Created by henrytran1803 on 2/1/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func forgotPass(_ sender: Any) {
        performSegue(withIdentifier: "forgot", sender: nil)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        performSegue(withIdentifier: "create", sender: nil)

    }
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: nil)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
         
         if sender == forgotPasswordButton {
             segue.destination.navigationItem.title = "Forgot Password"
         } else if sender == forgotUsernameButton {
             segue.destination.navigationItem.title = "Forgot Username"
         } else {
             segue.destination.navigationItem.title = textFieldUserName.text
         }
    }
}

