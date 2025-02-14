//
//  Todo.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/8/25.
//
import Foundation
struct Todo: Codable {
    let id: Int32
    let userId: Int32
    let title: String
    let description: String?
    let priority: String
    let deadline: Date?
    let createdAt: Date?
    let status: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case title
        case description
        case priority
        case deadline
        case createdAt = "created_at"
        case status
    }
}
