//
//  SearchView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SearchView: View {

    @StateObject private var viewModel = AppContainer.shared.makeSearchViewModel()
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        ThemeBackgroundView {
            VStack(spacing: 0) {
                SearchToolbarView(
                    onBackTapped: { presentationMode.wrappedValue.dismiss() }
                )

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        SearchBarView(text: $viewModel.query)
                            .padding(.horizontal, 20)

                        if viewModel.isSearching {
                            searchingView
                        } else if !viewModel.searchResults.isEmpty {
                            SearchResultsCardView(locations: viewModel.searchResults)
                                .padding(.horizontal, 20)
                        } else if !viewModel.query.isEmpty {
                            noResultsView
                        } else {
                            idleView
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.bottom, 32)
                }
            }
        }
        .hiddenNavigationBar()
    }


    private var searchingView: some View {
        VStack(spacing: 12) {
            ProgressView()
                .tint(AppColors.onPrimary)
                .scaleEffect(1.2)
            Text(AppStrings.Search.searching)
                .font(.system(size: 14))
                .foregroundColor(AppColors.onSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 48)
    }

    private var idleView: some View {
        VStack(spacing: 12) {
            Image(systemName: AppImages.Icons.search)
                .font(.system(size: 48))
                .foregroundColor(AppColors.onSecondary.opacity(0.5))
            Text(AppStrings.Search.emptyQueryTitle)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(AppColors.onPrimary)
            Text(AppStrings.Search.emptyQuerySubtitle)
                .font(.system(size: 13))
                .foregroundColor(AppColors.onSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 48)
        .padding(.horizontal, 32)
    }

    private var noResultsView: some View {
        VStack(spacing: 12) {
            Image(systemName: AppImages.Icons.cloud)
                .font(.system(size: 48))
                .foregroundColor(AppColors.onSecondary.opacity(0.5))
            Text(AppStrings.Search.noResults)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(AppColors.onPrimary)
            Text(AppStrings.Search.noResultsSubtitle)
                .font(.system(size: 13))
                .foregroundColor(AppColors.onSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 48)
        .padding(.horizontal, 32)
    }
}
