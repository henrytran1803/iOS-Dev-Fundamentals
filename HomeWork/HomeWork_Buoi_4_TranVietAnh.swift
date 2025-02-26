import UIKit



//exersice 1
func analyzeSentence(_ sentence: String?) -> (wordCount: Int, averageWordLength: Double) {
    guard let sentence = sentence else {
        return (0, 0)
    }
    
    let words = sentence.split(separator: " ")
    let totalWordLength = words.reduce(0) { $0 + $1.count }
    if words.isEmpty {
        return (0, 0)
    }
    let averageWordLength = Double(totalWordLength) / Double(words.count)
    
    return (words.count, averageWordLength)
}

// exersice 2
func filterOutEvenNumbers(_ numbers: [Int?]) -> [Int] {
    return numbers.compactMap { $0 }.filter { $0 % 2 != 0 }
}
func filterOutEvenNumbers2(_ numbers: [Int?]) -> [Int] {
    var nums: [Int] = []
    
    for num in numbers {
        if let num = num, num % 2 != 0 {
            nums.append(num)
        }
    }
    return nums
}
//exersice 3


func removeNilValues(from matrix: [[Int?]?]?) -> [[Int]]? {
    guard let matrix = matrix else {
        return nil
    }
    var result: [[Int]] = []
    for row in matrix {
        if let row = row {
            if !row.isEmpty {
                result.append(row.compactMap { $0 })
            }
        }
    }
    return result.isEmpty ? nil : result
}
// exersice 4

func averageOfNonNilElements(_ array: [Double?]?) -> Double? {
    guard let array = array else {
        return nil
    }
    var sum = 0
    var count = 0
    for element in array {
        if let element = element {
            sum += Int(element)
            count += 1
        }
    }
    return count == 0 ? nil : Double(sum) / Double(count)
}
func averageOfNonNilElements2(_ array: [Double?]?) -> Double? {
    guard let array = array else {
        return nil
    }
    let arrayWithoutNil = array.compactMap { $0 }
    return arrayWithoutNil.isEmpty ? nil : arrayWithoutNil.reduce(0, +) / Double(arrayWithoutNil.count)
}


// exersice 5
func findKeysWithMaxValue(in dict: [String: Set<Int?>?]) -> [String] {
    var maxValue: Int?
    var keysWithMaxValue: [String] = []
    for (key, value) in dict {
        if let value = value {
            let valuesWithoutNil = value.compactMap { $0 }
                if let maxInSet = valuesWithoutNil.max() {
                    if maxValue == nil || maxInSet > maxValue! {
                        maxValue = maxInSet
                        keysWithMaxValue = [key]
                    } else if maxInSet == maxValue {
                        keysWithMaxValue.append(key)
                    }
            }
        }
    }
    return keysWithMaxValue
}

//exersice 6
func sumUniqueValues(_ sets: [Set<Int?>?]) -> Int? {
    var uniqueValues = Set<Int>()
    for set in sets {
        if let set = set {
            let validValues = set.compactMap { $0 }
            uniqueValues.formUnion(validValues)
        }
    }
    
    if uniqueValues.isEmpty {
        return nil
    }
    return uniqueValues.reduce(0, +)
}

