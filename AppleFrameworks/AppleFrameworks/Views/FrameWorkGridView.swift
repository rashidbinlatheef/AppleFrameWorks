//
//  FrameWorkGridView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 31/08/24.
//

import SwiftUI

struct FrameWorkGridView: View {
    @StateObject private var viewModel = FrameWorkGridViewModel()
    private let frameworks = MockData.frameworks
    private var columns = [GridItem(.adaptive(minimum: FrameworkView.minimumSize))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(frameworks, id: \.id) { framework in
                        NavigationLink(value: framework) {
                            FrameworkView(framework: framework)
                        }
                    }
                }
            }
            .padding(.top, 10)
            .navigationTitle("🍎 Apple Frameworks")
            .navigationDestination(for: Framework.self, destination: { framework in
                FrameworkDetailView(framework: framework)
            })
        }        
    }
}

#Preview {
    FrameWorkGridView()
}
