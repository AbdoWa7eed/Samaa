//
//  WeatherToolbarView.swift
//  Samaa
//
//  Created by Abdelrahman on 10/06/2026.
//

import SwiftUI

enum WeatherToolbarType {
    case main(onSavedTapped: () -> Void, onSearchTapped: () -> Void)
    case detail(isSaved: Bool, isLoading: Bool ,onBackTapped: () -> Void, onSaveTapped: () -> Void)
}

struct WeatherToolbarView: View {
    let cityName: String
    let type: WeatherToolbarType

    @State private var showRemoveAlert = false

    var body: some View {
        HStack {
            leftButton

            Spacer()

            Text(cityName)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(AppColors.onPrimary)
                .lineLimit(1)

            Spacer()

            rightButton
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private var leftButton: some View {
        switch type {
        case .main(let onSavedTapped, _):
            Button(action: onSavedTapped) {
                Image(systemName: AppImages.Icons.savedLocations)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

        case .detail(_, _, let onBackTapped, _):
            Button(action: onBackTapped) {
                Image(systemName: AppImages.Icons.back)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }
        }
    }

    @ViewBuilder
    private var rightButton: some View {
        switch type {

        case .main(_, let onSearchTapped):
            Button(action: onSearchTapped) {
                Image(systemName: AppImages.Icons.search)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

        case .detail(let isSaved, let isLoading, _, let onSaveTapped):

            if isLoading {
                EmptyView()
            } else {
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
        }
    }
}
