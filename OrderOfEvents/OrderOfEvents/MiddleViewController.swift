//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by henrytran1803 on 2/1/25.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var uiLabel: UILabel!
    var eventNumber = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        uiLabel.text = "Nothing has happened yet." // Thêm dòng này
        addEvent(from: "viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addEvent(from: "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addEvent(from: "viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addEvent(from: "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEvent(from: "viewDidDisappear")
    }
    
    func addEvent(from: String) {
        let existingText = uiLabel.text ?? "Nothing has happened yet."
        uiLabel.text = "\(existingText)\nEvent number \(eventNumber) was \(from)"
        eventNumber += 1
        print("\(existingText)\nEvent number \(eventNumber) was \(from)")
    }
    

}
