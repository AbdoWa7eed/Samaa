//
//  AppTheme.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation

enum AppTheme {
    case day
    case night

    static var current: AppTheme {
        let hour = Calendar.current.component(.hour, from: Date())
        return (hour >= 5 && hour < 18) ? .day : .night
    }
}
