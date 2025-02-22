//
//  NavigationViewController.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/21/25.
//

import UIKit

class NavigationViewController: UIViewController {
    var  button :UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonLabel : UIButton = {
        let buttonLabel = UIButton(type: .system)
        buttonLabel.setTitle("Push Label", for: .normal)
        buttonLabel.addTarget(self, action: #selector(goToLabel), for: .touchUpInside)
        buttonLabel.backgroundColor = .systemBlue
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        return buttonLabel
    }()
    @objc func goToLabel(){
        let vc = AlertViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func push(){
        let vc = WebAdvanceViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Its Navigation"
        // Do any additional setup after loading the view.
        setUpUI()
    }
    func setUpUI(){
        view.addSubview(buttonLabel)
        view.addSubview(button)
        setUpContrain()
    }
    func setUpContrain(){
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            buttonLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
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
