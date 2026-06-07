//
//  SearchResultRowView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SearchResultRowView: View {

    let location: SearchLocation
    let showDivider: Bool

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: AppImages.Icons.location)
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.onSecondary)

                VStack(alignment: .leading, spacing: 2) {
                    Text(location.name)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(AppColors.onPrimary)
                    Text("\(location.region), \(location.country)")
                        .font(.system(size: 13))
                        .foregroundColor(AppColors.onSecondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 13))
                    .foregroundColor(AppColors.onSecondary)
            }
            .padding(.vertical, 14)

            if showDivider {
                Divider()
                    .background(AppColors.cardDivider)
            }
        }
    }
}
