//
//  HourlyListCardView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct HourlyListCardView: View {

    let hours: [HourEntity]
    let isToday: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(hours.enumerated()), id: \.offset) { index, hour in
                HourlyRowView(
                    hour: hour,
                    isNow: isToday && index == 0,
                    showDivider: index < hours.count - 1
                )
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .background(AppColors.cardBackground)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(AppColors.cardBorder, lineWidth: 1)
        )
    }
}
