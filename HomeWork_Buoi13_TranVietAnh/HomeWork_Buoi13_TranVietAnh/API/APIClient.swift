//
//  APIClient.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//

import Foundation
import Alamofire

typealias APIClient = APIOperation & APIRequest

struct APIResponse<T: Codable>: Codable {
    let data: T
    let status: String
}


protocol APIOperation {
    associatedtype Model : Codable
    func execute(completion : @escaping (Result<Model, Error>) -> Void)
}
extension APIOperation where Self : APIRequest {
    func execute(completion :  @escaping (Result<Model, Error>) -> Void) {
        self.printRequest()
        AF.request(self.request).responseDecodable(of: Model.self) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

