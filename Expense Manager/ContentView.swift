//
//  ContentView.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

struct ContentView: View {
    /// Intro visibility status
    @AppStorage("IsFirstTime") private var isFirstTime = true

    /// Active tab
    @State private var activeTab: Tab = .recents

    var body: some View {
        TabView(selection: $activeTab) {
            Text("Recents")
                .tag(Tab.recents)
                .tabItem({
                    Tab.recents.tabContent
                })

            Text("Search")
                .tag(Tab.search)
                .tabItem({
                    Tab.search.tabContent
                })

            Text("Charts")
                .tag(Tab.charts)
                .tabItem({
                    Tab.charts.tabContent
                })

            Text("Settings")
                .tag(Tab.settings)
                .tabItem({
                    Tab.settings.tabContent
                })
        }
        .sheet(isPresented: $isFirstTime) {
            IntroScreen()
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    ContentView()
}
