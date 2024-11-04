//
//  CurrentWeather.swift
//  Weather
//
//  Created by 이조은 on 10/27/24.
//

import Foundation

// MARK: - CurrentWeather
struct Weather: Decodable, Equatable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable, Equatable {
    let timelines: [Timeline]
}

// MARK: - Timeline
struct Timeline: Decodable, Equatable {
    let timestep: String
    let endTime, startTime: Date
    let intervals: [Interval]
}

// MARK: - Interval
struct Interval: Decodable, Equatable {
    let startTime: Date
    let values: Values
}

// MARK: - Values
struct Values: Decodable, Equatable {
    let weatherCode: Int
    let temperature, temperatureMax, temperatureMin: Double
}
