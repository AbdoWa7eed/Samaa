//
//  DetailWeatherToolbarView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct DetailWeatherToolbarView: View {

    let cityName: String
    let isSaved: Bool
    let onBackTapped: () -> Void
    let onSaveTapped: () -> Void

    @State private var showRemoveAlert = false

    var body: some View {
        HStack {
            Button(action: onBackTapped) {
                Image(systemName: AppImages.Icons.back)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

            Spacer()

            Text(cityName)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(AppColors.onPrimary)

            Spacer()

            Button {
                if isSaved {
                    showRemoveAlert = true
                } else {
                    onSaveTapped()
                }
            } label: {
                Image(systemName: isSaved ? AppImages.Icons.savedLocation : AppImages.Icons.save)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }
            .confirmationAlert(
                title: AppStrings.SavedLocations.removeTitle,
                message: AppStrings.SavedLocations.removeMessage(cityName),
                confirmLabel: AppStrings.SavedLocations.removeConfirm,
                isPresented: $showRemoveAlert,
                onConfirm: onSaveTapped
            )
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
    }
}
