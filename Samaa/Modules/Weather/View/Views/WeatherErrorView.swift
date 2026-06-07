//
//  WeatherErrorView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct WeatherErrorView: View {

    let message: String
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: AppImages.Icons.error)
                .font(.system(size: 40))
                .foregroundColor(AppColors.onSecondary)

            Text(message)
                .font(.system(size: 16))
                .foregroundColor(AppColors.onSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Button(action: onRetry) {
                Text(AppStrings.Weather.retry)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.onPrimary)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(AppColors.cardBackground)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(AppColors.cardBorder, lineWidth: 1)
                    )
            }
        }
    }
}
