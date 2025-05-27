//
//  DateFilterView.swift
//  Expense Manager
//
//  Created by Aditya on 21/05/25.
//

import SwiftUI

struct DateFilterView: View {
    @State var start: Date
    @State var end: Date

    let onSubmit: (Date, Date) -> ()
    let onClose: () -> ()

    var body: some View {
        VStack(spacing: 15) {
            DatePicker(
                "Start Date",
                selection: $start,
                displayedComponents: [.date]
            )

            DatePicker(
                "End Date",
                selection: $end,
                displayedComponents: [.date]
            )

            HStack(spacing: 15) {
                Button("Close") {
                    onClose()
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(.red)

                Button("Filter") {
                    onSubmit(start, end)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(appTint)
            }
            .padding(.top, 10)
        }
        .padding(15)
        .background(.bar, in: .rect(cornerRadius: 15))
        .padding(.horizontal, 30)
    }
}

#Preview {
    DateFilterView(
        start: .now.startOfMonth,
        end: .now.endOfMonth) { _, _ in
            //
        } onClose: {
            //
        }
}
