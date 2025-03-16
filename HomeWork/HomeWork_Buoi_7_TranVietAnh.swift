import UIKit

// Ex1
func factorialClosure(n: Int) -> (() -> Int) {
    let result = (1...max(n, 1)).reduce(1, *)
    return { result }
}
print(factorialClosure(n: 5))

//Ex2
let quotes: [String] = ["hello", "world", "swift", "coders"]
let upperCasedQuotesClosure = quotes.map { $0.uppercased() }
print(upperCasedQuotesClosure)

//Ex3
let stringtoCheck = "Never odd or even"
let palindromeClosure: (String) -> Bool = { string in
    let characters: [Character] = Array(string)
    let reversedCharacters: [Character] = characters.reversed()
    return zip(characters, reversedCharacters).allSatisfy { $0 == $1 }
}
print(palindromeClosure(stringtoCheck))

