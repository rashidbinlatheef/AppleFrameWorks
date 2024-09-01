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
                        FrameworkView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }.padding(.top, 10)
                .navigationTitle("🍎 Apple Frameworks")
        }.sheet(isPresented: $viewModel.showDetailView, content: {
            FrameworkDetailView(framework: viewModel.selectedFramework!)
        })
    }
}

#Preview {
    FrameWorkGridView()
}
