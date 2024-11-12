//
//  MainFeature.swift
//  Weather
//
//  Created by 이조은 on 10/26/24.
//

import SwiftUI

import ComposableArchitecture

struct CurrentWeatherInfo: Equatable {
    let location: String
    let temperature: Int
    let weatherInfo: String
    let high: Int
    let low: Int
}

@Reducer
struct WeatherReducer {
    @ObservableState
    struct State {
        var currentWeatherInfo: CurrentWeatherInfo? = nil
    }

    enum Action {
        case onAppear
        case currentWeatherResponse(Result<CurrentWeather, Error>)
    }

    // Dependency 선언해서 키패스 사용
    @Dependency(\.weatherClient) var weatherClient

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    await send(.currentWeatherResponse(Result {
                        let result = try await weatherClient.requestCurrentWeather()
                        return result
                    }))
                }

            case .currentWeatherResponse(.success(let result)):
                print("=== currentWeatherResponse Success 🌟")
                if let interval = result.data.timelines.first?.intervals.first {
                       let weatherInfo = CurrentWeatherInfo(
                           location: "Seoul",
                           temperature: Int(interval.values.temperature),
                           weatherInfo: "Clear",
                           high: Int(interval.values.temperatureMax),
                           low: Int(interval.values.temperatureMin)
                       )
                       state.currentWeatherInfo = weatherInfo
                   }
                return .none

            case .currentWeatherResponse(.failure(let error)):
                print("LocationListReducer: Failure \(error.localizedDescription)")
                return .none
            }
        }
    }
}

