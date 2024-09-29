//
//  DayOfWeatherView.swift
//  Weather
//
//  Created by 이조은 on 9/29/24.
//

import SwiftUI

struct HourOfWeatherView: View {
    @State private var time: String = "12PM"
    @State private var weatherIcon: String = "cloud"
    @State private var temparature: String = "12"

    var body: some View {
        VStack(spacing: 24) {
            Text("\(time)")
            Image(systemName: weatherIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("\(temparature)°")
        }.foregroundStyle(.white)
    }
}

#Preview {
    HourOfWeatherView().background(.black)
}
