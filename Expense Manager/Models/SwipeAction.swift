//
//  SwipeAction.swift
//  Expense Manager
//
//  Created by Aditya on 18/05/25.
//

import SwiftUI

struct SwipeAction: Identifiable {
    private(set) var id: UUID = .init()
    var tint: Color
    var icon: String
    var iconFont: Font = .title
    var iconTint: Color = .white
    var isEnabled: Bool = true
    var action: () -> ()
}
