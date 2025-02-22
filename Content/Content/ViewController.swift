//
//  ViewController.swift
//  Content
//
//  Created by henrytran1803 on 2/21/25.
//

import UIKit

class BuggyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        print("🛠️ Đang sửa bug...")

        // ✅ Bug ban đầu: Text bị sai
        let text = fixBug(originalText: "Helllo, World!") // Lỗi typo "Hello"
        print("📝 Đã sửa: \(text)")
        
        // ❌ Fix bug xong nhưng tạo thêm bug mới...
        let result = divideNumbers(a: 10, b: 0) // Chia cho 0!
        print("📊 Kết quả phép chia: \(result)")
        
        // 🚨 Crash toàn bộ app do bug mới!
    }
    
    // MARK: - Hàm fix bug ban đầu
    func fixBug(originalText: String) -> String {
        return originalText.replacingOccurrences(of: "Helllo", with: "Hello")
    }
    
    // MARK: - Hàm fix bug nhưng tạo bug mới (Chia cho 0)
    func divideNumbers(a: Int, b: Int) -> Int {
        return a / b // ❌ App crash vì chia cho 0!
    }
}
