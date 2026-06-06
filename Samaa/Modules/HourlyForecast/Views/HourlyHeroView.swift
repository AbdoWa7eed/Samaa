//
//  HourlyHeroView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct HourlyHeroView: View {

    let day: ForecastDayEntity

    var body: some View {
        VStack(spacing: 6) {
            AsyncImage(url: URL(string: day.conditionIconUrl)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Image(systemName: AppImages.Icons.cloud)
                    .foregroundColor(AppColors.onSecondary)
            }
            .frame(width: 90, height: 90)

            ConditionBadgeView(text: day.conditionText)

            HStack(spacing: 12) {
                TempPillView(
                    icon: AppImages.Icons.highTemp,
                    label: "High",
                    value: "\(Int(day.maxTempC))°",
                    color: AppColors.highTempColor
                )
                TempPillView(
                    icon: AppImages.Icons.lowTemp,
                    label: "Low",
                    value: "\(Int(day.minTempC))°",
                    color: AppColors.lowTempColor
                )
            }
            .padding(.top, 4)
        }
        .padding(.vertical, 16)
    }
}
