//
//  FrameworkView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 31/08/24.
//

import SwiftUI

struct FrameworkView : View {
    let imageName: String
    let frameworkName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 90, height: 90)
                .aspectRatio(contentMode: .fit)
            Text(frameworkName)
                .font(.title3)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}


#Preview {
    FrameworkView(imageName: "app-clip", frameworkName: "App Clips")
}
