//
//  ViewController.swift
//  ThreadApp
//
//  Created by henrytran1803 on 2/4/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func fetchSomethingFromServer() -> String {
        Thread.sleep(forTimeInterval: 1)
        return "Hi there"
    }

    func processData(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        return data.uppercased()
    }

    func calculateFirstResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 3)
        let message = "Number of chars: \(String(data).count)"
        return message
    }

    func calculateSecondResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 4)
        return data.replacingOccurrences(of: "E", with: "e")
    }
}
extension Notification.Name {
static let firstSegment = Notification.Name("first")
static let secondSegment = Notification.Name("second")
static let buttonPressed = Notification.Name("button")
}
