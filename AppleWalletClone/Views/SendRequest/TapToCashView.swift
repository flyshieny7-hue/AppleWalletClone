import SwiftUI

struct TapToCashView: View {
    let amount: Double
    let contact: String
    let onComplete: () -> Void

    @State private var pulseScale: CGFloat = 1.0
    @State private var pulseOpacity: Double = 0.6
    @State private var rotation: Double = 0
    @State private var showComplete = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.92)
                .ignoresSafeArea()

            VStack(spacing: 32) {
                Spacer()

                if !showComplete {
                    ZStack {
                        Circle()
                            .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                            .frame(width: 200, height: 200)
                            .scaleEffect(pulseScale)
                            .opacity(pulseOpacity)

                        Circle()
                            .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                            .frame(width: 280, height: 280)
                            .scaleEffect(pulseScale * 0.7)
                            .opacity(pulseOpacity)

                        Image(systemName: "iphone.gen1.radiowaves.left.and.right")
                            .font(.system(size: 48, weight: .light))
                            .foregroundColor(.blue)
                            .rotationEffect(.degrees(rotation))
                    }

                    VStack(spacing: 8) {
                        Text("Tap to Cash")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)

                        Text("Looking for \(contact)...")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white.opacity(0.6))
                    }
                } else {
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(width: 120, height: 120)

                            Image(systemName: "checkmark")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.blue)
                        }

                        VStack(spacing: 6) {
                            Text("Transfer Complete")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)

                            Text(amount.currencyFormatted())
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .contentTransition(.numericText())
                        }
                    }
                    .transition(.scale.combined(with: .opacity))
                }

                Spacer()
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                pulseScale = 1.4
                pulseOpacity = 0
            }
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                rotation = 360
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                    showComplete = true
                }
                HapticManager.shared.success()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                onComplete()
            }
        }
    }
}

#Preview {
    TapToCashView(amount: 50.00, contact: "Alice Johnson", onComplete: {})
}
