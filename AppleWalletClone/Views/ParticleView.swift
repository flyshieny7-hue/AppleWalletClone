import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    var position: CGPoint
    var velocity: CGPoint
    var size: CGFloat
    var opacity: Double
    var color: Color
    var rotation: Double
    var rotationSpeed: Double
    var lifetime: Double
    var age: Double = 0
}

struct ParticleView: View {
    @State private var particles: [Particle] = []
    @State private var timer: Timer?
    var particleCount: Int = 50
    var colors: [Color] = [.blue, .purple, .pink, .orange, .yellow]
    var burstOrigin: CGPoint = CGPoint(x: 0.5, y: 0.5)
    var isActive: Bool = true

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(particles) { particle in
                    ParticleShape()
                        .fill(particle.color)
                        .frame(width: particle.size, height: particle.size)
                        .position(
                            x: particle.position.x * geometry.size.width,
                            y: particle.position.y * geometry.size.height
                        )
                        .opacity(particle.opacity)
                        .rotationEffect(.degrees(particle.rotation))
                }
            }
        }
        .onAppear {
            if isActive {
                generateParticles()
                startAnimation()
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
        .onChange(of: isActive) { _, newValue in
            if newValue {
                generateParticles()
                startAnimation()
            } else {
                timer?.invalidate()
                particles.removeAll()
            }
        }
    }

    private func generateParticles() {
        particles = (0..<particleCount).map { _ in
            let angle = Double.random(in: 0...(2 * .pi))
            let speed = Double.random(in: 0.002...0.008)
            let size = CGFloat.random(in: 3...10)

            return Particle(
                position: burstOrigin,
                velocity: CGPoint(
                    x: cos(angle) * speed,
                    y: sin(angle) * speed - 0.003
                ),
                size: size,
                opacity: Double.random(in: 0.6...1.0),
                color: colors.randomElement() ?? .blue,
                rotation: Double.random(in: 0...360),
                rotationSpeed: Double.random(in: -5...5),
                lifetime: Double.random(in: 1.5...3.0)
            )
        }
    }

    private func startAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { _ in
            updateParticles()
        }
    }

    private func updateParticles() {
        let delta: Double = 1/60

        for index in particles.indices {
            particles[index].age += delta
            let lifeProgress = particles[index].age / particles[index].lifetime

            particles[index].position.x += particles[index].velocity.x
            particles[index].position.y += particles[index].velocity.y
            particles[index].velocity.y += 0.00005
            particles[index].rotation += particles[index].rotationSpeed
            particles[index].opacity = max(0, 1.0 - lifeProgress)
        }

        particles.removeAll { $0.age >= $0.lifetime }

        if particles.isEmpty && isActive {
            generateParticles()
        }
    }
}

struct ParticleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let size = min(rect.width, rect.height)

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.closeSubpath()

        return path
    }
}

struct SuccessParticlesView: View {
    @State private var showParticles = false
    var onComplete: () -> Void = {}

    var body: some View {
        ZStack {
            if showParticles {
                ParticleView(
                    particleCount: 80,
                    colors: [.green, .mint, .teal, .cyan, .white],
                    burstOrigin: CGPoint(x: 0.5, y: 0.4),
                    isActive: showParticles
                )
                .transition(.opacity)
            }

            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color(hex: "#34C759"))
                        .frame(width: 80, height: 80)
                        .scaleEffect(showParticles ? 1.0 : 0.0)
                        .animation(AnimationManager.shared.elasticPop, value: showParticles)

                    Image(systemName: "checkmark")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .scaleEffect(showParticles ? 1.0 : 0.0)
                        .animation(AnimationManager.shared.elasticPop.delay(0.1), value: showParticles)
                }

                Text("Done")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .opacity(showParticles ? 1 : 0)
                    .offset(y: showParticles ? 0 : 20)
                    .animation(.easeOut(duration: 0.3).delay(0.2), value: showParticles)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                showParticles = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showParticles = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    onComplete()
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SuccessParticlesView()
    }
}
