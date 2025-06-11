//
//  CatAPI.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//

import Foundation
import Alamofire
struct CatAPI : APIClient {
    
    typealias Model = [CatEntity]
    

    var params: [String : Any] = [:]
    
    var _params: [String : Any] {
        return params
    }
    
    var enviroment:  APIEnvironment {
        return CatApiEnviroment()
    }
    
    var path: String {
        return "api/cats"
    }
    
    
    var method: HTTPMethod{
        return .get
    }
    
}
