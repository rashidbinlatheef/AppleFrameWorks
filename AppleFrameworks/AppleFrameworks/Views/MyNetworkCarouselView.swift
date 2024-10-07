//
//  MyNetworkCarouselView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 11/09/24.
//

import SwiftUI

struct MyNetworkCarouselView: View {
    @State var props: Props = .init(header: "My Networks", myNetworks: [
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts"),
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts"),
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts"),
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts"),
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts")

    ])

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Text("Your Networks")
                    .lineLimit(1)
                Spacer()
                Text("See All")
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(props.myNetworks) { propsItem in
                        NetworkCardView(props: Binding(get: { propsItem },set: { _ in }))
                            .onTapGesture {
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    MyNetworkCarouselView()
}

extension MyNetworkCarouselView {
    struct Props {
        let header: String
        var myNetworks: [NetworkCardView.Props]
    }
}
