//
//  AppRouter.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation
import SwiftUI

enum AppScreen {
    case splash
    case weather
}


final class AppRouter: ObservableObject {
    @Published private(set) var currentScreen: AppScreen = .splash

    func showWeather() {
        currentScreen = .weather
    }
}
