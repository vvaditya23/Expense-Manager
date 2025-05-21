//
//  Date+Extension.swift
//  Expense Manager
//
//  Created by Aditya on 12/05/25.
//

import Foundation

extension Date {
    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components) ?? self
    }

    var endOfMonth: Date {
        return Calendar.current.date(byAdding: .init(month: 1, minute: -1), to: self.startOfMonth) ?? self
    }
}
