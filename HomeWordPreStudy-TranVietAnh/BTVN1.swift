import Foundation
// Chia theo BTVN gồm 4 BTVN


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
