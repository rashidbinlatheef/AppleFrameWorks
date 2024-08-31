//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 31/08/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .gray],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            VStack {
                Spacer()
                FrameworkView(framework: MockData.sampleFramework)
                    .foregroundStyle(.white)
                Text("afasfasfasfasfasfasf afafafafadfdsa afasfasfasfa sfasfasfafafafafadfdsa afasfasfasfasfasfasfafafafafadfdsa afasfasfasfas fasfasfafafafafadfdsa afasfasfasfasf asfasfaf afafafadfdsa afasfasfasfasfasfasfafafafafadfdsa afasfasfasfasfasfasfafafafafadfdsa afasfasfasfas fasfasfafafafafadfdsa")
                    .padding(.top, 40)
                    .padding(.horizontal, 16)
                    .foregroundStyle(.white)
                Spacer()
                Button(action: {}, label: {
                    PrimaryButton("Learn More")
                }).padding(.bottom, 16)
            }
        }.ignoresSafeArea()
        
    }
}

#Preview {
    FrameworkDetailView()
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
            .frame(minWidth: 200, minHeight: 40)
            .font(.title3)
            .fontWeight(.medium)
            .foregroundStyle(.white)
            .padding(.all, 10)
            .background(backGroundColor)
            .clipShape(.rect(cornerRadius: 12))
    }
}
