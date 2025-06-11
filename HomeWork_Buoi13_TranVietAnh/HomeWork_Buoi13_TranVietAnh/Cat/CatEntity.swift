//
//  CatEntity.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//

import Foundation
//{
//    "id": "04eEQhDfAL8l5nt3",
//    "tags": [
//        "two",
//        "double",
//        "black"
//    ],
//    "mimetype": "image/jpeg",
//    "createdAt": "2022-07-18T11:28:29.596Z"
//},
struct CatEntity: Codable {
    var id: String
    var tags: [String]
    var mimetype: String
    var createdAt: String
}
