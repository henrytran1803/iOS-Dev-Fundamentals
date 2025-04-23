//
//  MainViewController.swift
//  NoficationCenterLearn
//
//  Created by Việt Anh Trần on 19/4/25.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
              self,
              selector: #selector(didTapSend(_:)),
              name: NSNotification.Name("nameUpdated"),
              object: nil
          )
    }
    
    @IBAction func tabGoToView2(_ sender: Any) {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @objc func didTapSend(_ notification: Notification) {
        if let newName = notification.userInfo?["name"] as? String {
            nameLabel.text = "Xin chào, \(newName)"
        }
    }

    deinit {
         NotificationCenter.default.removeObserver(self)
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
