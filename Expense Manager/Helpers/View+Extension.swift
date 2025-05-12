//
//  View+Extension.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

extension View {
    var safeArea: UIEdgeInsets {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        return .zero
    }

    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }

    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }

    func format(date: Date, format: String) -> String {
        let formformat = DateFormatter()
        formformat.dateFormat = format
        return formformat.string(from: date)
    }
}
