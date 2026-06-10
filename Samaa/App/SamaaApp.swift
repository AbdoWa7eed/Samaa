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
                rootView
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(router)
        }
    }

    @ViewBuilder
    private var rootView: some View {
        switch router.currentScreen {

        case .splash:
            SplashView()

        case .home:
            HomeView()
        }
    }
}
