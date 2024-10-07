//
//  DayOfWeatherView.swift
//  Weather
//
//  Created by 이조은 on 10/7/24.
//

import SwiftUI

enum WeatherIcon: String {
    case sun = "sun"
    case rain = "rain"
    case cloud = "cloud"
    case bolt = "bolt"

    var icon: Image {
        switch self {
        case .sun:
            return Image(systemName: "sun.max.fill")
                .symbolRenderingMode(.multicolor)
        case .rain:
            return Image(systemName: "cloud.drizzle.fill")
                .symbolRenderingMode(.multicolor)
        case .cloud:
            return Image(systemName: "cloud.fill")
                .symbolRenderingMode(.multicolor)
        case .bolt:
            return Image(systemName: "cloud.bolt.fill")
                .symbolRenderingMode(.multicolor)
        }
    }
}

struct DayOfWeatherView: View {
    let day: String
    let weatherIcon: WeatherIcon
    let precipitation: Int?
    let lowTemp: Int
    let highTemp: Int

    init(day: String, weatherIcon: WeatherIcon, precipitation: Int?, lowTemp: Int, highTemp: Int) {
        self.day = day
        self.weatherIcon = weatherIcon
        self.precipitation = precipitation
        self.lowTemp = lowTemp
        self.highTemp = highTemp
    }

    var body: some View {
        HStack {
            HStack() {
                Text("\(day)")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                Spacer()
            }
            VStack {
                weatherIcon.icon
                    .resizable()
                    .frame(width: 26, height: 26)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 8)
                if precipitation ?? 0 != 0 {
                    Text("\(precipitation ?? 0)%")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(red: 0.51, green: 0.81, blue: 0.98))
                        .offset(x:0.0, y:-2.0)
                        .padding(.bottom, 4)
                }
            }
            Text("\(lowTemp)°")
                .font(.system(size: 22))
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .opacity(0.3)
                .padding(.leading, 6)
            // 폴더 구조 (view VS component)
            GradientBar(lowTemp: lowTemp, highTemp: highTemp)
                .padding(.leading, 4)
            Text("\(highTemp)°")
                .font(.system(size: 22))
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .padding(.leading, 4)

        }
        .frame(width: 305, height: 55)
        .overlay(
                Divider()
                .background(.white)
                .opacity(0.5)
                .offset(x:0, y:-26)
            )
    }
}

#Preview {
    DayOfWeatherView(day: "Today", weatherIcon: .cloud, precipitation: 0, lowTemp: 12, highTemp: 22)
        .background(.gray)
}
