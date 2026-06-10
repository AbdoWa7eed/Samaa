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
    @State private var showSearch = false
    @State private var showSaved = false

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

                hiddenSearchLink
                hiddenSavedLink
            }
        }
        .onAppear { viewModel.onAppear() }
    }


    @ViewBuilder
    private var toolbar: some View {
        if mode.isDetail {
            DetailWeatherToolbarView(
                cityName: viewModel.weather?.cityName ?? "",
                isSaved: viewModel.isSaved,
                onBackTapped: handleLeftTap,
                onSaveTapped: handleRightTap
            )
        } else {
            MainWeatherToolbarView(
                onSavedTapped: handleLeftTap,
                onSearchTapped: handleRightTap,
                cityName: viewModel.weather?.cityName ?? ""
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


    private var hiddenSearchLink: some View {
        NavigationLink(
            destination: SearchView(),
            isActive: $showSearch
        ) { EmptyView() }
            .frame(width: 0, height: 0)
            .hidden()
    }

    private var hiddenSavedLink: some View {
        NavigationLink(
            destination: SavedLocationsView(),
            isActive: $showSaved
        ) { EmptyView() }
            .frame(width: 0, height: 0)
            .hidden()
    }


    private func handleLeftTap() {
        switch mode {
        case .currentLocation: showSaved = true
        case .selectedLocation: presentationMode.wrappedValue.dismiss()
        }
    }

    private func handleRightTap() {
        switch mode {
        case .currentLocation: showSearch = true
        case .selectedLocation: viewModel.saveCurrentLocation()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
