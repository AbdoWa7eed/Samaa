//
//  SavedLocationsView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SavedLocationsView: View {

    @StateObject private var viewModel = AppContainer.shared.makeSavedLocationsViewModel()
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        ThemeBackgroundView {
            VStack(spacing: 0) {
                SavedLocationsToolbarView(
                    onBackTapped: { presentationMode.wrappedValue.dismiss() }
                )

                Group {
                    if viewModel.locations.isEmpty {
                        SavedLocationsEmptyView()
                    } else {
                        SavedLocationsListView(
                            locations: viewModel.locations,
                            onDelete: { location in
                                viewModel.delete(location)
                            }
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .hiddenNavigationBar()
    }
}
