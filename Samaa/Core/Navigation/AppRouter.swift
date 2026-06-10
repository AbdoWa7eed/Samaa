//
//  AppRouter.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import SwiftUI

final class AppRouter: ObservableObject {

    enum AppScreen {
        case splash
        case home
    }

    @Published var currentScreen: AppScreen = .splash

    func showHome() {
        currentScreen = .home
    }
}
