//
//  WeatherModel.swift
//  MyWeather
//
//  Created by dgsw8th16 on 12/5/23.
//

import Foundation

struct WeatherModel: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: MainTemp
    let name: String
}

struct Coord: Codable {
    let lon: CGFloat
    let lat: CGFloat
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
}

struct MainTemp: Codable {
    let temp: CGFloat
    let feels_like: CGFloat
    let temp_min: CGFloat
    let temp_max: CGFloat
    let pressure: Int
    let humidity: Int
}

