//
//  RegisterViewController.swift
//  HomeWork_buoi10_TranVietAnh
//
//  Created by Việt Anh Trần on 21/4/25.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapRegister(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func didTapLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func didTapPrivacy(_ sender: Any) {
        let sheetVC = SheetViewController()
        sheetVC.modalPresentationStyle = .overCurrentContext
        sheetVC.modalTransitionStyle = .crossDissolve
        self.present(sheetVC, animated: true)
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
