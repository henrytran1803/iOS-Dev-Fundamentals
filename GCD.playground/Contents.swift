import UIKit

var greeting = "Hello, playground"
let queue = DispatchQueue(label: "com.example.queue")
queue.sync {
    
    for i in 1...5 {
        print("Task 1: \(i)")
    }
}
for i in 1...5 {
    print("Task 2: \(i)")
}
let customQueue = DispatchQueue(label: "com.example.customQueue", attributes: .concurrent)
