//
//  MetricsGridView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation
import SwiftUI


struct MetricsGridView: View {

    let visibilityKm: Double
    let humidity: Int
    let feelsLikeC: Double
    let pressureMb: Double

    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]

        LazyVGrid(columns: columns, spacing: 16) {
            MetricTileView(
                icon: AppImages.Icons.visibility,
                label: AppStrings.Weather.visibility,
                value: "\(Int(visibilityKm)) \(AppStrings.Weather.km)",
                subtitle: visibilityKm >= 10
                    ? AppStrings.Weather.clearView
                    : AppStrings.Weather.reducedVisibility
            )
            MetricTileView(
                icon: AppImages.Icons.humidity,
                label: AppStrings.Weather.humidity,
                value: "\(humidity)\(AppStrings.Weather.percent)",
                subtitle: humidity > 70
                    ? AppStrings.Weather.feelsHumid
                    : AppStrings.Weather.comfortable
            )
            MetricTileView(
                icon: AppImages.Icons.feelsLike,
                label: AppStrings.Weather.feelsLike,
                value: "\(Int(feelsLikeC))\(AppStrings.Weather.celsius)",
                subtitle: feelsLikeC > 0
                    ? AppStrings.Weather.warmerThanActual
                    : AppStrings.Weather.closeToActual
            )
            MetricTileView(
                icon: AppImages.Icons.pressure,
                label: AppStrings.Weather.pressure,
                value: "\(Int(pressureMb)) \(AppStrings.Weather.mb)",
                subtitle: AppStrings.Weather.mb
            )
        }
    }
}
