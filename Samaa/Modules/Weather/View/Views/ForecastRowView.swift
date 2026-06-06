//
//  ForecastRowView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//


import SwiftUI

struct ForecastRowView: View {

    let day: ForecastDayEntity
    let label: String
    let showDivider: Bool

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(label)
                    .font(.system(size: 16))
                    .foregroundColor(AppColors.onPrimary)
                    .frame(width: 90, alignment: .leading)

                Spacer()

                AsyncImage(url: URL(string: day.conditionIconUrl)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Image(systemName: AppImages.Icons.cloud)
                        .foregroundColor(AppColors.onSecondary)
                }
                .frame(width: 32, height: 32)

                Spacer()

                HStack(spacing: 12) {
                    Text("\(Int(day.minTempC))°")
                        .foregroundColor(AppColors.onSecondary)
                    Text("\(Int(day.maxTempC))°")
                        .foregroundColor(AppColors.onPrimary)
                }
                .font(.system(size: 16))
            }
            .padding(.vertical, 12)

            if showDivider {
                Divider()
                    .background(AppColors.cardDivider)
            }
        }
    }
}
