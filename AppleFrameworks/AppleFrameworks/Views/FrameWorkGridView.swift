//
//  FrameWorkGridView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 31/08/24.
//

import SwiftUI

struct FrameWorkGridView: View {
    private let frameworks = MockData.frameworks
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(frameworks, id: \.id) { framework in
                    FrameworkView(imageName: framework.imageName, frameworkName: framework.name)
                }
            }
        }
    }
}

#Preview {
    FrameWorkGridView()
}
