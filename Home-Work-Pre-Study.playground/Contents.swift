import UIKit
import Foundation
// BTVN1
// Viet ham SNT

func soNguyenTo(number: Int) -> Bool {
    for i in 2 ..< Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}


// Viet ham dao nguoc chuoi

func daoNguocChuoi(str: String) -> String {
    var result: String = ""
    for char in str {
        result = String(char) + result
    }
    return result
}
func daoNguocChuoi2(str: String) -> String {
    return String(str.reversed())
}


// Ham tra ve so le lon nhat

func hamSoLeLonNhat(list: [Int]) -> Int? {
    var result: Int?
    
    for i in list {
        if i % 2 != 0 {
            if let currentMax = result {
                if i > currentMax {
                    result = i
                }
            } else {
                result = i
            }
        }
    }
    
    return result
}


// ham gia tri middle

func giaTriMiddle(list: [Int]) -> Int? {
    guard !list.isEmpty else { return nil }
    let list2 = list.sorted()
    let middleIndex = (list2.count - 1) / 2
    return list2[middleIndex]
}


// BTVN2


// su dung vong lap de tinh trung binh cong cua cac phan tuw

func tinhTrungBinhCong(list: [Int]) -> Double {
    var result = 0
    for i in list {
        result = result + i
    }
    return Double(result / list.count)
}


// dung vong lap for in ra tat ca cac chuoi co 3 ky tu tro len

func chuoiCo3KyTu(str :[String]) -> [String]{
    var list : [String] = []
    
    
    for i in str {
        if i.count >= 3 {
            list.append(i)
        }
    }
    
    return list
    
}


// tinh tong cac so am trong mang


func tongTatCaCacSoAm(list : [Double]) -> Double {
    var result = 0.0
    for i in list {
        if i < 0 {
            result = result + i
        }
    }
    
    return result
}



// ket hop mang thanh chuoi


func ketHopMangThanhChuoi(list: [String]) -> String {
    var result = ""
    
    for i in list {
        result = result + i
        
    }
    return result
}


// BTVN 3

 
struct Time {
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    
    func counvertToSecond() -> Int {
        return hours*60*60 + minutes * 60 + seconds
    }
    
}

var a = Time(hours: 10, minutes: 10, seconds: 10)
print(a.counvertToSecond())


struct Book {
    var title: String
    var author: String
    var yearPublished: Int
    func checkYearBook()-> Bool {
        if self.yearPublished >= 2001 && self.yearPublished <= 2010 {
            return true
        }
        return false
    }
}

var book = Book(title: "swwift", author: "IDK", yearPublished: 2000)
print(book.checkYearBook())

//struct Student {
//    var name: String
//    var grades: [Double]
//    
//    mutating func addGrade(grade: Double) {
//        grades.append(grade)
//    }
//    
//    func averageGrade() -> Double {
//        guard !grades.isEmpty else { return 0 }
//        return grades.reduce(0, +) / Double(grades.count)
//    }
//}
//
//var student = Student(name: "studenta", grades: [1,2])
//print(student.averageGrade())


//struct Circle {
//    var radius: Double
//    
//    func circleP()-> Double {
//        return radius * 2 * 3.14
//    }
//    
//    func circleS()->Double {
//        return radius * radius * 3.14
//
//    }
//}
//
//
//var circle = Circle(radius: 2)

//print(circle.circleP())
//print(circle.circleS())

// MARK: BTVN 4


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

// bt3
//
//struct Student {
//    var name: String
//}
//
//// Struct Course
//struct Course {
//    var courseName: String
//    var students: [Student]
//    
//    func printStudents() {
//        print("Danh sách học sinh trong khóa \(courseName):")
//        for student in students {
//            print("- \(student.name)")
//        }
//    }
//}
//
//// Class School với thread safety cho static properties
//@MainActor
//class School {
//    var name: String
//    var courses: [Course] = []
//    private static var _schoolCount = 0
//    
//    static var schoolCount: Int {
//        get { _schoolCount }
//        set { _schoolCount = newValue }
//    }
//    
//    init(name: String) {
//        self.name = name
//        School._schoolCount += 1
//    }
//    
//    func addCourse(course: Course) {
//        courses.append(course)
//    }
//    
//    func printAllStudents() {
//        print("Học sinh trong trường \(name):")
//        for course in courses {
//            course.printStudents()
//        }
//    }
//    
//    static func printSchoolCount() {
//        print("Tổng số trường học: \(schoolCount)")
//    }
//}
//
//// Class University với thread safety cho static properties
//@MainActor
//class University {
//    private static var _studentCount = 0
//    static var studentCount: Int {
//        get { _studentCount }
//        set { _studentCount = newValue }
//    }
//    
//    var students: [Student] {
//        didSet {
//            University.studentCount = students.count
//        }
//    }
//    
//    var graduatedStudents: [Student] {
//        return students.filter { _ in
//            return true
//        }
//    }
//    
//    init(students: [Student]) {
//        self.students = students
//        University.studentCount = students.count
//    }
//    
//    func addStudent(student: Student) {
//        students.append(student)
//    }
//    
//    func printGraduatedStudents() {
//        print("Danh sách sinh viên đã tốt nghiệp:")
//        for student in graduatedStudents {
//            print("- \(student.name)")
//        }
//    }
//}
//
//// Example usage
//@MainActor
//func example() async {
//    let student1 = Student(name: "An")
//    let student2 = Student(name: "Bình")
//    let student3 = Student(name: "Châu")
//    
//    let course1 = Course(courseName: "Toán", students: [student1, student2])
//    let course2 = Course(courseName: "Lý", students: [student2, student3])
//    
//    let school1 = School(name: "Trường A")
//    school1.addCourse(course: course1)
//    school1.addCourse(course: course2)
//    
//    school1.printAllStudents()
//    School.printSchoolCount()
//    
//    let university = University(students: [student1, student2, student3])
//    university.printGraduatedStudents()
//}
//
//// Run example
//Task { @MainActor in
//    await example()
//}
// bt2 quản lý đơn hàng

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




// bt3
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
//b 10

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
