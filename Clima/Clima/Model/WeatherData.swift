//
//  WeatherData.swift
//  Clima
//
//  Created by niBVL on 13/10/2021.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Float
}

struct Weather: Codable {
    let id: Int
}

