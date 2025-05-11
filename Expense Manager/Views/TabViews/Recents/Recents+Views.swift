//
//  Recents+Views.swift
//  Expense Manager
//
//  Created by Aditya on 11/05/25.
//

import SwiftUI

extension Recents {
    @ViewBuilder
    func headerView(_ size: CGSize) -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Welcome!")
                    .font(.title.bold())
                
                if !userName.isEmpty {
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            .visualEffect { content, geometryProxy in
                content
                    .scaleEffect(headerScale(size, proxy: geometryProxy), anchor: .topLeading)
            }

            Spacer(minLength: 0)

            NavigationLink {
                // Add expense here
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(appTint.gradient, in: .circle)
            }
        }
        .padding(.bottom, userName.isEmpty ? 10 : 5)
        .background {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                Divider()
            }
            .visualEffect({ content, geometryProxy in
                content
                    .opacity(headerBGOpacity(proxy: geometryProxy))
            })
            .padding(.horizontal, -15)  // padding of 15 is applied to LazyVStack
            .padding(.top, -(safeArea.top + 15))
        }
    }
}

extension Recents {
    /// Calculate scale of header text as user focefully scrolls down
    private func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = (min(max(progress, 0), 1)) * 0.5
        
        return 1 + scale
    }

    /// Calculate header BG opacity
    /// Opacity increases as user scrolls down
    private func headerBGOpacity(proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top // Since we ignored dafe area by applying negative padding, minY starts with safe area top value instead of 0; hence we add safeArea.top
        return minY > 0 ? 0 : (-minY / 20)
    }
}

#Preview {
    Recents()
}
