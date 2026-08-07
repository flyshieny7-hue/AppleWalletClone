import SwiftUI

struct ConfettiPiece: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var rotation: Double
    var color: Color
    var size: CGSize
    var speed: CGFloat
    var wobble: Double
    var wobbleSpeed: Double
    var opacity: Double
}

struct ConfettiView: View {
    @State private var pieces: [ConfettiPiece] = []
    @State private var isAnimating = false
    var pieceCount: Int = 150
    var colors: [Color] = [
        .red, .blue, .green, .yellow, .orange,
        .purple, .pink, .cyan, .mint, .white
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(pieces) { piece in
                    ConfettiShape()
                        .fill(piece.color)
                        .frame(width: piece.size.width, height: piece.size.height)
                        .position(x: piece.x, y: piece.y)
                        .rotationEffect(.degrees(piece.rotation))
                        .opacity(piece.opacity)
                }
            }
            .onAppear {
                setupPieces(in: geometry.size)
                startAnimation(in: geometry.size)
            }
        }
    }

    private func setupPieces(in size: CGSize) {
        pieces = (0..<pieceCount).map { _ in
            ConfettiPiece(
                x: CGFloat.random(in: 0...size.width),
                y: -CGFloat.random(in: 20...200),
                rotation: Double.random(in: 0...360),
                color: colors.randomElement() ?? .blue,
                size: CGSize(
                    width: CGFloat.random(in: 6...14),
                    height: CGFloat.random(in: 6...14)
                ),
                speed: CGFloat.random(in: 2...6),
                wobble: Double.random(in: 0...2 * .pi),
                wobbleSpeed: Double.random(in: 2...6),
                opacity: 1.0
            )
        }
    }

    private func startAnimation(in size: CGSize) {
        isAnimating = true

        Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
            guard isAnimating else {
                timer.invalidate()
                return
            }

            for index in pieces.indices {
                pieces[index].y += pieces[index].speed
                pieces[index].rotation += 3
                pieces[index].wobble += pieces[index].wobbleSpeed * 0.02
                pieces[index].x += CGFloat(sin(pieces[index].wobble)) * 1.5

                if pieces[index].y > size.height + 50 {
                    pieces[index].y = -20
                    pieces[index].x = CGFloat.random(in: 0...size.width)
                    pieces[index].opacity = 1.0
                }

                if pieces[index].y > size.height - 100 {
                    pieces[index].opacity = max(0, 1.0 - (pieces[index].y - (size.height - 100)) / 150)
                }
            }
        }
    }

    func stop() {
        isAnimating = false
    }
}

struct ConfettiShape: Shape {
    func path(in rect: CGRect) -> Path {
        let shapeType = Int(rect.width) % 3
        var path = Path()

        switch shapeType {
        case 0:
            // Circle
            path.addEllipse(in: rect)
        case 1:
            // Rectangle
            path.addRect(rect)
        default:
            // Diamond
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.closeSubpath()
        }

        return path
    }
}

struct ConfettiBurstView: View {
    @State private var showConfetti = false
    var onComplete: () -> Void = {}

    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
                .opacity(showConfetti ? 1 : 0)

            if showConfetti {
                ConfettiView(pieceCount: 200)
                    .transition(.opacity)
            }

            VStack(spacing: 20) {
                Text("🎉")
                    .font(.system(size: 60))
                    .scaleEffect(showConfetti ? 1.0 : 0.0)
                    .animation(AnimationManager.shared.elasticPop, value: showConfetti)

                Text("Success!")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .opacity(showConfetti ? 1 : 0)
                    .animation(.easeOut(duration: 0.3).delay(0.1), value: showConfetti)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                showConfetti = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showConfetti = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    onComplete()
                }
            }
        }
    }
}

#Preview {
    ConfettiBurstView()
}
