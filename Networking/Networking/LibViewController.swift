import UIKit
import Alamofire

class LibViewController: UIViewController {
    
    let baseURL = "http://192.168.1.217:8000/users/"
    
    // MARK: - UI Elements
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .words
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        return tf
    }()
    
    let idTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "User ID"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        return tf
    }()
    
    let logTextView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.font = .systemFont(ofSize: 14)
        tv.layer.borderColor = UIColor.gray.cgColor
        tv.layer.borderWidth = 1
        tv.layer.cornerRadius = 8
        return tv
    }()
    
    let createButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Create User", for: .normal)
        return btn
    }()
    
    let updateButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Update User", for: .normal)
        return btn
    }()
    
    let deleteButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Delete User", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        return btn
    }()
    
    let readButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Get All Users", for: .normal)
        return btn
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupActions()
    }
    
    // MARK: - Setup UI
    func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [
            nameTextField,
            emailTextField,
            idTextField,
            createButton,
            updateButton,
            deleteButton,
            readButton,
            logTextView
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // MARK: - Setup Actions
    func setupActions() {
        createButton.addTarget(self, action: #selector(createUserTapped), for: .touchUpInside)
        updateButton.addTarget(self, action: #selector(updateUserTapped), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteUserTapped), for: .touchUpInside)
        readButton.addTarget(self, action: #selector(readUsersTapped), for: .touchUpInside)
    }
    
    // MARK: - Button Actions
    @objc func createUserTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty else {
            appendLog("⚠️ Please enter name and email.")
            return
        }
        createUser(name: name, email: email)
    }
    
    @objc func updateUserTapped() {
        guard let idText = idTextField.text, let id = Int(idText),
              let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty else {
            appendLog("⚠️ Please enter valid id, name and email for update.")
            return
        }
        updateUser(id: id, name: name, email: email)
    }
    
    @objc func deleteUserTapped() {
        guard let idText = idTextField.text, let id = Int(idText) else {
            appendLog("⚠️ Please enter valid user id for delete.")
            return
        }
        deleteUser(id: id)
    }
    
    @objc func readUsersTapped() {
        readUsers()
    }
    
    // MARK: - Networking functions
    
    func createUser(name: String, email: String) {
        let newUser = UserCreate(name: name, email: email)
        
        AF.request(baseURL,
                   method: .post,
                   parameters: newUser,
                   encoder: JSONParameterEncoder.default).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                self.appendLog("✅ Created user: \(user.name) - \(user.email)")
            case .failure(let error):
                self.appendLog("❌ Create user failed: \(error.localizedDescription)")
            }
        }
    }
    
    func readUsers() {
        AF.request(baseURL,
                   method: .get).responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let users):
                var logText = "📋 Users list:\n"
                users.forEach { logText += "- \($0.name): \($0.email)\n" }
                self.appendLog(logText)
            case .failure(let error):
                self.appendLog("❌ Read users failed: \(error.localizedDescription)")
            }
        }
    }
    
    func updateUser(id: Int, name: String, email: String) {
        let updatedUser = UserCreate(name: name, email: email)
        
        AF.request(baseURL + "\(id)",
                   method: .put,
                   parameters: updatedUser,
                   encoder: JSONParameterEncoder.default).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                self.appendLog("✅ Updated user: \(user.name) - \(user.email)")
            case .failure(let error):
                self.appendLog("❌ Update user failed: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteUser(id: Int) {
        AF.request(baseURL + "\(id)",
                   method: .delete).responseJSON { response in
            switch response.result {
            case .success(let json):
                self.appendLog("🗑️ Deleted user response: \(json)")
            case .failure(let error):
                self.appendLog("❌ Delete user failed: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Helper
    func appendLog(_ text: String) {
        DispatchQueue.main.async {
            self.logTextView.text += text + "\n"
            let range = NSRange(location: self.logTextView.text.count - 1, length: 1)
            self.logTextView.scrollRangeToVisible(range)
        }
    }
}

