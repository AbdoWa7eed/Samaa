//
//  WeatherHeroView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct WeatherHeroView: View {

    let weather: WeatherEntity

    var body: some View {
        VStack(spacing: 8) {
            Text(weather.location)
                .font(.system(size: 32, weight: .semibold))
                .foregroundColor(AppColors.onPrimary)

            Text("\(Int(weather.tempC))")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(AppColors.onPrimary)
                .overlay(alignment: .topTrailing) {
                    Text("°")
                        .font(.system(size: 36, weight: .light))
                        .foregroundColor(AppColors.onPrimary)
                        .offset(x: 20, y: 8)
                }

            ConditionBadgeView(text: weather.conditionText, iconUrl: weather.conditionIconUrl)

            tempRangeRow
        }
        .padding(.top, 16)
    }


    private var tempRangeRow: some View {
        HStack(spacing: 12) {
            TempPillView(
                icon: AppImages.Icons.highTemp,
                label: "High",
                value: "\(Int(weather.forecast.first?.maxTempC ?? 0))°",
                color: AppColors.highTempColor
            )
            TempPillView(
                icon: AppImages.Icons.lowTemp,
                label: "Low",
                value: "\(Int(weather.forecast.first?.minTempC ?? 0))°",
                color: AppColors.lowTempColor
            )
        }
        .padding(.top, 4)
    }
}
