//
//  WeatherToolbarView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct WeatherToolbarView: View {

    let onSearchTapped: () -> Void
    let onSavedTapped: () -> Void

    var body: some View {
        HStack {
            Button(action: onSavedTapped) {
                Image(systemName: AppImages.Icons.savedLocations)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

            Spacer()

            Text(AppStrings.Splash.title)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(AppColors.onPrimary)

            Spacer()

            Button(action: onSearchTapped) {
                Image(systemName: AppImages.Icons.search)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
    }
}
