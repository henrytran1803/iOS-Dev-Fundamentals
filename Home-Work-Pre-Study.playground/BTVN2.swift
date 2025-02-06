import Foundation

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