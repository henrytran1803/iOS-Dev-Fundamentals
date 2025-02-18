import UIKit


//
//// Gọi hàm
//Task {
//    do {
//        try await api()
//    } catch {
//        print("Task error: \(error)")
//    }
//}
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !s.isEmpty && !t.isEmpty else { return "" }
        var len = 0
        var res = (0,0)
        var window: [Character: Int] = [:]
        for c in t {
            window[c, default: 0] += 1
        }
        var need = window.count
        if  need > s.count {
            return ""
        }
        var start = 0
        for (i, c) in s.enumerated() {
            if let count = window[c] {
                if count == 1 {
                    need -= 1
                }
                window[c] = count - 1
            }
            if need == 0 {
                res = (res.1 < i - start + 1 ? res : (start, i - start + 1))
                len = min(len, i - start + 1)
                
            }
            if let count = window[c] {
                
            }
        }
        
        
        return ""
    }
}
