//
//  City.swift
//  TheWeatherApp
//
//  Created by Shreyas on 14/05/25.
//
struct Cities: Identifiable, Codable{
    var id: String { name }
    let name: String
}

struct CitiesAPIResponse: Codable{
    let data: [String]
    let msg: String
    let error: Bool
}
