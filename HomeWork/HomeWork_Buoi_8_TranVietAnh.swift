import foundation
//ex1
func sum<T: Numeric>(_ numbers: [T]) -> T {
    return numbers.isEmpty ? 0 : numbers.reduce(0, +)
}

print(sum([1, 2, 3, 4, 5]))
print(sum([1.5, 2.5, 3.5]))


//Ex2
func countOccurrences<T: Equatable>(of element: T, in array: [T]?) -> Int {
    return (array ?? []).reduce(0) { $0 + ($1 == element ? 1 : 0) }
}

print(countOccurrences(of: 3, in: [1, 2, 3, 3, 4, 5]))
print(countOccurrences(of: "a", in: ["a", "b", "a", "c", "a"]))



//Ex3
protocol Identifiable {
    var id: String { get }
}

class Entity<T>: Identifiable {
    let id: String
    let value: T

    init(id: String, value: T) {
        self.id = id
        self.value = value
    }

    func getValue() -> T {
        return value
    }
}
extension Entity {
    static func getEntities(from list: [Entity]) -> [String] {
        return list.map { $0.id }
    }
}

let e1 = Entity(id: "101", value: "Alice")
let e2 = Entity(id: "102", value: "Bob")
let e3 = Entity(id: "103", value: "Charlie")

let entityList = [e1, e2, e3]
Entity.getEntities(from: entityList)


