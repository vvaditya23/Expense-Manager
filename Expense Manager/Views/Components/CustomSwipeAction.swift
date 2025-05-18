//
//  CustomSwipeAction.swift
//  Expense Manager
//
//  Created by Aditya on 18/05/25.
//

import SwiftUI

///Swipe sirection
enum SwipeDirection {
    case leading
    case trailing

    var alignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}

struct CustomSwipeAction<Content: View>: View {
    var cornerRadius: CGFloat = 0
    var swipeDirection: SwipeDirection = .trailing

    @ViewBuilder var content: Content
    @ActionBuilder var actions: [SwipeAction]

    let viewdID = UUID()

    var body: some View {
        // Used to reset scroll view to it's original position when a swipe action is performed
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    content
                        .containerRelativeFrame(.horizontal)    // To take full available space
                        .background {   // FIXME: bg color is visible when segmented control is changed
                            if let firstAction = actions.first {
                                Rectangle()
                                    .fill(firstAction.tint)
                            }
                        }
                        .id(viewdID)

                    ActionButtons {
                        withAnimation(.snappy) {
                            scrollProxy.scrollTo(
                                viewdID,
                                anchor: swipeDirection == .trailing ? .topLeading : .topTrailing
                            )
                        }
                    }
                }
                .scrollTargetLayout()   // viewAligned scroll target behavior requires this modifier to be added inside the scrollView
                .visualEffect { visualEffect, geometryProxy in
                    visualEffect
                        .offset(x: scrollOffset(geometryProxy))
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .background {   // Gives a feel that button is being dragged as user performs horizontal swipe action
                // FIXME: bg color is visible when segmented control is changed
                if let lastAction = actions.last {
                    Rectangle()
                        .fill(lastAction.tint)
                }
            }
            .clipShape(.rect(cornerRadius: 10)) // Maintain corner radius when in swipe action
        }
    }
}

extension CustomSwipeAction {
    @ViewBuilder private func ActionButtons(resetPosition: @escaping () -> ()) -> some View {
        // Each button will have width of 100
        Rectangle()
            .fill(.clear)
            .frame(width: CGFloat(actions.count) * 100)
            .overlay(alignment: swipeDirection.alignment) {
                HStack(spacing: 0) {
                    ForEach(actions) { button in
                        Button {
                            Task {
                                resetPosition()
                            }
                        } label: {
                            Image(systemName: button.icon)
                                .font(button.iconFont)
                                .foregroundStyle(button.iconTint)
                                .frame(width: 100)
                                .frame(maxHeight: .infinity)
                                .contentShape(.rect)
                        }
                        .buttonStyle(.plain)
                        .background(button.tint)
                    }
                }
            }
    }
}

extension CustomSwipeAction {
    /// Prevents horizontal swipe action against configured swipe direction
    private func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX

        return swipeDirection == .trailing ? (minX > 0 ? -minX : 0) : (minX < 0 ? -minX : 0)
    }
}

@resultBuilder
struct ActionBuilder {
    static func buildBlock(_ components: SwipeAction...) -> [SwipeAction] {
        return components
    }
}

#Preview(body: {
    ContentView()
})
