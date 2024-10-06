//
//  GradientBar.swift
//  Weather
//
//  Created by 이조은 on 10/7/24.
//

import SwiftUI

struct GradientBar: View {
    let lowTemp: CGFloat
    let highTemp: CGFloat
    @State private var barWidth: CGFloat

    init(lowTemp: Int, highTemp: Int) {
        self.lowTemp = CGFloat(lowTemp)
        self.highTemp = CGFloat(highTemp)
        self.barWidth = CGFloat((highTemp-lowTemp)*7)
    }

    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 2, height: 2))
                .frame(width: 100, height: 4)
            RoundedRectangle(cornerSize: CGSize(width: 2, height: 2))
                .frame(width: barWidth, height: 4)
                .foregroundStyle(LinearGradient(colors: [.blue, .green,.yellow,.orange], startPoint: UnitPoint(x:-(barWidth/100), y:0.0), endPoint: UnitPoint(x:(barWidth/70), y:0.0)))
                .background(.black)
                .offset(x:lowTemp-10,y:0)
        }
    }
}

#Preview {
    GradientBar(lowTemp: 10, highTemp: 25)
}
