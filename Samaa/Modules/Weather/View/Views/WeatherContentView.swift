//
//  WeatherContentView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import Foundation
import SwiftUI

struct WeatherContentView: View {

    let weather: WeatherEntity

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                NavigationLink(destination: HourlyView(day: weather.forecast[0])) {
                    WeatherHeroView(weather: weather)
                }
                .buttonStyle(PlainButtonStyle())

                ForecastCardView(days: weather.forecast)
                    .padding(.horizontal, 20)

                MetricsGridView(
                    visibilityKm: weather.visibilityKm,
                    humidity: weather.humidity,
                    feelsLikeC: weather.feelsLikeC,
                    pressureMb: weather.pressureMb
                )
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 32)
        }
    }
}
