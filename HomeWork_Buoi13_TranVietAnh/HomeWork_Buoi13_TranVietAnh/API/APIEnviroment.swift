//
//  APIEnviroment.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//
//https://cataas.com/cat/says/hello?fontSize=50&fontColor=red
//https://cataas.com/api/cats
//https://api.thecatapi.com/v1/images/search?limit=10
//https://dogapi.dog/api/v2/breeds
//https://dogapi.dog/api/v2/breeds/12
//https://digidates.de/api/v1/germanpublicholidays?year=2023&region=de

import Foundation
protocol APIEnvironment {
    var baseURL: String { get }
    var timeout: TimeInterval { get }
    var headers: [String: String] { get }
    var apiKey: String { get }
}

struct CatApiEnviroment: APIEnvironment {
    var baseURL: String {
        return "https://cataas.com"
    }
    var timeout: TimeInterval {
        return 30
    }
    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    var apiKey: String {
        return ""
    }
}
struct DogApiEnviroment: APIEnvironment {
    var baseURL: String {
        return "https://dogapi.dog/api/v2"
    }
    var timeout: TimeInterval {
        return 30
    }
    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    var apiKey: String {
        return ""
    }
}
struct HolidayApiEnviroment: APIEnvironment {
    var baseURL: String {
        return "https://digidates.de/api/v1/germanpublicholidays"
    }
    var timeout: TimeInterval {
        return 30
    }
    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    var apiKey: String {
        return ""
    }
}
