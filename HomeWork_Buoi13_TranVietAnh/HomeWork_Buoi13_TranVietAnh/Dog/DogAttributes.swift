//
//  DogAttributes.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//


import Foundation

struct DogAttributes: Codable {
    let name: String
    let description: String
    let life: LifeSpan
    let maleWeight: Weight
    let femaleWeight: Weight
    let hypoallergenic: Bool

    enum CodingKeys: String, CodingKey {
        case name, description, life
        case maleWeight = "male_weight"
        case femaleWeight = "female_weight"
        case hypoallergenic
    }

    struct LifeSpan: Codable {
        let min: Int
        let max: Int
    }

    struct Weight: Codable {
        let min: Int
        let max: Int
    }
}
