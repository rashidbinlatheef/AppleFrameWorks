//
//  NetworkCardView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 11/09/24.
//

import SwiftUI

struct NetworkCardView: View {
    @Binding var props: Props

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Image
            ZStack {
                AsyncImage(url: URL(string: "https://assets.mindvalley.com/api/v1/assets/a89b9d20-8462-4dfa-80f1-a46233a510d0.png")!) {
                    image in
                    image.image?.resizable()
                }
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                VStack {
                    Spacer()
                    AsyncImage(url: URL(string: "https://assets.mindvalley.com/api/v1/assets/e9d1c145-74f4-417f-8bcc-7d4242cfb609.jpg")!) {
                        image in
                        image.image?.resizable()
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 54)
                }.padding(.bottom, 24)
            }
            .frame(width: 320, height: 320)
            // Name
            VStack(alignment: .leading,spacing: 4) {
                Text("Body Language for Dating")
                    .lineLimit(1)
                // Post count with icon
                HStack(spacing: 4) {
                    Image(systemName: "lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 13)
                    Text("345 new posts")

                }
            }
        }
        .background(.green)
        .frame(width: 320) // Fixed width for the item
    }
}

#Preview {
    NetworkCardView(props: .constant(.init(title: "das", image: "", postCountInfo: "6 new posts")))
}

extension NetworkCardView {
    struct Props: Identifiable {
        var id = UUID.init()
        let title: String
        let image: String?
        let postCountInfo: String?
    }
}
