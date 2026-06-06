//
//  ForecastCardView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI


struct ForecastCardView: View {

    let days: [ForecastDayEntity]

    private func label(for index: Int) -> String {
        switch index {
        case 0: return AppStrings.Weather.tomorrow
        default: return days[index].date.toWeekdayAbbreviation()
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 6) {
                Image(systemName: AppImages.Icons.calendar)
                    .font(.system(size: 13))
                    .foregroundColor(AppColors.onSecondary)
                Text(AppStrings.Weather.forecastTitle)
                    .font(.system(size: 13, weight: .semibold))
                    .tracking(1.5)
                    .foregroundColor(AppColors.onSecondary)
            }
            .padding(.bottom, 12)

            let forecastDays = Array(days.dropFirst())

            ForEach(Array(forecastDays.enumerated()), id: \.offset) { index, day in
                ForecastRowView(
                    day: day,
                    label: label(for: index),
                    showDivider: index < forecastDays.count - 1
                )
            }
        }
        .padding(20)
        .background(AppColors.cardBackground)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(AppColors.cardBorder, lineWidth: 1)
        )
    }
}
