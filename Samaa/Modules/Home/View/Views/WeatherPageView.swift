//
//  WeatherPageView.swift
//  Samaa
//
//  Created by Abdelrahman on 10/06/2026.
//

import SwiftUI

struct WeatherPageView: View {

    let page: WeatherPage
    let onToggleSave: () -> Void

    var body: some View {
        WeatherContentView(weather: page.weather)
    }
}
