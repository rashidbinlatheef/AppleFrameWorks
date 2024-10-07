//
//  ViewController.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 17/09/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func showView() {
        // Create the SwiftUI view
        let leaveNetworkView = NGActionSheet(
            actionItems: [
                Text("Report Post")
                    .frame(height: 36),
                Text("Delete")
                    .frame(height: 36),
                Text("Pin")
                    .frame(height: 36),
                Text("Edit")
                    .frame(height: 36),
                Text("Copy Link")
                    .frame(height: 36)
            ],
            cancelItems: [
                Text("Cancel")
                    .frame(height: 36)
            ], onDismiss: {}
        )


               // Wrap it in a UIHostingController
               let hostingController = UIHostingController(rootView: leaveNetworkView)

               // Optional: Set modal presentation style (e.g., pageSheet for bottom sheet-like presentation)
        hostingController.modalPresentationStyle = .custom

               // Present the UIHostingController modally
               present(hostingController, animated: false, completion: nil)
    }

}
