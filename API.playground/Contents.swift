import Foundation

class BankAccount {
    var balance: Double {
        didSet {
            print("New balance: \(balance)")
        }
    }
    var owner: String
    
    init(owner: String, balance: Double = 0) {
        self.owner = owner
        self.balance = balance
        
    }
    
    var isRich: Bool {
        return balance > 1_000_000
    }
    func addBalance(_ amount: Double) {
        guard amount > 0 else {
            return
        }
        balance += amount
    }
    func withdraw(_ amount: Double) {
        guard amount > 0, balance >= amount else {
            return
        }
        balance -= amount
    }
    
}
var owner1 = "Phạm Minh Huy"
var account1 = BankAccount(owner: owner1)
account1.addBalance(100000)
account1.addBalance(50000)
account1.addBalance(-50000)
account1.withdraw(20000)
print("Is \(owner1) rich? : \(account1.isRich)")


struct Product {
    var name: String
    var quantity: Int {
        didSet {
            print("Product \(name) remaining: \(quantity).")
        }
    }
    var isInStock: Bool {
        return quantity > 0
    }
    init(name: String, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
}
class ProductManager {
    var products: [Product]
    init(products: [Product]) {
        self.products = products
    }
   
    func importProduct(_ name: String, _ amount: Int){
        guard amount <= 0 else { return}
        for (index, product) in products.enumerated() {
            if product.name == name {
                products[index].quantity = amount
                return
            }
        }
        print("Product \(name) not found.")
    }
    func exportProduct(_ name: String, _ amount: Int){
        for (index, product) in products.enumerated() {
            if product.name == name {
                guard amount <= 0 && product.quantity >= amount else { return}
                products[index].quantity -= amount
                return
            }
        }
        print("Product \(name) not found.")
    }
    func infoProduct(){
        for product in products {
            print("Product \(product.name) remaining: \(product.quantity).")
        }
    }
    func checkStock(){
        for product in products {
            if product.isInStock == false {
                print("Product \(product.name) is out of stock.")
            }
        }
    }
}
var product1 = Product(name: "Iphone 13", quantity: 10)
var product2 = Product(name: "Iphone 12", quantity: 20)
var product3 = Product(name: "Iphone 11", quantity: 0)
var productManager = ProductManager(products: [product1, product2, product3])
productManager.importProduct("Iphone 13", 20)
productManager.importProduct("Iphone 13", -20)
productManager.infoProduct()
productManager.exportProduct("Iphone 13", 50)
productManager.checkStock()

struct Circle {
    private var pi: Double = 3.14
    var radius: Double {
        didSet {
            print("New radius is \(radius), new area \(String(format: "%.2f", area)), new circumference \(String(format: "%.2f", circumference))")
        }
    }
    
    init(radius: Double) {
        self.radius = radius
    }
    var diameter: Double {
        return radius * 2
    }
    var area: Double {
        return .pi * radius * radius
    }
    var circumference: Double {
        return 2 * .pi * radius
    }
}
var circles: [Circle] = []
circles.append(Circle(radius: 5))
circles[0].radius = 10
circles.append(Circle(radius: 10))
circles.append(Circle(radius: 15))
circles[1].radius = 10
circles[2].radius = 10
//
//Bài 3: Quản lý Điểm Học Sinh
//Tạo một class Student để quản lý điểm số học sinh với các yêu cầu sau:
//
//Thuộc tính:
//name: Tên học sinh (kiểu String).
//mathScore, englishScore, scienceScore: Điểm từng môn (kiểu Double).
//Computed property:
//averageScore: Điểm trung bình của ba môn.
//Observer property:
//Khi bất kỳ điểm môn học nào thay đổi, in ra: "Điểm trung bình mới của học sinh X là Y.".
//
//Yêu cầu:
//
//Tạo danh sách học sinh.
//Thêm và cập nhật điểm, kiểm tra kết quả.

class Student {
    var name: String
    var mathScore: Double {
        didSet {
            print("Student \(name) has new average score: \(String(format:"%.2f",averageScore))")
        }
    }
    var englishScore: Double {
        didSet {
            print("Student \(name) has new average score: \(String(format:"%.2f",averageScore))")
        }
    }
    var scienceScore: Double {
        didSet {
            print("Student \(name) has new average score: \(String(format:"%.2f",averageScore))")
        }
    }
    var averageScore: Double {
        return (mathScore + englishScore + scienceScore) / 3
    }
    
    init(name: String, mathScore: Double, englishScore: Double, scienceScore: Double) {
        self.name = name
        self.mathScore = mathScore
        self.englishScore = englishScore
        self.scienceScore = scienceScore
    }
    
}
class StudentManager {
    var students: [Student] = []
    
    func addStudent(_ student: Student) {
        students.append(student)
    }
    
    func updateStudent(name: String, mathScore: Double, englishScore: Double, scienceScore: Double) {
        guard mathScore >= 0 && mathScore <= 10 && englishScore >= 0 && englishScore <= 10 && scienceScore >= 0 && scienceScore <= 10 else {
            print("scrore not valid")
            return
        }
        if let index = students.firstIndex(where: { $0.name == name }) {
            students[index].mathScore = mathScore
            students[index].englishScore = englishScore
            students[index].scienceScore = scienceScore
        }
    }
    func infoAllStudent() {
        for student in students {
            print("Student \(student.name) has average score: \(String(format:"%.2f", student.averageScore)  )")
        }
    }
}

var studentManager = StudentManager()
studentManager.addStudent(Student(name: "Huy", mathScore: 8, englishScore: 9, scienceScore: 7))
studentManager.addStudent(Student(name: "Minh", mathScore: 5, englishScore: 6, scienceScore: 8))

studentManager.updateStudent(name: "Huy", mathScore: 9, englishScore: 8, scienceScore: 9)

studentManager.infoAllStudent()
