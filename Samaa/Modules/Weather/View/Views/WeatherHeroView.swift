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

            Text("\(Int(weather.tempC))°")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(AppColors.onPrimary)

            conditionBadge

            tempRangeRow
        }
        .padding(.top, 16)
    }

    private var conditionBadge: some View {
        HStack(spacing: 8) {
            AsyncImage(url: URL(string: weather.conditionIconUrl)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Image(systemName: AppImages.Icons.cloud)
                    .foregroundColor(AppColors.onSecondary)
            }
            .frame(width: 28, height: 28)

            Text(weather.conditionText)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(AppColors.onPrimary)
        }

    }

    private var tempRangeRow: some View {
        HStack(spacing: 12) {
            tempPill(
                icon: AppImages.Icons.highTemp,
                value: "\(Int(weather.forecast.first?.maxTempC ?? 0))°",
                color: AppColors.highTempColor
            )
            tempPill(
                icon: AppImages.Icons.lowTemp,
                value: "\(Int(weather.forecast.first?.minTempC ?? 0))°",
                color: AppColors.lowTempColor
            )
        }
        .padding(.top, 4)
    }

    private func tempPill(icon: String, value: String, color: Color) -> some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(color)
            Text(value)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(AppColors.onPrimary)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(AppColors.cardBackground)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(AppColors.cardBorder, lineWidth: 1)
        )
    }
}
