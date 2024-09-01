//
//  SafariView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 01/09/24.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariView : UIViewControllerRepresentable {
    let url: String
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: URL(string: url) ?? URL(string: "www.apple.com")!)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
