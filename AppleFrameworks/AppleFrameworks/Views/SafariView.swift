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
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> UIViewController {
        ViewController(nibName: "ViewController", bundle: nil)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
