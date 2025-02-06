import UIKit

class User {
 var name: String

 init(name: String) {
   self.name = name
   print("User \(name) is initialized")
 }

 deinit {
   print("User \(name) is being deallocated")
 }
}

let user1 = User(name: "John")
do {
 let user1 = User(name: "John")
}
//User John is initialized
//User John is initialized
//User John is being deallocated
//trong do thì không được ref tới nên không còn tham chiếu tới bị deinit

class Phone {
  let model: String
  var owner: User?

  init(model: String) {
    self.model = model
    print("Phone \(model) is initialized")
  }

  deinit {
    print("Phone \(model) is being deallocated")
  }
}
do {
  let user1 = User(name: "John")
  let iPhone = Phone(model: "iPhone 6s Plus")
}
