//
//  IntroScreen.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

struct IntroScreen: View {
    @AppStorage("IsFirstTime") private var isFirstTime = true

    var body: some View {
        VStack(spacing: 15) {
            Text("Whats New in the\nExpense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)

            /// Points view
            VStack(alignment: .leading, spacing: 25) {
                pointsView(symbol: "dollarsign", title: "Transactions", subTitle: "Keep track of your earnings and expenses.")

                pointsView(symbol: "chart.bar.fill", title: "Visual Charts", subTitle: "View your transactions using eye-catching graphic representations.")

                pointsView(symbol: "magnifyingglass", title: "Advance filters", subTitle: "Find the expenses you want by advance search and filtering.")
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 10)

            Button {
                isFirstTime = false
            } label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(.blue.gradient, in: .rect(cornerRadius: 12))
            }
        }
        .padding(15)
    }
}

#Preview {
    IntroScreen()
}
