//
//  APIRequest.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//

import Foundation
import Alamofire
protocol APIRequest {
    var enviroment: APIEnvironment { get }
    var path: String { get }
    var encoding : ParameterEncoding { get }
    var method: HTTPMethod { get }
    var params: [String: Any] { get }
    var headers: [String: String] { get }
    var request: URLRequest { get }
}

extension APIRequest {
    var fullURL: URL {
        guard let url = URL(string: enviroment.baseURL ) else {
            fatalError("Invalid base URL")
        }
        guard !path.isEmpty else {
            
            return url
        }
        return url.appendingPathComponent(path)
    }
    
    var headers: [String: String] {
        return enviroment.headers
    }
    
    var params: [String: Any]{
        return [:]
    }
    
    var request: URLRequest{
        
        let originalRequest = try? URLRequest(url: fullURL, method: method, headers: HTTPHeaders(headers))
        
        guard let originalRequest = originalRequest else {
            return URLRequest(url: fullURL)
        }
        
        let encodeRequest = try? encoding.encode(originalRequest, with: params)
        guard let unwrappedEncodeRequest = encodeRequest else {
            fatalError("cant not unwrap encodeRequest")
        }
        return unwrappedEncodeRequest
    }
    var encoding: any ParameterEncoding {
        return URLEncoding.default
    }
        
    func printRequest(){
        print("Method : \(method)")
        print("Headers : \(headers)")
        print("Params : \(params)")
        print("Full Request :\(fullURL) ")
        print("request : \(request)")
    }
}
