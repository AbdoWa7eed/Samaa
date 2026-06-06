//
//  HourlyRowView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct HourlyRowView: View {

    let hour: HourEntity
    let isNow: Bool
    let showDivider: Bool

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text(isNow ? AppStrings.HourlyForecast.now : hour.time.toHourLabel())
                    .font(.system(size: 16, weight: isNow ? .semibold : .regular))
                    .foregroundColor(isNow ? AppColors.onPrimary : AppColors.onSecondary)
                    .frame(width: 70, alignment: .leading)

                Spacer()

                AsyncImage(url: URL(string: hour.conditionIconUrl)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Image(systemName: AppImages.Icons.cloud)
                        .foregroundColor(AppColors.onSecondary)
                }
                .frame(width: 44, height: 44)

                Spacer()

                Text("\(Int(hour.tempC))°")
                    .font(.system(size: 22, weight: isNow ? .bold : .semibold))
                    .foregroundColor(AppColors.onPrimary)
                    .frame(width: 55, alignment: .trailing)
            }
            .padding(.vertical, 14)

            if showDivider {
                Divider()
                    .background(AppColors.cardDivider)
            }
        }
    }
}
