//
//  PlaceholderModifier.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

extension View {
    func placeholder(
        _ text: String,
        isVisible: Bool,
        color: Color = AppColors.onSecondary
    ) -> some View {
        overlay(alignment: .leading) {
            if isVisible {
                Text(text)
                    .foregroundColor(color)
                    .font(.system(size: 16))
                    .allowsHitTesting(false)
            }
        }
    }
}
