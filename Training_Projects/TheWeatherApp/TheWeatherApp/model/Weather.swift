//
//  Weather.swift
//  TheWeatherApp
//
//  Created by Siddhatech on 14/05/25.
//

import Foundation

struct WeatherAPIResponse: Decodable {
    let current: WeatherData
}

struct WeatherData: Decodable {
    let observation_time: String
    let temperature: Int
    let weather_descriptions: [String]
    let wind_speed: Int
    let pressure: Int
    let precip: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case observation_time
        case temperature
        case weather_descriptions
        case wind_speed
        case pressure
        case precip
        case humidity
    }
}

