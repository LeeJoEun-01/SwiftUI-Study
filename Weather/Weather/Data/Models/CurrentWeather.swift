//
//  CurrentWeather.swift
//  Weather
//
//  Created by 이조은 on 10/27/24.
//

// MARK: - API Model

import Foundation

// MARK: - CurrentWeather
struct CurrentWeather: Codable, Equatable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable, Equatable {
    let timelines: [Timeline]
}

// MARK: - Timeline
struct Timeline: Codable, Equatable {
    let timestep: String
    let endTime, startTime: Date
    let intervals: [Interval]
}

// MARK: - Interval
struct Interval: Codable, Equatable {
    let startTime: Date
    let values: Values
}

// MARK: - Values
struct Values: Codable, Equatable {
    let weatherCode: Int
    let temperature, temperatureMax, temperatureMin: Double
}


//{
//  "data": {
//    "timelines": [
//      {
//        "timestep": "1d",
//        "endTime": "2024-11-12T11:00:00Z",
//        "startTime": "2024-11-10T11:00:00Z",
//        "intervals": [
//          {
//            "startTime": "2024-11-10T11:00:00Z",
//            "values": {
//              "temperature": 14.5,
//              "temperatureMax": 14.5,
//              "temperatureMin": -2.81,
//              "weatherCode": 1001
//            }
//          },
//          {
//            "startTime": "2024-11-11T11:00:00Z",
//            "values": {
//              "temperature": 18.98,
//              "temperatureMax": 18.98,
//              "temperatureMin": 8.24,
//              "weatherCode": 1000
//            }
//          },
//          {
//            "startTime": "2024-11-12T11:00:00Z",
//            "values": {
//              "temperature": 8.86,
//              "temperatureMax": 8.86,
//              "temperatureMin": 1.22,
//              "weatherCode": 1000
//            }
//          }
//        ]
//      }
//    ]
//  }
//}
