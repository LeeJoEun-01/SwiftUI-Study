//
//  StudyView.swift
//  Weather
//
//  Created by 이조은 on 9/23/24.
//

import SwiftUI

struct StudyView: View {
    var body: some View {
//        ZStack {
//            Image(systemName: "heart")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .foregroundStyle(.red)
//                .frame(width: 50, height: 50)
//                .padding(.top, 50)
//                .offset(x:20, y: 30)
//
//            Image(systemName: "heart")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 50)
//                .padding(.top, 50)
//                .position(CGPoint(x: 100.0, y: 100.0))
//        }

        VStack {
            // 1.
            Text("ABCDEFG")
                .padding(.bottom, 15)
            // 2.
            Text("ABCDEFG")
                .padding([.leading, .bottom], 15)
            // 3.
            Text("ABCDEFG")
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 0))
            // 4
            Text("ABCDEFG")
        }

    }
}

#Preview {
    StudyView()
}
