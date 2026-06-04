//
//  SplashView.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation
import SwiftUI

struct SplashView: View {

    @State private var animate = false
    @EnvironmentObject private var router: AppRouter

    var body: some View {

        ThemeBackgroundView {
            
            VStack(spacing: 10) {

                Image(AppImages.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .scaleEffect(animate ? 1 : 0.95)
                    .opacity(animate ? 1 : 0.6)
                    .animation(.easeOut(duration: 0.8), value: animate)

                Text(AppStrings.Splash.title)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(AppColors.onPrimary)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 10)
                    .animation(.easeOut(duration: 0.9).delay(0.2), value: animate)

                Text(AppStrings.Splash.subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(AppColors.onSecondary)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 10)
                    .animation(.easeOut(duration: 0.9).delay(0.35), value: animate)
            }
        }
        .onAppear {
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                router.showWeather()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
