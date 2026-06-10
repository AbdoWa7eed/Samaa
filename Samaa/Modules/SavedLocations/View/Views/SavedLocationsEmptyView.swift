//
//  SavedLocationsEmptyView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SavedLocationsEmptyView: View {
   var body: some View {
       VStack(spacing: 12) {
           Image(systemName: AppImages.Icons.savedLocation)
               .font(.system(size: 48))
               .foregroundColor(AppColors.onSecondary.opacity(0.5))
           Text(AppStrings.SavedLocations.emptyTitle)
               .font(.system(size: 16, weight: .medium))
               .foregroundColor(AppColors.onPrimary)
           Text(AppStrings.SavedLocations.emptySubtitle)
               .font(.system(size: 13))
               .foregroundColor(AppColors.onSecondary)
               .multilineTextAlignment(.center)
       }
       .padding(.horizontal, 32)
   }
}
