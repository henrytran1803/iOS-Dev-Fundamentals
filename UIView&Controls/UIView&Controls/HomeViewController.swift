//\//  HomeViewController.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/19/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var inputViewControl: InputControlView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpUI()
        setUpContrain()
     

    
    }

    

    func setUpUI(){
        inputViewControl = InputControlView()
        inputViewControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputViewControl)
    }
    func setUpContrain(){
        NSLayoutConstraint.activate([
            inputViewControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputViewControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputViewControl.widthAnchor.constraint(equalToConstant: 300),
            inputViewControl.heightAnchor.constraint(equalToConstant: 600)
        ])
    }

}
