//
//  States.swift
//  TheWeatherApp
//
//  Created by Shreyas on 13/05/25.
//
import Foundation

struct States: Identifiable, Codable{
    var id: String { name }
    let name: String
}

struct StatesAPIResponse: Codable{
    let data: StatesData
}

struct StatesData: Codable{
    let states: [States]
}
