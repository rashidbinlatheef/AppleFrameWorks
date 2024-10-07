//
//  NetworkLiveCallCard.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 16/09/24.
//

import SwiftUI

struct NetworkLiveCallCard: View {
    let props: Props
    
    var body: some View {
        HStack(alignment:.top) {
            ZStack {
                Image("app-clip")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .scaledToFit()
                    .clipped()
            }
            .frame(width: 42, height: 42)
            .background(.green)
            .cornerRadius(21)
            VStack(alignment: .leading, spacing: 8) {
                Text("Tapping Intodd The Full Potential Of Structured Response")
                Text("Thu, 12 Sep, 11:00pm")
                    .lineLimit(2)
            }
        }
        .padding(.all, 16)
    }
}

extension NetworkLiveCallCard: Props {
    struct Props: Defaultable, Identifiable {
        var id = UUID()
        let info: String
        
        static var defaultValue: NetworkLiveCallCard.Props = .init(info: "")
    }
}

#Preview {
    NetworkLiveCallCard(props: .init(info: "dasds"))
}
