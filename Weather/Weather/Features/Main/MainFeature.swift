//
//  MainFeature.swift
//  Weather
//
//  Created by 이조은 on 10/26/24.
//

import Foundation
import SwiftUI
import Combine

import ComposableArchitecture

struct CurrentWeather: Equatable {
    let weatherCode: Int
    let temperature, temperatureMax, temperatureMin: Double
}

@Reducer
struct MainFeature {
    @ObservableState
    struct State: Equatable {
        var currentWeather: CurrentWeather?
    }

    enum Action {
        case viewDidAppear
        case currentWeatherResponse(CurrentWeather)
        case hourOfWeatherResponse
        case dayOfWeatherResponse
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .viewDidAppear:
                return .run { send in
                    let result = await requestAPI()
                    if result != nil {
                        await send(.currentWeatherResponse(result!))
                    }
                }
            case let .currentWeatherResponse(result):
                state.currentWeather = result
                print("===== Result =====")
                print(state.currentWeather!)
                return .none
            case .hourOfWeatherResponse:
                return .none
            case .dayOfWeatherResponse:
                return .none
            }
        }
    }

    func requestAPI() async -> CurrentWeather? {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKEY") as? String ?? ""

        do {
            let parameters = [
              "location": "37.33, 127.01",
              "fields": ["temperature", "temperatureMax", "temperatureMin", "weatherCode"],
              "units": "metric",
              "timesteps": ["1d"],
              "startTime": "now",
              "endTime": "nowPlus1d",
              "timezone": "Asia/Seoul"
            ] as [String : Any?]

            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])

            let url = URL(string: "https://api.tomorrow.io/v4/timelines")!
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            let queryItems: [URLQueryItem] = [
              URLQueryItem(name: "apikey", value: apiKey),
            ]
            components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

            var request = URLRequest(url: components.url!)
            request.httpMethod = "POST"
            request.timeoutInterval = 10
            request.allHTTPHeaderFields = [
              "accept": "application/json",
              "Accept-Encoding": "gzip",
              "content-type": "application/json"
            ]
            request.httpBody = postData

            let (data, _) = try await URLSession.shared.data(for: request)

            let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // 날짜 디코딩 전략 설정

            let result = try decoder.decode(Weather.self, from: data)
            print(" === Decoded CurrentWeather 🌤️ ===")
            print(result)
            print(" === Decoded CurrentWeather 😄 ===")
            print(result.data.timelines.first?.intervals.first)
            if let firstInterval = result.data.timelines.first?.intervals.first {
                // Initialize CurrentWeather using values from the first interval
                let currentWeather = CurrentWeather(
                    weatherCode: firstInterval.values.weatherCode,
                    temperature: firstInterval.values.temperature,
                    temperatureMax: firstInterval.values.temperatureMax,
                    temperatureMin: firstInterval.values.temperatureMin
                )
                return currentWeather
            }

        } catch {
            print("Error occurred: \(error)")
        }
        return nil
    }
}

