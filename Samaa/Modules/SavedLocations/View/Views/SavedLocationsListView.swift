//
//  SavedLocationsListView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SavedLocationsListView: View {

    let locations: [SearchLocation]
    let onDelete: (SearchLocation) -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(Array(locations.enumerated()), id: \.offset) { index, location in
                    NavigationLink(
                        destination: WeatherView(mode: .selectedLocation(location.coordinate)).hiddenNavigationBar()
                    ) {
                        SavedLocationRowView(
                            location: location,
                            onDelete: { onDelete(location) },
                            showDivider: index < locations.count - 1
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 16)
            .background(AppColors.cardBackground)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(AppColors.cardBorder, lineWidth: 1)
            )
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .padding(.bottom, 32)
        }
    }
}
