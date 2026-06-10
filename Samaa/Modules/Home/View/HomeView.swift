//
//  HomeView.swift
//  Samaa
//
//  Created by Abdelrahman on 10/06/2026.
//

import SwiftUI

struct HomeView: View {
    let mode: WeatherViewMode
    @StateObject private var viewModel: HomeViewModel
    @State private var currentPageIndex = 0
    @State private var navigateToSaved = false
    @State private var navigateToSearch = false
    @Environment(\.presentationMode) private var presentationMode

    init(mode: WeatherViewMode = .currentLocation) {
        self.mode = mode
        self._viewModel = StateObject(
            wrappedValue: AppContainer.shared.makeHomeViewModel()
        )
    }

    var body: some View {
            ThemeBackgroundView {
                ZStack {
                    NavigationLink(destination: SavedLocationsView(), isActive: $navigateToSaved) { EmptyView() }
                    NavigationLink(destination: SearchView(), isActive: $navigateToSearch) { EmptyView() }
                    content
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
            .onChange(of: viewModel.pages.count) { newCount in
                if currentPageIndex >= newCount {
                    currentPageIndex = max(0, newCount - 1)
                }
            }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView()
                .tint(AppColors.onPrimary)
                .scaleEffect(1.5)
        } else if let error = viewModel.errorMessage {
            WeatherErrorView(
                message: error,
                onRetry: { Task { viewModel.retry() } }
            )
        } else {
            pageView
        }
    }

    private var pageView: some View {
        VStack(spacing: 0) {
            toolbar
            
            TopPageIndicatorView(
                pageCount: viewModel.pages.count,
                currentIndex: safePageIndex
            )
            
            TabView(selection: $currentPageIndex) {
                ForEach(Array(viewModel.pages.enumerated()), id: \.element.id) { index, page in
                    WeatherPageView(
                        page: page,
                        onToggleSave: {
                            viewModel.toggleSave(for: page.weather)
                        }
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }

    @ViewBuilder
    private var toolbar: some View {
        let page = viewModel.pages[safe: safePageIndex]
        let cityName = page?.weather.cityName ?? AppStrings.Toolbar.mainTitle
        
        WeatherToolbarView(
            cityName: cityName,
            type: .main(
                onSavedTapped: { navigateToSaved = true },
                onSearchTapped: { navigateToSearch = true }
            )
        )
    }
    
    private var safePageIndex: Int {
        min(currentPageIndex, max(0, viewModel.pages.count - 1))
    }
}
