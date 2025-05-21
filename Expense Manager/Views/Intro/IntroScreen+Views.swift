//
//  IntroScreen+Views.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

extension IntroScreen {
    @ViewBuilder
    func pointsView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .frame(width: 45)
                .foregroundStyle(appTint.gradient)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subTitle)
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }

            Spacer()
        }
    }
}

#Preview(body: {
    IntroScreen()
})
