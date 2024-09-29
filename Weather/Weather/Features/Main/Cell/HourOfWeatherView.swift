//
//  DayOfWeatherView.swift
//  Weather
//
//  Created by 이조은 on 9/29/24.
//

import SwiftUI

struct HourOfWeatherView: View {
    let time: String
    let weatherIcon: String
    let temparature: Int

    init(time: String, weatherIcon: String, temparature: Int) {
        self.time = time
        self.weatherIcon = weatherIcon
        self.temparature = temparature
    }

    var body: some View {
        VStack(spacing: 24) {
            Text("\(time)")
                .font(.system(size: 17))
                .fontWeight(.medium)
            Image(systemName: weatherIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("\(temparature)°")
                .font(.system(size: 22))
                .fontWeight(.medium)
        }.foregroundStyle(.white)
    }
}

#Preview {
    HourOfWeatherView(time: "11PM", weatherIcon: "cloud.sun.fill", temparature: 12).background(.black)
}
