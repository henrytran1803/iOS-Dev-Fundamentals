//
//  SettingViewController.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/19/25.
//

import UIKit

class SettingViewController: UIViewController {
    var controlView: ControlAndActionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Setting"
        setUpUI()
        setUpContrain()
        // Do any additional setup after loading the view.
    }
    

    func setUpUI(){
        controlView = ControlAndActionView()
        controlView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controlView)
    }
    func setUpContrain(){
        NSLayoutConstraint.activate([
            controlView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controlView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            controlView.widthAnchor.constraint(equalToConstant: 300),
            controlView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
