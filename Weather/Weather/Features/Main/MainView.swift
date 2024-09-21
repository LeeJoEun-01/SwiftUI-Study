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

    @State var location: String = "Seoul"
    @State var temparature: Int = 21
    @State var weather: String = "Partly Cloudy"
    @State var high: Int = 23
    @State var low: Int = 17

    var body: some View {
        ZStack{
            Image("MainBG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ScrollView{
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
            }
        }
    }
}

#Preview {
    MainView()
}
