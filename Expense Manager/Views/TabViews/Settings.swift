//
//  Settings.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

struct Settings: View {
    // User properties
    @AppStorage("UserName") var userName: String = ""

    // App lock properties
    @AppStorage("isAppLockEnabled") var isAppLockEnabled: Bool = false
    @AppStorage("isBackgroundLockEnabled") var isBackgroundLockEnabled: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section("username".capitalized) {
                    TextField("someName", text: $userName)
                }

                Section("app lock".capitalized) {
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)

                    if isAppLockEnabled {
                        Toggle("Lock when app goes backgeound", isOn: $isBackgroundLockEnabled)
                            .transition(.opacity)
                    }
                }
            }
            .animation(.easeInOut, value: isAppLockEnabled)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
