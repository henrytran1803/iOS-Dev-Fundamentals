//
//  User.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/8/25.
//

import Foundation
//struct User: Codable {
//    let id: Int32
//    let username: String
//    let email: String
//    let password: String
//    let createdAt: Date?
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case username
//        case email
//        case password
//        case createdAt = "created_at"
//    }
//}
struct TimeData: Codable {
    let Time: String
    let Valid: Bool
}

// Tạo struct chính cho User
struct User: Codable {
    let id: Int
    let username: String
    let email: String
    let password: String
    let created_at: TimeData
    
    // Nếu muốn dùng camelCase thay vì snake_case
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case password
        case created_at = "created_at" // Map từ snake_case sang camelCase
    }
}
