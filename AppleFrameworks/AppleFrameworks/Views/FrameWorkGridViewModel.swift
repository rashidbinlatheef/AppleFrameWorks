//
//  FrameWorkGridViewModel.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 01/09/24.
//

import Foundation

final class FrameWorkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet {
            showDetailView = true
        }
    }
    @Published var showDetailView = false
}
