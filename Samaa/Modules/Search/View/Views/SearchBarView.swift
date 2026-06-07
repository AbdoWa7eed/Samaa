//
//  SearchBarView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SearchBarView: View {

    @Binding var text: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: AppImages.Icons.search)
                .font(.system(size: 16))
                .foregroundColor(AppColors.onSecondary)

            TextField("", text: $text)
                .font(.system(size: 16))
                .foregroundColor(AppColors.onPrimary)
                .accentColor(AppColors.onPrimary)
                .placeholder(
                    AppStrings.Search.searchPlaceholder,
                    isVisible: text.isEmpty
                )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(AppColors.searchBarBackground)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(AppColors.searchBarBorder, lineWidth: 1)
        )
    }
}
