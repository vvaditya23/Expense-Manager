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

var sampleTransactions: [Transaction] = [
    .init(
        title: "Groceries",
        remarks: "Weekly shopping at Walmart",
        amount: 1200.50,
        dateAdded: Date(),
        category: .expense,
        tintColor: tints.randomElement()!
    ),
    .init(
        title: "Salary",
        remarks: "Monthly paycheck",
        amount: 25000.00,
        dateAdded: Date().addingTimeInterval(-86400 * 15),
        category: .income,
        tintColor: tints.randomElement()!
    ),
    .init(
        title: "Coffee",
        remarks: "Starbucks morning coffee",
        amount: 50.75,
        dateAdded: Date().addingTimeInterval(-86400 * 2),
        category: .expense,
        tintColor: tints.randomElement()!
    ),
    .init(
        title: "Rent",
        remarks: "Monthly apartment rent",
        amount: 9000.00,
        dateAdded: Date().addingTimeInterval(-86400 * 30),
        category: .expense,
        tintColor: tints.randomElement()!
    ),
    .init(
        title: "Gym Membership",
        remarks: "Monthly gym subscription",
        amount: 500.00,
        dateAdded: Date().addingTimeInterval(-86400 * 10),
        category: .expense,
        tintColor: tints.randomElement()!
    ),
    .init(
        title: "Freelance Project",
        remarks: "Web development project",
        amount: 8000.00,
        dateAdded: Date().addingTimeInterval(-86400 * 7),
        category: .income,
        tintColor: tints.randomElement()!
    ),
    .init(
        title: "Utilities",
        remarks: "Electricity bill payment",
        amount: 1500.00,
        dateAdded: Date().addingTimeInterval(-86400 * 5),
        category: .expense,
        tintColor: tints.randomElement()!
    )
]
