//
//  model.swift
//  HomeWork_Buoi11_TranVietAnh
//
//  Created by Việt Anh Trần on 23/4/25.
//

import Foundation
enum Size: String {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}
class Product {
    var name: String
    var price: Double
    var size: [Size]?
    var image: String
    var isLike: Bool = false
    init(name: String, price: Double, size: [Size], image: String, isLike: Bool) {
        self.name = name
        self.price = price
        self.size = size
        self.image = image
        self.isLike = isLike
    }
}
class MockData {
    var products: [Product] = [Product(name: "Cappuccino", price: 3, size: [.small, .medium, .large], image: "capuchino", isLike: false), Product(name: "Espresso", price: 2, size: [], image: "expresso", isLike: false), Product(name: "Americano", price: 2.55, size: [.small, .medium], image: "americano", isLike: false), Product(name: "Latte", price: 4, size: [.small, .medium, .large], image: "latte", isLike: false),]
                               
}
