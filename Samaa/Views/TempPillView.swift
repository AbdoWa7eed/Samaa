//
//  TempPillView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct TempPillView: View {

    let icon: String
    let label: String
    let value: String
    let color: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(color)

            Rectangle()
                .fill(AppColors.cardBorder)
                .frame(width: 0.5, height: 24)

            VStack(alignment: .leading, spacing: 1) {
                Text(label)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(AppColors.onPrimary)
                    .tracking(0.3)
                Text(value)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(AppColors.cardBackground)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(AppColors.cardBorder, lineWidth: 0.5)
        )
    }
}
