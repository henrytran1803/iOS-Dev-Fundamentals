//
//  Endpoint.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/8/25.
//

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}
