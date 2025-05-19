//
//  CountryInfo.swift
//  TheWeatherApp
//
//  Created by Siddhatech on 19/05/25.
//

import Foundation

struct CountryInfo: Codable {
    let country_name: String
    let capital: String
    let region: String
    let subregion: String
    let population: Int
    let area: Double
    let currency: Currency
    let languages: [String]
    let timezones: [String]
    let flag: String
}

struct Currency: Codable {
    let code: String
    let name: String
}
