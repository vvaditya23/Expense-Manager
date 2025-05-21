//
//  TintColor.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

struct TintColor: Identifiable {
    let id: UUID = .init()
    var colorName: String
    var value: Color
}

// TODO: Use random color generator
// ref: https://medium.com/@skreutzb/random-swift-part-2-872276490de7
var tints: [TintColor] = [
    .init(colorName: "blue", value: .blue),
    .init(colorName: "green", value: .green),
    .init(colorName: "yellow", value: .yellow),
    .init(colorName: "red", value: .red),
    .init(colorName: "purple", value: .purple),
    .init(colorName: "orange", value: .orange),
    .init(colorName: "pink", value: .pink),
    .init(colorName: "gray", value: .gray),
    .init(colorName: "teal", value: .teal),
    .init(colorName: "indigo", value: .indigo),
    .init(colorName: "cyan", value: .cyan)
]
