import Foundation


//BT2
class Teacher {
    var name : String
    var subject: String
    var experienceYears: Int {
        didSet {
            print("Giang vien \(name) co kinh nghiem la \(experienceYears)")
        }
    }
    init(name: String, subject: String, experienceYears: Int) {
        self.name = name
        self.subject = subject
        self.experienceYears = experienceYears
    }
    func infomation() {
        print("Giang vien co ten la \(name) dang day mon \(subject) co kinh nghiem \(experienceYears)")
    }
    func increaseExpirience() {
        self.experienceYears = self.experienceYears + 1
    }
}




var teacher = Teacher(name: "a", subject: "a", experienceYears: 3)


teacher.infomation()
teacher.increaseExpirience()

//BT3

struct Student {
   var name: String
}

// Struct Course
struct Course {
   var courseName: String
   var students: [Student]
   
   func printStudents() {
       print("Danh sách học sinh trong khóa \(courseName):")
       for student in students {
           print("- \(student.name)")
       }
   }
}

@MainActor
class School {
   var name: String
   var courses: [Course] = []
   private static var _schoolCount = 0
   
   static var schoolCount: Int {
       get { _schoolCount }
       set { _schoolCount = newValue }
   }
   
   init(name: String) {
       self.name = name
       School._schoolCount += 1
   }
   
   func addCourse(course: Course) {
       courses.append(course)
   }
   
   func printAllStudents() {
       print("Học sinh trong trường \(name):")
       for course in courses {
           course.printStudents()
       }
   }
   
   static func printSchoolCount() {
       print("Tổng số trường học: \(schoolCount)")
   }
}
// BT4
@MainActor
class University {
   private static var _studentCount = 0
   static var studentCount: Int {
       get { _studentCount }
       set { _studentCount = newValue }
   }
   
   var students: [Student] {
       didSet {
           University.studentCount = students.count
       }
   }
   
   var graduatedStudents: [Student] {
       return students.filter { _ in
           return true
       }
   }
   
   init(students: [Student]) {
       self.students = students
       University.studentCount = students.count
   }
   
   func addStudent(student: Student) {
       students.append(student)
   }
   
   func printGraduatedStudents() {
       print("Danh sách sinh viên đã tốt nghiệp:")
       for student in graduatedStudents {
           print("- \(student.name)")
       }
   }
}

// @MainActor
// func example() async {
//    let student1 = Student(name: "An")
//    let student2 = Student(name: "Bình")
//    let student3 = Student(name: "Châu")
   
//    let course1 = Course(courseName: "Toán", students: [student1, student2])
//    let course2 = Course(courseName: "Lý", students: [student2, student3])
   
//    let school1 = School(name: "Trường A")
//    school1.addCourse(course: course1)
//    school1.addCourse(course: course2)
   
//    school1.printAllStudents()
//    School.printSchoolCount()
   
//    let university = University(students: [student1, student2, student3])
//    university.printGraduatedStudents()
// }

// Task { @MainActor in
//    await example()
// }

// bài 3-4 không khó hiểu static

// Bài Tập 2: Hệ Thống Quản Lý Đơn Hàng


