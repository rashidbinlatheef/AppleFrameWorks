//
//  PagedCards.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 16/09/24.
//

import SwiftUI

extension PagedCards {
    /// The properties structure for `PagedCards`, defining the content of the paged cards view.
    struct Props {
        /// The list of items to display in the paged cards, each conforming to `CardProps`.
        let items: [any Identifiable]
    }
}


struct PagedCards<Content: View>: View {
    let props: Props
    let content: () -> Content

    @State private var currentPage = 0
    
    var body: some View {
        VStack(spacing: 24) {
            // Swipeable Page Cards
            TabView(selection: $currentPage) {
                
//                ForEach(props.items.indices, id: \.self) { index in
//                    let item = props.items[index]
//                    content(item) // Pass the item to the content closure
//                        .tag(index) // Use the index as the tag
//                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default page control
            .animation(.easeInOut, value: currentPage) // Animate the tab swipe
            .background(.blue)
            // Custom Page Control
            PageControl(numberOfPages: props.items.count, currentPage: $currentPage)
                .background(.orange)
        }
    }
}

//#Preview {
//    PagedCards(props: .init(items: [
//        CustomPagedCardItemProps(title: "Page1"),
//        CustomPagedCardItemProps(title: "Page2"),
//        CustomPagedCardItemProps(title: "Page3"),
//        CustomPagedCardItemProps(title: "Page4"),
//        CustomPagedCardItemProps(title: "Page5")
//    ])) { item in
//        PageCardView(text: item.title)
//    }
//}

import SwiftUI

struct PageControl: View {
    let numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                RoundedRectangle(cornerRadius: 2.5)
                    .fill(index == currentPage ? Color.black : Color.gray.opacity(0.3))
                    .frame(width: index == currentPage ? 20 : 5, height: 5) // Animate width
                    .animation(.easeInOut, value: currentPage) // Smooth animation
                    .frame(width: 20, height: 5) // Max possible width to avoid layout jumps
            }
        }
    }
}

struct PageCardView: View {
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.blue.opacity(0.2))
                .shadow(radius: 5)
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(height: 464)
        .background(.cyan)
    }
}

struct CustomPagedCardItemProps: Identifiable {
    var id = UUID()
    let title: String
}
