//
//  CustomTabbarView.swift
//  Weather
//
//  Created by 이조은 on 9/21/24.
//

import SwiftUI

struct TabbarView: View {
    @State var selectedTab: Tab = .main
    var body: some View {
        ZStack{
            switch selectedTab {
            case .main:
                MainView()
            case .map:
                MainView()
            case .list:
                MainView()
            }
            CustomTabbarView(selectedTab: $selectedTab)
                .position(CGPoint(x: UIScreen.main.bounds.width/2, y: 745.0))
        }
    }
}

struct CustomTabbarView: View {
    @Binding var selectedTab: Tab

    var body: some View {

        VStack{
            Divider()
                .background(.white)
                .opacity(0.4)
                .padding(.bottom, 8)
            HStack {
                Button {
                    selectedTab = .map
                } label: {
                    Image("mapIcon")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 27, height: 25)
                }.padding(.leading, 24)

                Spacer()
                Button {
                    selectedTab = .main
                } label: {
                    Image("arrowIcon")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 14, height: 13)
                }
                Button {
                    selectedTab = .main
                } label: {
                    Image("ellipseIcon")
                        .resizable()
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color(red: 0.55, green: 0.58, blue: 0.65))
                        .frame(width: 9, height: 9)
                }
                Spacer()

                Button {
                    selectedTab = .list
                } label: {
                    Image("listIcon")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 26, height: 25)
                }.padding(.trailing, 24)

            }.padding(.bottom, 5)
        }.background(Color(red: 0.16, green: 0.19, blue: 0.25))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TabbarView()
}

// Offset vs padding

