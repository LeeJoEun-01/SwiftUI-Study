//
//  DayOfWeatherView.swift
//  Weather
//
//  Created by 이조은 on 10/7/24.
//

import SwiftUI

enum WeatherIcon {
    case sun
    case rain
    case cloud
    case bolt

    var Icon: Image {
        switch self {
        case .sun:
            return Image("sun.max.fill")
                .resizable()
                .foregroundStyle(.yellow) as! Image
        case .rain:
            return Image("sun.max.fill")
                .resizable()
                .foregroundStyle(.yellow) as! Image
        case .cloud:
            return Image("sun.max.fill")
                .resizable()
                .foregroundStyle(.yellow) as! Image
        case .bolt:
            return Image("sun.max.fill")
                .resizable()
                .foregroundStyle(.yellow) as! Image
        }
    }
}

struct DayOfWeatherView: View {
    let day: String
    let weatherIcon: String
    let precipitation: Int?
    let lowTemp: Int
    let highTemp: Int

    init(day: String, weatherIcon: String, precipitation: Int?, lowTemp: Int, highTemp: Int) {
        self.day = day
        self.weatherIcon = weatherIcon
        self.precipitation = precipitation ?? 0
        self.lowTemp = lowTemp
        self.highTemp = highTemp
    }

    var body: some View {
        HStack {
            Text("\(day)")
                .font(.system(size: 22))
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .frame(width: 60)
            Image(systemName: "\(weatherIcon)")
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundStyle(.yellow)
                .padding(.leading, 4)
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

        }.frame(width: 325, height: 55)
            .overlay(            
                Divider()
                .background(.white)
                .offset(x:0, y:-26)
            )
    }
}

#Preview {
    DayOfWeatherView(day: "Mon", weatherIcon: "sun.max.fill", precipitation: 0, lowTemp: 12, highTemp: 22)
        .background(.gray)
}
