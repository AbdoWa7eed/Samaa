//
//  TopPageIndicatorView.swift
//  Samaa
//
//  Created by Abdelrahman on 10/06/2026.
//

import SwiftUI

struct TopPageIndicatorView: View {
    let pageCount: Int
    let currentIndex: Int

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<pageCount, id: \.self) { index in
                Circle()
                    .fill(
                        index == currentIndex
                        ? AppColors.onPrimary
                        : AppColors.onPrimary.opacity(0.35)
                    )
                    .frame(width: 6, height: 6)
            }
        }
        .padding(.vertical, 8)
        .opacity(pageCount > 1 ? 1 : 0)
    }
}
