//
//  BottomSheetButton.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 17/09/24.
//

import Foundation
import SwiftUI

struct BottomSheetButton: View {
    let props: Props
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                if let imageName = props.imageName {
                    Image(systemName: imageName)
                }
                if let text = props.text {
                    Text(text)
                        .font(.headline)
                }
                Spacer()
            }
            .foregroundColor(.white)
            .background(Color.red) // Red background for the button
            .cornerRadius(8) // Rounded corners
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
extension BottomSheetButton: Props {
    struct Props: Defaultable, Identifiable {
        var id = UUID()
        let imageName: String?
        let text: String?

        static var defaultValue: BottomSheetButton.Props = .init(imageName: nil, text: nil)
    }
}
