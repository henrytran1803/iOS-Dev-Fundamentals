import UIKit



// Gọi hàm
Task {
    do {
        try await api()
    } catch {
        print("Task error: \(error)")
    }
}
