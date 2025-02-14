//
//  BaseEndpoint.swift
//  TodoListUIKIT
//
//  Created by henrytran1803 on 2/8/25.
//

enum BaseEndpoint: Endpoint {
    case register(username: String, email: String, password: String)
    case getUser(id: Int)
    case createTodo(userId: Int, title: String, description: String?, priority: String)
    case getTodo(id: Int)
    case updateTodo(id: Int, status: Bool)
    case deleteTodo(id: Int)
    case listTodos(userId: Int)
    
    var path: String {
        switch self {
        // Auth
        case .register: return "/users"
        
        // User
        case .getUser(let id): return "/users/\(id)"
        
        // Todo
        case .createTodo: return "/todos"
        case .getTodo(let id): return "/todos/\(id)"
        case .updateTodo(let id, _): return "/todos/\(id)/status"
        case .deleteTodo(let id): return "/todos/\(id)"
        case .listTodos(let userId): return "/todos/user/\(userId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case  .register, .createTodo:
            return .post
        case .updateTodo:
            return .patch
        case .deleteTodo:
            return .delete
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
            
        case .register(let username, let email, let password):
            return ["username": username, "email": email, "password": password]
            
        case .createTodo(let userId, let title, let description, let priority):
            var params: [String: Any] = [
                "user_id": userId,
                "title": title,
                "priority": priority
            ]
            if let description = description {
                params["description"] = description
            }
            return params
        case .updateTodo(let id, let status):
            return ["status": status]
        default:
            return nil
        }
    }
    
    var headers: [String: String]? {
        var headers = [String: String]()
        headers[APIConstants.Headers.contentType] = "application/json"
//        
//        // Add auth token if available
//        if let token = AuthManager.shared.token {
//            headers[APIConstants.Headers.authorization] = "Bearer \(token)"
//        }
        
        return headers
    }
}
