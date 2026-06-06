//
//  WeatherView.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import SwiftUI

struct WeatherView: View {

    @StateObject private var viewModel = AppContainer.shared.makeWeatherViewModel()

    var body: some View {
        ThemeBackgroundView {
            VStack(spacing: 0) {
                WeatherToolbarView(
                    onSearchTapped: {},
                    onSavedTapped: {}
                )

                Group {
                    if viewModel.isLoading {
                        loadingView()
                    } else if let error = viewModel.errorMessage {
                        errorView(message: error)
                    } else if let weather = viewModel.weather {
                        contentView(weather: weather)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }

    private func loadingView() ->  some View {
        ProgressView()
            .tint(AppColors.onPrimary)
            .scaleEffect(1.5)
    }

    private func errorView(message: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: AppImages.Icons.error)
                .font(.system(size: 40))
                .foregroundColor(AppColors.onSecondary)
            Text(message)
                .font(.system(size: 16))
                .foregroundColor(AppColors.onSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            Button(action: viewModel.retry) {
                Text(AppStrings.Weather.retry)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.onPrimary)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(AppColors.cardBackground)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(AppColors.cardBorder, lineWidth: 1)
                    )
            }
        }
    }

    private func contentView(weather: WeatherEntity) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                WeatherHeroView(weather: weather)

                ForecastCardView(days: weather.forecast)
                    .padding(.horizontal, 20)

                MetricsGridView(
                    visibilityKm: weather.visibilityKm,
                    humidity: weather.humidity,
                    feelsLikeC: weather.feelsLikeC,
                    pressureMb: weather.pressureMb
                )
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 32)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
