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

struct MainView: View {
    @State var selectedTab: Tab = .main

    @State private var location: String = "Seoul"
    @State private var temparature: Int = 21
    @State private var weather: String = "Partly Cloudy"
    @State private var high: Int = 23
    @State private var low: Int = 17
    // State는 해당뷰에서만 사용하니까 꼭!꼭!꼭! private

    var body: some View {
        let rows = [GridItem(.flexible())]
        let colors: [Color] = [.black, .blue, .brown, .cyan, .gray, .indigo, .mint, .yellow, .orange, .purple]

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

                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows) {
                        ForEach(colors, id: \.self) { color in
                            HourOfWeatherView()
                                .background(color)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
