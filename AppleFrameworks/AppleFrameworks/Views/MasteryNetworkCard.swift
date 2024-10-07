//
//  MasteryNetworkCard.swift
//  AppleFrameworks
//
//  Created by Muhammed Rashid on 14/09/24.
//

import Combine
import SwiftUI
import UIKit

struct MasteryNetworkCard: View {
    let props: Props
    
    var body: some View {
        Image("user")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .overlay(alignment: .bottom) {
                VStack {
                    Spacer()
                    // Watermark Image
                    Image("watermark")
                        .frame(maxWidth: .infinity, maxHeight: 84)
                        .scaledToFit()
                        .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 20)
                    // Network Items View (with swipe behavior)
                    if let networkItems = props.networkItems {
                        NetworkItemsCard(props: networkItems)
                            .frame(height: 92)
                            .frame(maxWidth: .infinity)
                            .padding(.all, 0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .cornerRadius(16)
            .clipped()
    }
}


extension MasteryNetworkCard: Props {
    struct Props: Defaultable, Identifiable {
        var id = UUID()
        let imageUrl: URL?
        let waterMarkImageUrl: URL?
        let networkItems: NetworkItemsCard.Props?
        
        static var defaultValue: MasteryNetworkCard.Props = .init(imageUrl: nil,
                                                                  waterMarkImageUrl: nil,
                                                                  networkItems: nil)
    }
}

#Preview {
    MasteryNetworkCard(props: .init(imageUrl:URL(string: "https://fastly.picsum.photos/id/625/200/300.jpg?hmac=UsuVBhEWUK8nKZTPbU9D1_ENYqppSfiLsX8SIHskOfw"),
                                    waterMarkImageUrl: URL(string:"https://fastly.picsum.photos/id/316/200/300.jpg?hmac=sq0VBO6H0wGg9Prod7MVUUB_7B91kmD5E1X1TRSo66U"), networkItems: .init(networkItems: [
                                        .announcement(props: .defaultValue)
//                                        .liveCall(props: .defaultValue),
//                                        .post(props: .defaultValue)
                                    ])))
}

struct NetworkAnnouncementCard: View {
    let props: Props
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                Image("swiftui")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .clipped()
            }
            .frame(width: 42, height: 42)
            .background(Color.green)
            .cornerRadius(21)

            VStack(alignment: .leading, spacing: 8) {
                Text("mmmmmmmmm")
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .leading) // Fill the available space
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity) // Make the HStack fill the available width
        .background(Color.gray.opacity(0.1)) // Optional: background color for clarity
    }
}


// Enum for different network items
enum NetworkItems {
    case post(props: NetworkPostCard.Props)
    case liveCall(props: NetworkLiveCallCard.Props)
    case announcement(props: NetworkAnnouncementCard.Props)
}

// NetworkItemsCard - dynamically render based on item type
struct NetworkItemsCard: View {
    let props: Props
    @State private var currentItemIndex = 0
    @State private var animateTransition = false
    @State private var timerCancellable: AnyCancellable?
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                if let networkItems = props.networkItems,
                   !networkItems.isEmpty,
                   currentItemIndex < networkItems.count  {
                    Text("has net sdsdsa workhas networkhas networkhas networkhas networkhas networkhas networkhas networkhas network")
                        .frame(width: 320, height: 200) // Use GeometryReader for width
                        .lineLimit(2)


    //                currentItemView(for: networkItems[currentItemIndex])
    //                    .transition(animateTransition ? .move(edge: .top) : .move(edge: .bottom))
    //                    .animation(.easeInOut, value: animateTransition)
    //                    .frame(maxWidth: .infinity) // Ensure full width inside the card
    //                    .onAppear {
    //                        startTimer()
    //                    }
    //                    .onDisappear {
    //                        stopTimer()
    //                    }
    //                    .padding(.all, 0)
                } else {
                    // Handle the empty case, return an empty view or show a placeholder if necessary
                    Text("asdsad")
                }
            }
            .frame(maxWidth: geometry.size.width) // Ensure the card fills the parent width
            .background(.blue)
            .clipped()
            
        }
        
    }
    
    // Display the current network item based on the index
    @ViewBuilder
    private func currentItemView(for item: NetworkItems) -> some View {
        switch item {
        case .post(let props):
            NetworkPostCard(props: props)
        case .liveCall(let props):
            NetworkLiveCallCard(props: props)
        case .announcement(let props):
            NetworkAnnouncementCard(props: props)
        }
    }
    
    private func startTimer() {
        let transitionDuration: TimeInterval = 5
        timerCancellable = Timer.publish(every: transitionDuration, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                withAnimation {
                    animateTransition.toggle()
                    currentItemIndex = (currentItemIndex + 1) % (props.networkItems?.count ?? 1)
                }
            }
    }
    
    // Stop the timer when the view is no longer visible
    private func stopTimer() {
        timerCancellable?.cancel()
    }
}

extension NetworkItemsCard: Props {
    struct Props: Defaultable, Identifiable {
        var id = UUID()
        let networkItems: [NetworkItems]?
        
        static var defaultValue: NetworkItemsCard.Props = .init(networkItems: nil)
    }
}

struct NetworkPostCard: View {
    let props: Props
    
    var body: some View {
        HStack(alignment:.top) {
            ZStack {
                Image("app-clip")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .scaledToFit()
                    .background(.green)
                    .cornerRadius(21)
                    .clipped()
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("I know a lot of people were struggling to keep up with todays I know a lot of people were struggling to keep up with todays")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
    }
}

extension NetworkPostCard: Props {
    struct Props: Defaultable, Identifiable {
        var id = UUID()
        let info: String
        
        static var defaultValue: NetworkPostCard.Props = .init(info: "")
    }
}

extension NetworkAnnouncementCard: Props {
    struct Props: Defaultable, Identifiable {
        var id = UUID()
        let info: String
        
        static var defaultValue: NetworkAnnouncementCard.Props = .init(info: "")
    }
}

//#Preview {
//    VStack {
//        NetworkLiveCallCard(props: .defaultValue)
//        Spacer()
//    }
//    .background(.yellow)
//    .clipped()
//}

protocol Props {
    associatedtype Props: Defaultable
    var props: Props { get }
}

protocol Defaultable {
    static var defaultValue: Self { get }
}
