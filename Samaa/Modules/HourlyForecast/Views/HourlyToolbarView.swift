//
//  HourlyToolbarView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct HourlyToolbarView: View {

    let date: String
    let onBackTapped: () -> Void

    var body: some View {
        HStack {
            Button(action: onBackTapped) {
                Image(systemName: AppImages.Icons.back)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

            Spacer()

            Text(date)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(AppColors.onPrimary)

            Spacer()

            Image(systemName: AppImages.Icons.back)
                .font(.system(size: 18, weight: .medium))
                .opacity(0)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
}
