//
//  WeatherView.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import SwiftUI

struct WeatherView: View {
    let mode: WeatherViewMode
    @StateObject private var viewModel: WeatherViewModel
    @State private var navigateToSaved = false
    @State private var navigateToSearch = false
    @Environment(\.presentationMode) private var presentationMode

    init(mode: WeatherViewMode = .currentLocation) {
        self.mode = mode
        self._viewModel = StateObject(
            wrappedValue: AppContainer.shared.makeWeatherViewModel(mode: mode)
        )
    }

    var body: some View {
        ThemeBackgroundView {
            VStack(spacing: 0) {
                toolbar
                weatherContent
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(
                ZStack {
                    NavigationLink(destination: SavedLocationsView(), isActive: $navigateToSaved) { EmptyView() }
                    NavigationLink(destination: SearchView(), isActive: $navigateToSearch) { EmptyView() }
                }
            )
        }
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    private var toolbar: some View {
        let cityName = viewModel.weather?.cityName ?? ""
        
        if mode.isDetail {
            WeatherToolbarView(
                cityName: cityName,
                type: .detail(
                    isSaved: viewModel.isSaved,
                    isLoading: viewModel.isLoading,
                    onBackTapped: handleBack,
                    onSaveTapped: handleSave
                )
            )
        } else {
            WeatherToolbarView(
                cityName: cityName,
                type: .main(
                    onSavedTapped: { navigateToSaved = true },
                    onSearchTapped: { navigateToSearch = true }
                )
            )
        }
    }

    @ViewBuilder
    private var weatherContent: some View {
        if viewModel.isLoading {
            ProgressView()
                .tint(AppColors.onPrimary)
                .scaleEffect(1.5)
        } else if let error = viewModel.errorMessage {
            WeatherErrorView(
                message: error,
                onRetry: viewModel.retry
            )
        } else if let weather = viewModel.weather {
            WeatherContentView(weather: weather)
        }
    }

    private func handleBack() {
        switch mode {
        case .currentLocation:
            presentationMode.wrappedValue.dismiss()
        case .selectedLocation:
            presentationMode.wrappedValue.dismiss()
        }
    }

    private func handleSave() {
        viewModel.saveCurrentLocation()
    }
}
