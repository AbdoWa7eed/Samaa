//
//  WeatherToolbarView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct WeatherToolbarView: View {

    let isDetail: Bool
    let onLeftTapped: () -> Void
    let onRightTapped: () -> Void

    var body: some View {
        HStack {
            Button(action: onLeftTapped) {
                Image(systemName: isDetail ? AppImages.Icons.back : AppImages.Icons.savedLocations)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

            Spacer()

            Text(AppStrings.Splash.title)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(AppColors.onPrimary)

            Spacer()

            Button(action: onRightTapped) {
                Image(systemName: isDetail ? AppImages.Icons.save : AppImages.Icons.search)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
    }
}
