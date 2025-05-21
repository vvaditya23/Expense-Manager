//
//  TransactionCardView.swift
//  Expense Manager
//
//  Created by Aditya on 18/05/25.
//

import SwiftUI

struct TransactionCardView: View {
    var transaction: Transaction

    var body: some View {
        CustomSwipeAction(
            cornerRadius: 10,
            swipeDirection: .trailing
        ) {
            HStack(spacing: 12) {
                Text(transaction.title.prefix(1))
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(transaction.color.gradient, in: .capsule)

                VStack(alignment: .leading, spacing: 4) {
                    Text(transaction.title)
                        .foregroundStyle(Color.primary)

                    Text(transaction.remarks)
                        .font(.caption)
                        .foregroundStyle(Color.primary.secondary)

                    Text(format(date: transaction.dateAdded, format: "dd MMM yyyy"))
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
                .lineLimit(1)
                .hSpacing(.leading)

                Text(formatCurrency(transaction.amount))
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(.background, in: .rect(cornerRadius: 10))
        } actions: {
            SwipeAction(
                tint: .red,
                icon: "trash"
            ) {
                // TODO: Delete
            }
        }
    }
}

#Preview {
    TransactionCardView(transaction: sampleTransactions[0])
}
