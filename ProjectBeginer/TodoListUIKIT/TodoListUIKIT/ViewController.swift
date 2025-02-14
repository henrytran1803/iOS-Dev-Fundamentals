//
//  ViewController.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/7/25.
//

import UIKit

@MainActor
class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        labelResult.numberOfLines = 0
        super.viewDidLoad()
    }

    func api() async throws -> [User] {
        guard let url = URL(string: "http://localhost:8080/users") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let users = try decoder.decode([User].self, from: data)
            return users
        } catch {
            print("Error: \(error)")
            throw error
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        labelResult.text = "Loading..."
        
        Task {
            do {
                let result = try await api()
                labelResult.text = result[0].username
            } catch {
                labelResult.text = "Error: \(error.localizedDescription)"
            }
            // Re-enable button
            (sender as? UIButton)?.isEnabled = true
        }
    }
}
