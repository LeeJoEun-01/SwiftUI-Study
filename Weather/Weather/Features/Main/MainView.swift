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
    var body: some View {
        ZStack{
            ScrollView{

            }
            Image("MainBG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    MainView()
}
