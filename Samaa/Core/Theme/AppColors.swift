//
//  Core.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation
import SwiftUI

struct AppColors {

    static var primary: Color {
        switch AppTheme.current {
        case .day:
            return dayBackground
        case .night:
            return nightBackground
        }
    }

    static var onPrimary: Color {
        switch AppTheme.current {
        case .day:
            return dayText
        case .night:
            return nightText
        }
    }

    static var onSecondary: Color {
        switch AppTheme.current {
        case .day:
            return daySecondaryText
        case .night:
            return nightSecondaryText
        }
    }


    private static let dayBackground = Color(hex: "F0F4FF")
    private static let nightBackground = Color(hex: "0B1020")

    private static let dayText = Color(hex: "1A1C2E")
    private static let nightText = Color(hex: "F0F4FF")

    private static let daySecondaryText = Color(hex: "4A5568")
    private static let nightSecondaryText = Color(hex: "8BA3C7")
}
