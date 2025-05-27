//
//  OverallStatsCardView.swift
//  Expense Manager
//
//  Created by Aditya on 13/05/25.
//

import SwiftUI

struct OverallStatsCardView: View {
    let income: Double
    let expense: Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)

            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    Text("\(formatCurrency((income - expense)))")
                        .font(.title.bold())

                    Image(systemName: expense > income ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundStyle(expense > income ? .red : .green)
                }
                .padding(.bottom, 25)
                HStack(spacing: 10) {
                    ForEach(Category.allCases, id: \.rawValue) { category in
                        let symbolName = category == .income ? "arrow.up" : "arrow.down"
                        let tintColor: Color = category == .income ? .green : .red

                        Image(systemName: symbolName)
                            .font(.callout.bold())
                            .foregroundStyle(tintColor)
                            .frame(width: 35, height: 35)
                            .background(
                                Circle()
                                    .fill(tintColor.opacity(0.25).gradient)
                            )

                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(category.rawValue)")
                                .font(.caption2)
                                .foregroundStyle(.gray)

                            Text(formatCurrency(category == .income ? income : expense, decimalPlaces: 0))
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundStyle(.primary)
                        }
                        if category == .income {
                            Spacer(minLength: 10)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom], 25)
            .padding(.top, 15)
        }
    }
}

#Preview {
    ScrollView {
        OverallStatsCardView(income: 500, expense: 400)
    }
}
