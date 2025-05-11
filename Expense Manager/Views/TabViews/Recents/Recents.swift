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

    var body: some View {
        GeometryReader {
            // For animation
            let size = $0.size
            
            NavigationStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {
                            // Date filter button here
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
