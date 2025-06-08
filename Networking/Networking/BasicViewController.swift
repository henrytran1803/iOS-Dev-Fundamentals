import UIKit

class BasicViewController: UIViewController {
let socket = WebSocketBasicManager()
    
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let idTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "User ID (for PUT/DELETE)"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let resultTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private let fetchButton = UIButton(title: "Fetch Users")
    private let postButton = UIButton(title: "Create User (POST)")
    private let putButton = UIButton(title: "Update User (PUT)")
    private let deleteButton = UIButton(title: "Delete User (DELETE)")

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Networking CRUD"
        view.backgroundColor = .white
        setupUI()
        setupActions()
        
    }

    private func setupActions() {
        fetchButton.addTarget(self, action: #selector(sendMessageTapped), for: .touchUpInside)
        postButton.addTarget(self, action: #selector(postUser), for: .touchUpInside)
        putButton.addTarget(self, action: #selector(updateUser), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteUser), for: .touchUpInside)
    }

    private func setupUI() {
        let stack = UIStackView(arrangedSubviews: [
            nameTextField, emailTextField, idTextField,
            fetchButton, postButton, putButton, deleteButton, resultTextView
        ])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            resultTextView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    // MARK: - Networking

    @objc private func fetchUsers() {
        guard let url = URL(string: "http://192.168.1.217:8000/users/") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                self.updateResult("❌ Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                self.updateResult("❌ No data received")
                return
            }

            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                let text = users.map { "\($0.id): \($0.name) - \($0.email)" }.joined(separator: "\n")
                self.updateResult(text)
            } catch {
                self.updateResult("❌ Decoding error: \(error)")
            }
        }.resume()
    }

    @objc private func postUser() {
        guard let url = URL(string: "http://192.168.1.217:8000/users/") else { return }

        let user = UserCreate(name: nameTextField.text ?? "", email: emailTextField.text ?? "")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            updateResult("❌ Encoding error: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                self.updateResult("❌ Error: \(error.localizedDescription)")
                return
            }
            self.updateResult("✅ User created")
        }.resume()
    }

    @objc private func updateUser() {
        guard let id = idTextField.text, let url = URL(string: "http://192.168.1.217:8000/users/\(id)/") else { return }

        let user = UserCreate(name: nameTextField.text ?? "", email: emailTextField.text ?? "")
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            updateResult("❌ Encoding error: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                self.updateResult("❌ Error: \(error.localizedDescription)")
                return
            }
            self.updateResult("✅ User updated")
        }.resume()
    }

    @objc private func deleteUser() {
        guard let id = idTextField.text, let url = URL(string: "http://192.168.1.217:8000/users/\(id)/") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { _, _, error in
            if let error = error {
                self.updateResult("❌ Error: \(error.localizedDescription)")
                return
            }
            self.updateResult("✅ User deleted")
        }.resume()
    }

    private func updateResult(_ text: String) {
        DispatchQueue.main.async {
            self.resultTextView.text = text
        }
    }
    
    @IBAction func sendMessageTapped(_ sender: UIButton) {
        socket.send(message: "Hello server!")
    }

    deinit {
        socket.disconnect()
    }
}

// MARK: - Extensions & Models

private extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

struct UserCreate: Codable {
    let name: String
    let email: String
}
