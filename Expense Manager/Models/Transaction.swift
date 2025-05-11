//
//  Transaction.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

struct Transaction: Identifiable {
    let id: UUID = .init()

    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    /// Used to give random color to eachtransaction view
    var tintColor: String

    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.colorName
    }

    // Extract Color value from tintColor string
    var color: Color {
        return tints.first(where: { $0.colorName == tintColor })?.value ?? appTint
    }
}
