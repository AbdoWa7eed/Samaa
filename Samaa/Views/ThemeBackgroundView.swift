//
//  BackgroundImageView.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation
import SwiftUI

struct ThemeBackgroundView<Content: View>: View {

    let content: () -> Content

    var body: some View {
        ZStack {
            Image(AppImages.backgroundImage)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            content()
        }
    }
}
