//
//  ConditionBadgeView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import SwiftUI

struct ConditionBadgeView: View {

    let text: String
    var iconUrl: String? = nil

    var body: some View {
        HStack(spacing: 0) {
            if let iconUrl = iconUrl, let url = URL(string: iconUrl) {
                AsyncImage(url: url) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Image(systemName: AppImages.Icons.cloud)
                        .resizable().frame(width: 40, height: 40)
                        .foregroundColor(AppColors.onPrimary)
                }
                .frame(width: 60, height: 60)
            }

            Text(text)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(AppColors.onPrimary)
        }
    }
}
