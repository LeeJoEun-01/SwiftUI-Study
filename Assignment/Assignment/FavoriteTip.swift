//
//  FavoriteTip.swift
//  Assignment
//
//  Created by 이조은 on 2/19/24.
//

import SwiftUI
import TipKit

struct FavoriteTip: Tip {

    @Parameter
    static var isfollwing: Bool = false

    var title: Text {
            Text("Save as a Favorite")
        }

    var message: Text {
        Text("Your favorite backyards always appear at the top of the list.")
    }

    var asset: Image {
        Image(systemName: "star")
    }

    var actions: [Action] {
        [
            Tip.Action(
                id: "learn-more",
                title: "Learn More"
            )
        ]
    }

    var rules: [Rule] {
        // User is logged in
        #Rule(Self.$isfollwing) { $0 == false }
    }
}
