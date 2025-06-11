//
//  CatImageAPI.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//

import Alamofire


struct CatImageAPI: APIRequest {
    var enviroment: APIEnvironment {
        return CatApiEnviroment()
    }

    var path: String {
        return "cat/says/hello"
    }

    var method: HTTPMethod {
        return .get
    }

    var params: [String : Any] {
        return ["fontSize": 50, "fontColor": "red"]
    }

    var encoding: any ParameterEncoding {
        return URLEncoding.default
    }

    var headers: [String : String] {
        return ["Content-Type": "application/json"]
    }

    var request: URLRequest {
        let originalRequest = try! URLRequest(url: fullURL, method: method, headers: HTTPHeaders(headers))
        let encoded = try! encoding.encode(originalRequest, with: params)
        return encoded
    }
}
