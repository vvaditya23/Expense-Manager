//
//  Recents.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

struct Recents: View {
    /// User profile
    @AppStorage("UserName") var userName: String = ""

    // View peoperties
    @State var startDate: Date = .now.startOfMonth
    @State var endDate: Date = .now.endOfMonth
    @State var selectedCategory: Category = .expense
    @State var showDateFilter: Bool = false
    
    // For snappy animation
    @Namespace var animation
    var body: some View {
        GeometryReader {
            // For animation
            let size = $0.size
            
            NavigationStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {
                            // Date filter button
                            Button {
                                showDateFilter = true
                            } label: {
                                Text("\(format(date: startDate, format: "dd - MMM yy")) to \(format(date: endDate, format: "dd - MMM yy"))")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            }
                            .hSpacing(.leading)
                            
                            // Overall stats card view
                            OverallStatsCardView(income: 200, expense: 300)

                            customSegmentedControl()
                                .padding(.bottom, 10)

                            ForEach(sampleTransactions.filter({
                                $0.category == selectedCategory.rawValue
                            })) { transaction in
                                TransactionCardView(transaction: transaction)
                            }
                        } header: {
                            headerView(size)
                        }
                    }
                    .padding(15)
                }
                .background(.gray.opacity(0.15))
                .blur(radius: showDateFilter ? 8 : 0)
                .disabled(showDateFilter)
            }
            .overlay {
                if showDateFilter {
                    DateFilterView(
                        start: startDate,
                        end: endDate,
                        onSubmit: { star, end in
                            startDate = star
                            endDate = end
                            showDateFilter = false
                        },
                        onClose: {
                            showDateFilter = false
                        }
                    )
                    .transition(.move(edge: .leading))
                }
            }
            .animation(.snappy, value: showDateFilter)
        }
    }
}

#Preview {
    Recents()
}
