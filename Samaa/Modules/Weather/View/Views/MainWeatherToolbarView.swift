//
//  MainWeatherToolbarView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct MainWeatherToolbarView: View {

    let onSavedTapped: () -> Void
    let onSearchTapped: () -> Void

    var body: some View {
        HStack {
            Button(action: onSavedTapped) {
                Image(systemName: AppImages.Icons.savedLocations)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

            Spacer()

            Text(AppStrings.Toolbar.mainTitle)
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
