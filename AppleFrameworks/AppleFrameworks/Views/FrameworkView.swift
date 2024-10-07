//
//  FrameworkView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 31/08/24.
//

import SwiftUI

struct FrameworkView : View {
    static let minimumSize: CGFloat = 100
    static let maximumSize: CGFloat = 150

    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
                .aspectRatio(contentMode: .fit)
            Text(framework.name)
                .foregroundStyle(Color(.label))
                .font(.title3)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}


#Preview {
    FrameworkView(framework: MockData.sampleFramework)
}



//var body: some View {
//    HStack(spacing: 15) {
//        Image("img-empty-event")
//            .scaledToFill()
//            .frame(width: 87, height: 49)
//            .cornerRadius(5)
//        
//        VStack(spacing: 2) {
//            Text("AI Mastery")
//            Text("Updated 9m ago")
//        }
//        Spacer()
//        NGButton(title: "Join", style: .primary, size: .xsmall) {
//        }
//    }
//}
