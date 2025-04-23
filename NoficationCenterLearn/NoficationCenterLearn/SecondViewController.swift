//
//  SecondViewController.swift
//  NoficationCenterLearn
//
//  Created by Việt Anh Trần on 19/4/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapSend(_ sender: Any) {
        let newName = nameLabel.text ?? ""
                // Gửi thông báo
        NotificationCenter.default.post(
            name: NSNotification.Name("nameUpdated"),
            object: nil,
            userInfo: ["name": newName]
        )

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
