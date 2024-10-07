import SwiftUI
struct NGActionSheet<ActionItem: View, CancelItem: View>: View {
    let actionItems: [ActionItem]
    let cancelItems: [CancelItem]
    let onDismiss: () -> ()

    @Environment(\.presentationMode) var presentationMode
    @State private var isVisible = false // Controls the visibility for animation
    @State private var showBackground = false // Controls background animation

    var body: some View {
        ZStack(alignment: .bottom) {
            // Background tap gesture to dismiss
            Color.black
                .opacity(isVisible ? 0.4 : 0) // Fade in/out effect
                .scaleEffect(isVisible ? 1 : 1.02) // Slight scaling effect
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismissWithAnimation()
                }
                .animation(.easeInOut(duration: 0.3), value: isVisible)
            
            // Action sheet content anchored at the bottom
            VStack(spacing: 20) {
                Spacer().frame(height: 40)
                
                // Action items
                ForEach(actionItems.indices, id: \.self) { index in
                    actionItems[index]
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 16)
                }
                
                // Cancel items
                ForEach(cancelItems.indices, id: \.self) { index in
                    cancelItems[index]
                        .padding(.top, 16)
                        .padding(.horizontal, 36)
                        .padding(.bottom, 28)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .cornerRadius(16, corners: [.topLeft, .topRight])
            .offset(y: isVisible ? 0 : UIScreen.main.bounds.height) // Move up/down from bottom
            .opacity(isVisible ? 1 : 0) // Fade in/out effect
            .animation(.easeInOut(duration: 0.3), value: isVisible)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            // Animate the sheet appearing
            withAnimation {
                isVisible = true
            }
        }
    }
    
    private func dismissWithAnimation() {
        // Animate the sheet disappearing
        withAnimation {
            isVisible = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            presentationMode.wrappedValue.dismiss()  // SwiftUI dismiss without UIKit

        }
    }
}



//#Preview {
//    NGActionSheet(props: .defaultValue)
//}


//MARK: - Corner radius -
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
