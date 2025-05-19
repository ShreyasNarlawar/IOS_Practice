//
//  Country.swift
//  TheWeatherApp
//
//  Created by Shreyas on 13/05/25.
//

import Foundation

struct Country: Identifiable {
    var id: String {name}               // it means id of a country is its name.
    let name: String
}

struct CountryAPIResponse: Codable {     //Use to convert JSON data which comes from api
    let data: [CountryData]
}

struct CountryData: Codable {
    let name: String
}