class Product {
    var productID: UUID
    var name: String
    var price: Double
    var quantity : Int
    init(productID: UUID, name: String, price: Double, quantity: Int) {
        self.productID = productID
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

class Order {
    var orderID: UUID
    var customerNameL: String
    var items : [Product]
    var calculateTotal: ([Product]) -> Double = { products in
         products.reduce(0) { sum, product in
             sum + (product.price * Double(product.quantity))
         }
     }
    init(orderID: UUID, customerNameL: String, items: [Product]) {
        self.orderID = orderID
        self.customerNameL = customerNameL
        self.items = items
    }
    
    func totalBill() -> Double {
        return calculateTotal(items)
    }
}


// Bài Tập 3: Hệ Thống Quản Lý Khách Sạn



enum TypeRoom {
    case luxury
}
class Room {
    var roomNumber: Int
    var type : TypeRoom
    var price: Double
    var isAvailable: Bool
    init(roomNumber: Int, type: TypeRoom, price: Double, isAvailable: Bool) {
        self.roomNumber = roomNumber
        self.type = type
        self.price = price
        self.isAvailable = isAvailable
    }
}
class Reservation {
    var guestName : String
    var room: Room
    var checkInDate: Date
    var checkOutDate: Date
    init(guestName: String, room: Room, checkInDate: Date, checkOutDate: Date) {
        self.guestName = guestName
        self.room = room
        self.checkInDate = checkInDate
        self.checkOutDate = checkOutDate
    }
    
}

class Hotel {
    var rooms: [Room]
    init(rooms: [Room]) {
        self.rooms = rooms
    }
    func checkRoom(room : Room) {
        print("phong \(room.isAvailable ? "available": "not ready")")
    }
    func addRoom(room: Room){
        rooms.append(room)
        
    }
    
}

// Bài 3: Quản lý Điểm Học Sinh

class Student {
    var name: String
    var mathScore: Double {
        didSet{
            print("diem trung binh mon hoc moi la \(averageScore)")
        }
    }
    var englishScore: Double {
        didSet{
            print("diem trung binh mon hoc moi la \(averageScore)")
        }
    }
    var scienceScore: Double {
        didSet{
            print("diem trung binh mon hoc moi la \(averageScore)")
        }
    }
    
    var averageScore: Double {
        return (mathScore + englishScore + scienceScore)/3
    }
    init(name: String, mathScore: Double, englishScore: Double, scienceScore: Double) {
        self.name = name
        self.mathScore = mathScore
        self.englishScore = englishScore
        self.scienceScore = scienceScore
    }
}
let student = Student(name: "Nam", mathScore: 8.0, englishScore: 7.5, scienceScore: 9.0)
print("Điểm trung bình ban đầu:", student.averageScore)

student.mathScore = 9.0
student.englishScore = 8.5
student.scienceScore = 8.0
// Bài 5: Quản lý Hình Tròn


struct Circle {
    var radius : Double {
        didSet {
            print("Bán kính mới là \(radius), diện tích mới là \(area), chu vi mới là \(circumference)")
        }
    }
    var diameter : Double {
        return radius * 2
    }
    var area : Double {
        return 3.14 * radius * radius
    }
    var circumference : Double {
        return 3.14 * 2 * radius
    }
}

var circles = [
    Circle(radius: 2.0),
    Circle(radius: 3.0),
    Circle(radius: 4.0)
]

circles[1].radius = 1

// Bài 6: Quản lý Nhân viên
class Employee {
    var name : String
    var baseSalary: Double
    var bonus: Double {
        didSet {
            print("Tong luong cua nhan vien \(name) da thay doi \(totalSalary)")
        }
    }
    var totalSalary : Double {
        return baseSalary + bonus
    }
    init(name: String, baseSalary: Double, bonus: Double) {
        self.name = name
        self.baseSalary = baseSalary
        self.bonus = bonus
    }
}
var employees = [Employee(name: "A", baseSalary: 10, bonus: 10), Employee(name: "B", baseSalary: 10, bonus: 10)]


employees[0].bonus = 12

// Bài 10: Quản lý Điện thoại thông minh


class SmartPhone {
    var brand: String
    var model: String
    var batteryLevel: Int {
        didSet {
            if batteryLevel > 100 {
                batteryLevel = 100
            }
            if batteryLevel < 0 {
                batteryLevel = 0
            }
            
            if batteryLevel <= 20 {
                print("Pin yếu, hãy sạc ngay")
            } else if batteryLevel == 100 {
                print("Pin đã đầy, hãy rút sạc")
            }
        }
    }
    
    var isLowBattery: Bool {
        return batteryLevel <= 20
    }
    
    init(brand: String, model: String, batteryLevel: Int) {
        self.brand = brand
        self.model = model
        self.batteryLevel = min(100, max(0, batteryLevel))
    }
}


let phone = SmartPhone(brand: "iPhone", model: "14 Pro", batteryLevel: 50)
phone.batteryLevel = 120
phone.batteryLevel = -10
phone.batteryLevel = 15

// Bài 12: Quản lý Vận động viên 
struct Athele {
    var name : String
    var distanceRun: Double {
        didSet{
            print("new averageSpeed = \(averageSpeed)")
        }
    }
    var timeTaken: Double {
        didSet{
            print("new averageSpeed = \(averageSpeed)")

        }
    }
    var averageSpeed : Double {
        return distanceRun/timeTaken
    }
}
var atheles = [Athele(name: "A", distanceRun: 10, timeTaken: 10), Athele(name: "B", distanceRun: 10, timeTaken: 10)]
atheles[1].distanceRun = 15
