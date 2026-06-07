//
//  SearchViewModel.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {

    @Published private(set) var searchResults: [SearchLocation] = []
    @Published private(set) var isSearching = false
    @Published var query = ""

    private let weatherService: WeatherServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
        observeQuery()
    }


    private func observeQuery() {
        $query
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] value in
                guard let self = self else { return }
                if value.trimmingCharacters(in: .whitespaces).isEmpty {
                    self.searchResults = []
                } else {
                    self.search(query: value)
                }
            }
            .store(in: &cancellables)
    }

    private func search(query: String) {
        isSearching = true
        Task { @MainActor in
            do {
                searchResults = try await weatherService.searchLocations(query: query)
            } catch {
                searchResults = []
            }
            isSearching = false
        }
    }
}
