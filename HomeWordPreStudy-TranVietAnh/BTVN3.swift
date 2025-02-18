 import Foundation

 //BT1
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

//BT2
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


//BT3
struct Student {
   var name: String
   var grades: [Double]
   
   mutating func addGrade(grade: Double) {
       grades.append(grade)
   }
   
   func averageGrade() -> Double {
       guard !grades.isEmpty else { return 0 }
       return grades.reduce(0, +) / Double(grades.count)
   }
}

var student = Student(name: "studenta", grades: [1,2])
print(student.averageGrade())

// BT4
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