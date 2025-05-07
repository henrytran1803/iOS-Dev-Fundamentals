//
//  model.swift
//  HomeWork_Buoi11_TranVietAnh
//
//  Created by Việt Anh Trần on 23/4/25.
//

import Foundation
enum Size: String, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"

    var shortLabel: String {
        switch self {
        case .small: return "S"
        case .medium: return "M"
        case .large: return "L"
        }
    }
}

struct SizeOption {
    var size: Size
    var isAvailable: Bool
}


class Product {
    var name: String
    var price: Double
    var sizeOptions: [SizeOption]
    var image: String
    var isLike: Bool = false
    
    init(name: String, price: Double, sizeOptions: [SizeOption], image: String, isLike: Bool) {
        self.name = name
        self.price = price
        self.sizeOptions = sizeOptions
        self.image = image
        self.isLike = isLike
    }
}


class MockData {
    var products: [Product] = [
        Product(name: "Cappuccino", price: 3,
                sizeOptions: [
                    SizeOption(size: .small, isAvailable: true),
                    SizeOption(size: .medium, isAvailable: true),
                    SizeOption(size: .large, isAvailable: true)
                ],
                image: "capuchino", isLike: false),
        
        Product(name: "Espresso", price: 2,
                sizeOptions: [
                    SizeOption(size: .small, isAvailable: true),
                    SizeOption(size: .medium, isAvailable: false),
                    SizeOption(size: .large, isAvailable: false)
                ],
                image: "expresso", isLike: false),
        
        Product(name: "Americano", price: 2.55,
                sizeOptions: [
                    SizeOption(size: .small, isAvailable: true),
                    SizeOption(size: .medium, isAvailable: true),
                    SizeOption(size: .large, isAvailable: false)
                ],
                image: "americano", isLike: false),
        
        Product(name: "Latte", price: 4,
                sizeOptions: [
                    SizeOption(size: .small, isAvailable: true),
                    SizeOption(size: .medium, isAvailable: true),
                    SizeOption(size: .large, isAvailable: true)
                ],
                image: "latte", isLike: false)
    ]
}
