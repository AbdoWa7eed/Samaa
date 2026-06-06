//
//  HourlyView.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//


import SwiftUI

struct HourlyView: View {

    let day: ForecastDayEntity
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        ThemeBackgroundView {
            VStack(spacing: 0) {
                HourlyToolbarView(
                    date: day.date.toDayTitle(),
                    onBackTapped: { presentationMode.wrappedValue.dismiss() }
                )

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        HourlyHeroView(day: day)
                        HourlyListCardView(
                            hours: day.hours.fromCurrentHourEvery2(isToday: day.date.isToday()),
                            isToday: day.date.isToday()
                        )
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 32)
                }
            }
        }
        .hiddenNavigationBar()
    }
}
