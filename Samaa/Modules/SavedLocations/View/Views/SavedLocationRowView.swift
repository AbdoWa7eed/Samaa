//
//  SavedLocationRowView.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct SavedLocationRowView: View {

    let location: SearchLocation
    let onDelete: () -> Void
    let showDivider: Bool

    @State private var showDeleteAlert = false

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: AppImages.Icons.location)
                    .font(.system(size: 16))
                    .foregroundColor(AppColors.lowTempColor)

                VStack(alignment: .leading, spacing: 3) {
                    Text(location.name)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(AppColors.onPrimary)
                    Text("\(location.region), \(location.country)")
                        .font(.system(size: 13))
                        .foregroundColor(AppColors.onSecondary)
                }

                Spacer()

                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: AppImages.Icons.savedLocation)
                        .font(.system(size: 16))
                        .foregroundColor(AppColors.highTempColor)
                }
            }
            .padding(.vertical, 14)
            .confirmationAlert(
                title: AppStrings.SavedLocations.removeTitle,
                message: AppStrings.SavedLocations.removeMessage(location.name),
                confirmLabel: AppStrings.SavedLocations.removeConfirm,
                isPresented: $showDeleteAlert,
                onConfirm: onDelete
            )

            if showDivider {
                Divider()
                    .background(AppColors.cardDivider)
            }
        }
    }
}
