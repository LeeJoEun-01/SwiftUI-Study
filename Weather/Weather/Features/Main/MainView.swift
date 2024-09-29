//
//  MainView.swift
//  Weather
//
//  Created by 이조은 on 9/21/24.
//

import SwiftUI

enum Tab {
    case main
    case map
    case list
}

struct hourOfWeather: Hashable {
    let id = UUID() // 고유 ID
    let time: String
    let iconName: String
    let temparature: Int
}

struct MainView: View {
    @State var selectedTab: Tab = .main

    @State private var location: String = "Seoul"
    @State private var temparature: Int = 21
    @State private var weather: String = "Partly Cloudy"
    @State private var high: Int = 23
    @State private var low: Int = 17
    // State는 해당뷰에서만 사용하니까 꼭!꼭!꼭! private

    @State private var dummyData: [hourOfWeather] = [hourOfWeather(time: "Now", iconName: "sun.max.fill", temparature: 12),
                                                     hourOfWeather(time: "1PM", iconName: "cloud.drizzle.fill", temparature: 12),
                                                     hourOfWeather(time: "2PM", iconName: "cloud.fill", temparature: 14),
                                                     hourOfWeather(time: "3PM", iconName: "cloud.snow.fill", temparature: 14),
                                                     hourOfWeather(time: "4PM", iconName: "cloud.bolt.fill", temparature: 15),
                                                     hourOfWeather(time: "5PM", iconName: "cloud.moon.fill", temparature: 13),
                                                     hourOfWeather(time: "6PM", iconName: "cloud.sun.fill", temparature: 12),
                                                     hourOfWeather(time: "7PM", iconName: "cloud.hail.fill", temparature: 11)]

    var body: some View {
        let rows = [GridItem(.flexible())]

        ZStack{
            Image("MainBG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical) {
                Text(location)
                    .font(.system(size: 37))
                    .foregroundStyle(.white)
                    .padding(.top, 34)

                Text("\(temparature)°")
                    .font(.system(size: 102))
                    .fontWeight(.thin)
                    .foregroundStyle(.white)

                Text(weather)
                    .font(.system(size: 24))
                    .foregroundStyle(.white)

                HStack(spacing: 12, content: {
                    Text("H:\(high)°")
                        .font(.system(size: 21))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                    Text("L:\(low)°")
                        .font(.system(size: 21))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                })

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(.white.opacity(0.1), lineWidth: 1)
                        .foregroundStyle(.clear)
                        .frame(height: 212)
                        .padding(.top, 44)
                        .padding([.leading,.trailing], 20)
                    VStack {
                        Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                            .padding(.top, 40)
                        Divider()
                            .background(.white)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: rows, spacing: 30) {
                                ForEach(dummyData, id: \.id) { data in
                                    HourOfWeatherView(time: data.time, weatherIcon: data.iconName, temparature: data.temparature)
                                }
                            }
                        }.padding([.leading,.trailing], 3)
                            .frame(height: 120)

                    }.padding([.leading,.trailing], 34)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
