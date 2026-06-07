//
//  SearchToolbarView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SearchToolbarView: View {

    let onBackTapped: () -> Void

    var body: some View {
        HStack {
            Button(action: onBackTapped) {
                Image(systemName: AppImages.Icons.back)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(AppColors.onPrimary)
            }

            Spacer()

            Text(AppStrings.Search.searchLocation)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(AppColors.onPrimary)

            Spacer()

            Image(systemName: AppImages.Icons.back)
                .opacity(0)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
}
