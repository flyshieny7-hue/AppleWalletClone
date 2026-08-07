import SwiftUI

struct ShimmerView: View {
    @State private var shimmerOffset: CGFloat = -400
    var shimmerColor: Color = .white
    var opacity: Double = 0.15
    var duration: Double = 1.8
    var cornerRadius: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.clear

                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.clear,
                        shimmerColor.opacity(opacity),
                        shimmerColor.opacity(opacity * 1.5),
                        shimmerColor.opacity(opacity),
                        Color.clear
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: geometry.size.width * 2)
                .offset(x: shimmerOffset)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
        }
        .onAppear {
            withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                shimmerOffset = 400
            }
        }
    }
}

struct ShimmerOverlay: ViewModifier {
    @State private var isAnimating = false
    var active: Bool = true

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geo in
                    if active {
                        ShimmerView(
                            shimmerColor: .white,
                            opacity: 0.12,
                            duration: 2.0,
                            cornerRadius: 12
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            )
    }
}

struct AnimatedShimmerCard: View {
    var colors: [Color] = [.white.opacity(0.1), .white.opacity(0.2), .white.opacity(0.1)]
    var duration: Double = 2.5

    @State private var phase: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    .init(x: 0, y: 0),
                    .init(x: 0.5 + sin(phase) * 0.1, y: 0),
                    .init(x: 1, y: 0),
                    .init(x: 0, y: 0.5 + cos(phase) * 0.1),
                    .init(x: 0.5, y: 0.5),
                    .init(x: 1, y: 0.5 + sin(phase + .pi) * 0.1),
                    .init(x: 0, y: 1),
                    .init(x: 0.5 + cos(phase + .pi/2) * 0.1, y: 1),
                    .init(x: 1, y: 1)
                ],
                colors: colors
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .onAppear {
            withAnimation(.linear(duration: duration).repeatForever(autoreverses: true)) {
                phase = .pi * 2
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hex: "#1B3A5C"))
                .frame(height: 200)
                .overlay(
                    ShimmerView(shimmerColor: .white, opacity: 0.15, cornerRadius: 20)
                )

            AnimatedShimmerCard()
                .frame(height: 200)
        }
        .padding(.horizontal, 20)
    }
}
