//
//  Core.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation
import SwiftUI

struct AppColors {

    static var onPrimary: Color {
        AppTheme.current == .day ? dayText : nightText
    }

    static var onSecondary: Color {
        AppTheme.current == .day ? daySecondaryText : nightSecondaryText
    }

    static var cardBackground: Color {
        AppTheme.current == .day
            ? Color.white.opacity(0.25)
            : Color.white.opacity(0.08)
    }

    static var cardBorder: Color {
        AppTheme.current == .day
            ? Color.white.opacity(0.4)
            : Color.white.opacity(0.15)
    }

    static var cardDivider: Color {
        AppTheme.current == .day
            ? Color.black.opacity(0.1)
            : Color.white.opacity(0.08)
    }

    static var tileBackground: Color {
        AppTheme.current == .day
            ? Color.white.opacity(0.25)
            : Color.white.opacity(0.07)
    }

    static var conditionBadgeBackground: Color {
        AppTheme.current == .day
            ? Color.black.opacity(0.08)
            : Color.white.opacity(0.1)
    }

    static let highTempColor = Color(hex: "FF4B4B")
    static let lowTempColor = Color(hex: "4B9EFF")

    private static let dayText = Color(hex: "1A1C2E")
    private static let nightText = Color(hex: "F0F4FF")

    private static let daySecondaryText = Color(hex: "4A5568")
    private static let nightSecondaryText = Color(hex: "8BA3C7")
}
