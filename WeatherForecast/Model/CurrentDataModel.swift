//
//  CurrentDataModel.swift
//  WeatherForecast
//
//  Created by Ramanathan, Sathish Kumar (Cognizant) on 04/05/23.
//

import Foundation

// MARK: - CurrentDayWeatherData
struct CurrentDayWeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelslike, tempmin, tempmax: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelslike = "feels_like"
        case tempmin = "temp_min"
        case tempmax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let country: String
    let type, id, sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case description = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
