//
//  WeatherClient.swift
//  Weather
//
//  Created by 이조은 on 11/11/24.
//

import Foundation

import ComposableArchitecture

// MARK: - Network

enum NetworkMethod: String {
    case get = "GET"
    case post = "POST"
}

// MARK: - API client interface
// 인터페이스를 실제 구현과 분리된 모듈에 두면, 검색 기능이 인터페이스만 참조하여 컴파일 시간을 단축할 수 있다.

@DependencyClient
struct WeatherClient {
    var requestCurrentWeather: @Sendable () async throws -> CurrentWeather

    let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKEY") as? String ?? ""

    static func request<T: Codable>(
        url urlString: String,
        method httpMethod: NetworkMethod,
        queryItems: [URLQueryItem]? = nil,
        type: T.Type
    ) async throws -> T {

        let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKEY") as? String ?? ""
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

        let url = URL(string: "https://api.tomorrow.io/v4/\(urlString)")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "apikey", value: apiKey),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Accept-Encoding": "gzip",
          "content-type": "application/json"
        ]
        request.httpBody = postData

        let (data, _) = try await URLSession.shared.data(for: request)
        print("=== API 통신 결과 📡 ===")
        print(String(decoding: data, as: UTF8.self))

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            let result = try decoder.decode(T.self, from: data)
            print("=== ✅ 디코딩 성공 ===")
            print(result)
            return result
        } catch {
            print("=== ❌ 디코딩 실패:", error)
            throw NSError(domain: "WeatherClient", code: 1, userInfo: [:])
        }
    }
}

extension DependencyValues {
    var weatherClient: WeatherClient {
        get { self[WeatherClient.self] }
        set { self[WeatherClient.self] = newValue}
    }
}

// MARK: - Live API implementation

extension WeatherClient: DependencyKey {
    static let liveValue: WeatherClient = Self(
        requestCurrentWeather: { 
            let result = try await request(
                url: "timelines",
                method: .post,
                type: CurrentWeather.self
            )
            return result
        }
    )
}

// MARK: - Mock Data

//extension WeatherClient: TestDependencyKey {
//    static let previewValue = Self(
//        forecast: { _ in .mock }
//    )
//
//    static let testValue = Self()
//}


// MARK: - Private helpers

