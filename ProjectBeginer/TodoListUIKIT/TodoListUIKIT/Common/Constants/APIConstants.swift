//
//  APIConstants.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/8/25.
//
import Foundation
enum APIConstants {
    static let baseURL = "http://localhost:8080"
    static let timeoutInterval: TimeInterval = 30
    
    enum Headers {
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
    }
}
