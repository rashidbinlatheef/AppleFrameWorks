//
//  FrameWorkGridView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 31/08/24.
//

import SwiftUI

struct FrameWorkGridView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: columns) {
            FrameworkView(imageName: "app-clip", frameworkName: "App Clips")
            FrameworkView(imageName: "app-clip", frameworkName: "App Clips")
            FrameworkView(imageName: "app-clip", frameworkName: "App Clips")
            FrameworkView(imageName: "app-clip", frameworkName: "App Clips")
            FrameworkView(imageName: "app-clip", frameworkName: "App Clips")
        }
    }
}

#Preview {
    FrameWorkGridView()
}
