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
                                // Date button action here
                            } label: {
                                Text("\(format(date: startDate, format: "dd - MMM yy")) to \(format(date: endDate, format: "dd - MMM yy"))")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            }
                            .hSpacing(.leading)
                            
                            // Stats card view here
                        } header: {
                            headerView(size)
                        }

                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    Recents()
}
