//
//  WeatherView.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ThemeBackgroundView {
            Text("WELCOME TO SAMAA'!")
                .foregroundColor(AppColors.onPrimary)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
