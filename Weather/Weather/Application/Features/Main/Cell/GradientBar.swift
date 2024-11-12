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
            Rectangle()
                .frame(width: 100, height: 4)
                .background(.black)
            RoundedRectangle(cornerSize: CGSize(width: 2, height: 2))
                .frame(width: 100, height: 4)
                .foregroundStyle(LinearGradient(colors: [.blue, .green,.yellow,.orange], startPoint: .leading, endPoint: .trailing))
                .mask(
                    RoundedRectangle(cornerSize: CGSize(width: 2, height: 2))
                        .frame(width: barWidth, height: 4)
                )
        }.clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
    }
}

#Preview {
    GradientBar(lowTemp: 18, highTemp: 25)
}
