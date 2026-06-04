//
//  AppImages.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation

struct AppImages {

    static let logo = "samaa_logo"

    static var backgroundImage: String {
        switch AppTheme.current {
        case .day:
            return "day_background"
        case .night:
            return "night_background"
        }
    }
}
