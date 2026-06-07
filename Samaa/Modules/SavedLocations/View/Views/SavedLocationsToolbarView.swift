//
//  SavedLocationsToolbarView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SavedLocationsToolbarView: View {

    let onBackTapped: () -> Void

    var body: some View {
        HStack {
            Button(action: onBackTapped) {
                Image(systemName: AppImages.Icons.back)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

            Spacer()

            Text(AppStrings.SavedLocations.title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(AppColors.onPrimary)

            Spacer()

            // balance
            Image(systemName: AppImages.Icons.back)
                .opacity(0)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
}
