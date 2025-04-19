//
//  ViewController.swift
//  UIKITFundamentalApp
//
//  Created by Việt Anh Trần on 5/4/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var changeColorButton: UIButton!
    var correctEmail = "abc@gmail.com"
    var correctPassword = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapChangeColor(_ sender: Any) {
        changeColorButton.backgroundColor = .systemBlue
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        if userNameTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true {
            print("empty pass and username")
            
        }else if  let count = passwordTextField.text?.count{
           if count < 6 {
                print( "password must be 6 character")
            }
        }else if userNameTextField.text == correctEmail && passwordTextField.text == correctPassword {
            print("login success")
        }
    }
}

