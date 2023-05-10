//
//  Profile.swift
//  Landmarks
//
//  Created by 이조은 on 2023/05/10.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "Joni")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌼"
        case summer = "☀️"
        case autumn = "🍁"
        case winter = "❄️"
        
        var id:String { rawValue }
    }
}
