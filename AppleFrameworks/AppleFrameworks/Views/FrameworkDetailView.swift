//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 31/08/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }, label: {
                    IconButton("xmark")
                })
            }
            Spacer()
            FrameworkView(framework: framework)
            Text(framework.description)
                .padding(.top, 40)
            Spacer()
            Button(action: {}, label: {
                PrimaryButton("Learn More")
            }).padding(.bottom, 16)
        }.padding(.horizontal, 16)
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}

struct PrimaryButton: View {
    let title: String
    let backGroundColor: Color
    
    init(_ title: String, backGroundColor: Color = .red) {
        self.title = title
        self.backGroundColor = backGroundColor
    }
    
    var body: some View {
        Text(title)
            .frame(minWidth: 280, minHeight: 50)
            .font(.title3)
            .fontWeight(.medium)
            .foregroundStyle(.white)
            .background(backGroundColor)
            .clipShape(.rect(cornerRadius: 12))
    }
}

struct IconButton: View {
    let iconName: String
    let width: CGFloat
    let height: CGFloat
    
    init(_ iconName: String,
         width: CGFloat = 44.0,
         height: CGFloat = 44.0) {
        self.iconName = iconName
        self.width = width
        self.height = height
    }
    var body: some View {
        Image(systemName: iconName)
            .foregroundStyle(Color(.label))
            .imageScale(.large)
            .frame(width: width, height: height)
    }
    
}
