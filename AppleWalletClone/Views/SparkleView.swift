import SwiftUI

struct Sparkle: Identifiable {
    let id = UUID()
    var position: CGPoint
    var size: CGFloat
    var opacity: Double
    var rotation: Double
    var phase: Double
}

struct SparkleView: View {
    var sparkleCount: Int = 20
    var color: Color = .white
    var minSize: CGFloat = 2
    var maxSize: CGFloat = 6

    @State private var sparkles: [Sparkle] = []
    @State private var isAnimating = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(sparkles) { sparkle in
                    SparkleShape()
                        .fill(color)
                        .frame(width: sparkle.size, height: sparkle.size)
                        .position(sparkle.position)
                        .opacity(sparkle.opacity)
                        .rotationEffect(.degrees(sparkle.rotation))
                        .scaleEffect(sparkleOpacity(for: sparkle))
                }
            }
            .onAppear {
                generateSparkles(in: geometry.size)
                startAnimation()
            }
        }
    }

    private func generateSparkles(in size: CGSize) {
        sparkles = (0..<sparkleCount).map { _ in
            Sparkle(
                position: CGPoint(
                    x: CGFloat.random(in: 0...size.width),
                    y: CGFloat.random(in: 0...size.height)
                ),
                size: CGFloat.random(in: minSize...maxSize),
                opacity: Double.random(in: 0.3...0.9),
                rotation: Double.random(in: 0...360),
                phase: Double.random(in: 0...(2 * .pi))
            )
        }
    }

    private func sparkleOpacity(for sparkle: Sparkle) -> CGFloat {
        let twinkle = sin(sparkle.phase + Date().timeIntervalSince1970 * 3) * 0.5 + 0.5
        return CGFloat(twinkle)
    }

    private func startAnimation() {
        isAnimating = true
        Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { _ in
            guard isAnimating else { return }
            for index in sparkles.indices {
                sparkles[index].phase += 0.05
                sparkles[index].rotation += 1
            }
        }
    }
}

struct SparkleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2

        for i in 0..<4 {
            let angle = Double(i) * .pi / 2
            let innerRadius = radius * 0.3
            let outerRadius = radius

            let innerPoint = CGPoint(
                x: center.x + cos(angle) * innerRadius,
                y: center.y + sin(angle) * innerRadius
            )
            let outerPoint = CGPoint(
                x: center.x + cos(angle) * outerRadius,
                y: center.y + sin(angle) * outerRadius
            )

            if i == 0 {
                path.move(to: outerPoint)
            } else {
                path.addLine(to: outerPoint)
            }
            path.addLine(to: innerPoint)
        }

        path.closeSubpath()
        return path
    }
}

struct EliteSparkleOverlay: View {
    var tier: EliteTier
    var intensity: Double = 1.0

    var sparkleColor: Color {
        switch tier {
        case .centurion, .insignia:
            return Color(hex: "#C0A062")
        case .gold:
            return Color(hex: "#FFD700")
        case .platinum:
            return Color(hex: "#E8E8E8")
        case .black, .royal:
            return Color(hex: "#FF4D4D")
        case .infinite:
            return Color(hex: "#00AEEF")
        case .worldElite:
            return Color(hex: "#00FF88")
        case .theClass:
            return Color(hex: "#FF6B6B")
        case .silk:
            return Color(hex: "#C19EE0")
        case .reserve:
            return Color(hex: "#4ECDC4")
        default:
            return .white
        }
    }

    var sparkleCount: Int {
        switch tier {
        case .centurion, .insignia: return 30
        case .royal, .theClass: return 25
        case .infinite, .worldElite: return 20
        case .black, .reserve: return 18
        case .platinum, .gold: return 15
        default: return 10
        }
    }

    var body: some View {
        SparkleView(
            sparkleCount: Int(Double(sparkleCount) * intensity),
            color: sparkleColor,
            minSize: 2,
            maxSize: tier == .centurion || tier == .insignia ? 8 : 5
        )
        .opacity(tier == .standard ? 0 : 0.6)
    }
}

struct PulsingGlowView: View {
    var color: Color = .white
    var radius: CGFloat = 20

    @State private var pulseScale: CGFloat = 1.0
    @State private var pulseOpacity: Double = 0.5

    var body: some View {
        Circle()
            .fill(color.opacity(pulseOpacity))
            .frame(width: radius * 2, height: radius * 2)
            .blur(radius: radius)
            .scaleEffect(pulseScale)
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    pulseScale = 1.3
                    pulseOpacity = 0.2
                }
            }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        RoundedRectangle(cornerRadius: 20)
            .fill(Color(hex: "#1B3A5C"))
            .frame(height: 200)
            .overlay(
                EliteSparkleOverlay(tier: .centurion)
            )
            .padding(.horizontal, 20)
    }
}
