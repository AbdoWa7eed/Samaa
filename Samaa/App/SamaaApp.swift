//
//  SamaaApp.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import SwiftUI

@main
struct SamaaApp: App {

    @StateObject private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch router.currentScreen {
                    case .splash: SplashView().hiddenNavigationBar()
                    case .weather: WeatherView().hiddenNavigationBar()
                }
            }
            .navigationViewStyle(.stack)
            .environmentObject(router)
        }
    }
}
