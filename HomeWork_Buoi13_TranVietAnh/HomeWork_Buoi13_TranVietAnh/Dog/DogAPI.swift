//
//  DogAPI.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//


import Foundation
import Alamofire

struct DogAPI: APIClient {
    var enviroment:  APIEnvironment {
        return DogApiEnviroment()
    }
    

    typealias Model = DogEntity
    var dogID: String? = nil

    var path: String {
        if let id = dogID {
            return "breeds/\(id)"
        } else {
            return "breeds"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var params: [String : Any] {
        return [:]
    }
}
