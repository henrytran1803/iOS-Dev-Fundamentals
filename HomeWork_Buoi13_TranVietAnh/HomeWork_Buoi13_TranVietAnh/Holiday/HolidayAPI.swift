//
//  HolidayAPI.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//


import Foundation
import Alamofire

struct HolidayAPI: APIClient {
    var enviroment:  APIEnvironment {
        return HolidayApiEnviroment()

    }
    
    
    
    typealias Model = [String: String]

    var year: Int
    var region: String

  
    var path: String {
        return ""
    }

    var method: HTTPMethod {
        return .get
    }

    var params: [String : Any] {
        return [
            "year": year,
            "region": region
        ]
    }
}
