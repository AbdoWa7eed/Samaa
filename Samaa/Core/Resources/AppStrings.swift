//
//  AppStrings.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation

struct AppStrings {

    struct Splash {
        static let title = "Samaa'"
        static let subtitle = "Your Sky, Your Weather"
    }

    struct Weather {
        static let forecastTitle = "3-DAY FORECAST"
        static let today = "Today"
        static let tomorrow = "Tomorrow"
        static let visibility = "Visibility"
        static let humidity = "Humidity"
        static let feelsLike = "Feels Like"
        static let pressure = "Pressure"
        static let high = "H:"
        static let low = "L:"
        static let km = "km"
        static let mb = "mb"
        static let percent = "%"
        static let celsius = "°C"
        static let clearView = "Clear view"
        static let reducedVisibility = "Reduced visibility"
        static let feelsHumid = "Feels humid"
        static let comfortable = "Comfortable"
        static let warmerThanActual = "Warmer than actual"
        static let closeToActual = "Close to actual"
        static let retry = "Retry"
        static let conditionBadge = "condition"
    }

    struct HourlyForecast {
        static let hourlyForecast = "HOURLY FORECAST"
        static let now = "Now"
    }

    struct Search {
        static let searchPlaceholder = "Search city..."
        static let searchLocation = "Search Locations"
        static let noSavedLocations = "No saved locations yet"
        static let noResults = "No results found"
        static let searching = "Searching..."
        static let emptyQueryTitle = "Search for a city"
        static let emptyQuerySubtitle = "Type a city name to see its weather"
        static let noResultsSubtitle = "Try a different city name"
    }

    struct SavedLocations {
        static let title = "Saved Locations"
        static let emptyTitle = "No saved locations"
        static let emptySubtitle = "Save cities from search to access them quickly"
        static let removeTitle = "Remove Location"
        static func removeMessage(_ name: String) -> String { "Remove \(name) from saved locations?" }
        static let removeConfirm = "Remove"
        static let cancel = "Cancel"
    }

    struct Toolbar {
        static let mainTitle = AppStrings.Splash.title
    }
}
