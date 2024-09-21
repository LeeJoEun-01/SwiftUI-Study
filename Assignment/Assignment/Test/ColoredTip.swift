//
//  ColoredTip.swift
//  Assignment
//
//  Created by 이조은 on 2/19/24.
//

import Foundation
import TipKit

struct ColoredTip: Tip {
    var title: Text {
        Text("Colored Tip Title")
            .bold()
            .foregroundStyle(.purple)
    }

    // Text needs to be optional, otherwise it does not show up.
    var message: Text? {
        Text("This is the message for the Colored Tip")
    }

    var image: Image? {
        Image(systemName: "heart")
    }
}


struct BackgroundColoredTip: Tip {
    var title: Text {
        Text("Colored Tip Title")
            .bold()
            .foregroundStyle(.white)
    }

    // Text needs to be optional, otherwise it does not show up.
    var message: Text? {
        Text("This is the message for the Colored Tip")
            .foregroundStyle(.white)
    }

    var image: Image? {
        Image(systemName: "heart")
    }
}
