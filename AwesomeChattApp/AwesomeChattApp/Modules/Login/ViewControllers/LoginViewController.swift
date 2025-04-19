//
//  LoginViewController.swift
//  AwesomeChattApp
//
//  Created by Việt Anh Trần on 5/4/25.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: Declare
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "iconlogin"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let traiNghiemLabel: UILabel = {
        let label = UILabel()
        label.text = "Trải nghiệm Awesome chat"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .thin)
        label.textColor = .black
        return label
    }()
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Đăng nhập"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        label.textColor = UIColor(hex: "#4356B4")
        return label
    }()
    
    let emailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    let passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .systemGray
        return label
    }()
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Mật khẩu"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .systemGray
        return label
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    let forgotpasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Quên mật khẩu?", for: .normal)
        button.setTitleColor( UIColor.init(hex: "#4356B4"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return button
    }()
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("ĐĂNG NHẬP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hex: "#4356B4")
        button.layer.cornerRadius = 24
        return button
    }()
    let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Bạn chưa có tài khoản?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        return label
    }()
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Đăng ký ngay", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor( UIColor.init(hex: "#4356B4"), for: .normal)
        return button
    }()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 40
        return stackView
    }()
    let dontHaveAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
        setConstraints()
    }
    

    func setUp(){
        view.backgroundColor = .white
        view.addSubview(iconImageView)
        view.addSubview(traiNghiemLabel)
        view.addSubview(loginLabel)
        emailView.addSubview(emailLabel)
        emailView.addSubview(emailTextField)
        passwordView.addSubview(passwordLabel)
        passwordView.addSubview(passwordTextField)
        stackView.addArrangedSubview(emailView)
        stackView.addArrangedSubview(passwordView)
        view.addSubview(stackView)
        view.addSubview(forgotpasswordButton)
        view.addSubview(loginButton)
        dontHaveAccountStackView.addArrangedSubview(dontHaveAccountLabel)
        dontHaveAccountStackView.addArrangedSubview(registerButton)
        view.addSubview(dontHaveAccountStackView)
        
        
          //  placeholder
          let attributes: [NSAttributedString.Key: Any] = [
              .foregroundColor: UIColor.gray,
              .font: UIFont.systemFont(ofSize: 12, weight: .bold)
          ]
          emailTextField.attributedPlaceholder = NSAttributedString(string: "yourname@gmail.com", attributes: attributes)
          
          //bottom line
          let bottomLine = CALayer()
          bottomLine.frame = CGRect(x: 0, y: emailTextField.frame.height - 1, width: emailTextField.frame.width, height: 1)
          bottomLine.backgroundColor = UIColor.lightGray.cgColor
          emailTextField.borderStyle = .none
          emailTextField.layer.addSublayer(bottomLine)
          // icon
          let emailIcon = UIImageView(image: UIImage(systemName: "envelope"))
          emailIcon.tintColor = .blue
          emailIcon.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
          emailTextField.rightView = emailIcon
          emailTextField.rightViewMode = .always
        //password textfield
          passwordTextField.isSecureTextEntry = true
          passwordTextField.attributedPlaceholder = NSAttributedString(string: "********", attributes: attributes)
          
          //bottom line
          let bottomLinePass = CALayer()
          bottomLinePass.frame = CGRect(x: 0, y: passwordTextField.frame.height - 1, width: passwordTextField.frame.width, height: 1)
          bottomLinePass.backgroundColor = UIColor.lightGray.cgColor
          passwordTextField.borderStyle = .none
          passwordTextField.layer.addSublayer(bottomLinePass)
          // icon
          let keyIcon = UIImageView(image: UIImage(systemName: "key"))
          keyIcon.tintColor = .blue
          keyIcon.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
          passwordTextField.rightView = keyIcon
          passwordTextField.rightViewMode = .always
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            iconImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            iconImageView.widthAnchor.constraint(equalToConstant: 124),
            iconImageView.heightAnchor.constraint(equalToConstant: 124),
            
            traiNghiemLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 15),
            traiNghiemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginLabel.topAnchor.constraint(equalTo: traiNghiemLabel.bottomAnchor, constant: 20),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            emailLabel.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 0),
            emailLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 0),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 7),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 0),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 0),
            emailView.heightAnchor.constraint(equalToConstant: 60),
            
            passwordLabel.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 0),
            passwordLabel.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 0),
            
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 0 ),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 7),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 0),

            passwordView.heightAnchor.constraint(equalToConstant: 60),
            
            stackView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            forgotpasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            forgotpasswordButton.topAnchor.constraint(equalTo:  stackView.bottomAnchor, constant: 15),
            
            loginButton.topAnchor.constraint(equalTo: forgotpasswordButton.bottomAnchor, constant: 47),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            dontHaveAccountStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            dontHaveAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
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




extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        if hexString.count == 6 {
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: 1.0
            )
        } else {
            // Default color if input is invalid
            self.init(white: 0.5, alpha: 1.0)
        }
    }
}
