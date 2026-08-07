import SwiftUI

struct DoubleClickPromptView: View {
    @State private var pulseScale: CGFloat = 1.0
    @State private var pulseOpacity: Double = 1.0

    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.15))
                    .frame(width: 36, height: 36)
                    .scaleEffect(pulseScale)
                    .opacity(pulseOpacity)

                Image(systemName: "iphone.gen1.radiowaves.left.and.right")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }

            Text("Double Click to Pay")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                pulseScale = 1.15
                pulseOpacity = 0.4
            }
        }
    }
}

#Preview {
    DoubleClickPromptView()
        .padding()
        .background(Color.black)
}
