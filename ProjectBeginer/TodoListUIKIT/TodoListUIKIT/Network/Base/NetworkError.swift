//
//  NetworkError.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/8/25.
//

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(Int)
    case custom(String)
}
