//
//  HomeViewController.swift
//  SecondApp
//
//  Created by Việt Anh Trần on 18/4/25.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func tapButton(_ sender: Any) {
        let detailVC = DetailViewController()
        
//        self.navigationController?.pushViewController(detailVC, animated: true)
        detailVC.modalTransitionStyle = .flipHorizontal
        detailVC.modalPresentationStyle = .overFullScreen
        self.present(detailVC, animated: true)
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
