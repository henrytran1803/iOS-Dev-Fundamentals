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

struct Student {
    var name : String
    var grades: [Double]
    mutating func addGrade(grade: Double) {
        grades.append(grade)
    }
    func averageGrade() -> Double {
        var result = 0.0
        for i in grades {
            result = result + i
        }
        return result / Double(grades.count)
    }
}


var student = Student(name: "studenta", grades: [1,2])
print(student.averageGrade())


struct Circle {
    var radius: Double
    
    func circleP()-> Double {
        return radius * 2 * 3.14
    }
    
    func circleS()->Double {
        return radius * radius * 3.14

    }
}


var circle = Circle(radius: 2)

print(circle.circleP())
print(circle.circleS())



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
