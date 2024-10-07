//
//  NetworksHomeView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 11/09/24.
//

import SwiftUI

struct NetworksHomeView: View {
    @State var props: Props = .init(myNetworks: .init(header: "My Networks", myNetworks: [
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts"),
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts"),
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts"),
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts"),
        .init(title: "1", image: "app-clips", postCountInfo: "324 posts")

    ]))

    var body: some View {
        VStack(alignment: .leading, spacing: 48) {
            if let myNetworks = props.myNetworks {
                MyNetworkCarouselView(props: myNetworks)
            }
            Spacer()
        }
    }
}

#Preview {
    NetworksHomeView()
}

extension NetworksHomeView {
    struct Props {
        var myNetworks: MyNetworkCarouselView.Props?
    }
}
