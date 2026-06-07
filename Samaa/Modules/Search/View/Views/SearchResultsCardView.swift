//
//  SearchResultsCardView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SearchResultsCardView: View {

    let locations: [SearchLocation]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(locations.enumerated()), id: \.offset) { index, location in
                NavigationLink(destination:WeatherView(mode: .selectedLocation(location.coordinate))
                                .hiddenNavigationBar()
                ) {
                    SearchResultRowView(
                        location: location,
                        showDivider: index < locations.count - 1
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal, 16)
        .background(AppColors.cardBackground)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(AppColors.cardBorder, lineWidth: 1)
        )
    }
}
