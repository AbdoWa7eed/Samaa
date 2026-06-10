//
//  MetricTileView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct MetricTileView: View {

    let icon: String
    let label: String
    let value: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 13))
                    .foregroundColor(AppColors.onSecondary)
                Text(label)
                    .font(.system(size: 12, weight: .semibold))
                    .tracking(1.0)
                    .foregroundColor(AppColors.onSecondary)
            }

            Text(value)
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(AppColors.onPrimary)

            Text(subtitle)
                .font(.system(size: 12))
                .foregroundColor(AppColors.onSecondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppColors.tileBackground)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(AppColors.cardBorder, lineWidth: 1)
        )
    }
}
