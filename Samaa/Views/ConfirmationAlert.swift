//
//  ConfirmationAlert.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import SwiftUI

struct ConfirmationAlert: ViewModifier {

    let title: String
    let message: String
    let confirmLabel: String
    let isDestructive: Bool
    @Binding var isPresented: Bool
    let onConfirm: () -> Void

    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isPresented) {
                Alert(
                    title: Text(title),
                    message: Text(message),
                    primaryButton: isDestructive
                        ? .destructive(Text(confirmLabel)) { onConfirm() }
                        : .default(Text(confirmLabel)) { onConfirm() },
                    secondaryButton: .cancel(Text(AppStrings.SavedLocations.cancel))
                )
            }
    }
}

extension View {
    func confirmationAlert(
        title: String,
        message: String,
        confirmLabel: String,
        isDestructive: Bool = true,
        isPresented: Binding<Bool>,
        onConfirm: @escaping () -> Void
    ) -> some View {
        modifier(ConfirmationAlert(
            title: title,
            message: message,
            confirmLabel: confirmLabel,
            isDestructive: isDestructive,
            isPresented: isPresented,
            onConfirm: onConfirm
        ))
    }
}
