//
//  CircleImage.swift
//  Landmarks
//
//  Created by 이조은 on 2023/03/15.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .resizable()
            .frame(width: 200, height: 200)
            //.scaledToFit()
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
