import SwiftUI

class AnimationManager {
    static let shared = AnimationManager()

    private init() {}

    // MARK: - Spring Animations
    var cardSpring: Animation {
        .spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.2)
    }

    var cardExpand: Animation {
        .spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.3)
    }

    var cardCollapse: Animation {
        .spring(response: 0.35, dampingFraction: 0.8, blendDuration: 0.15)
    }

    var sheetPresent: Animation {
        .spring(response: 0.45, dampingFraction: 0.85, blendDuration: 0.25)
    }

    var successBounce: Animation {
        .interpolatingSpring(stiffness: 200, damping: 15)
    }

    var elasticPop: Animation {
        .interpolatingSpring(stiffness: 300, damping: 12)
    }

    var gentleSpring: Animation {
        .spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.3)
    }

    var snappySpring: Animation {
        .spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.1)
    }

    var ultraSmooth: Animation {
        .spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0.4)
    }

    // MARK: - Card Flip Animation
    var cardFlip: Animation {
        .easeInOut(duration: 0.6)
    }

    var cardFlipSpring: Animation {
        .interpolatingSpring(stiffness: 150, damping: 20)
    }

    // MARK: - Elastic Transitions
    var elasticIn: Animation {
        .interpolatingSpring(stiffness: 170, damping: 15, initialVelocity: 5)
    }

    var elasticOut: Animation {
        .interpolatingSpring(stiffness: 170, damping: 15, initialVelocity: -5)
    }

    var bounceIn: Animation {
        .interpolatingSpring(stiffness: 100, damping: 10, initialVelocity: 8)
    }

    // MARK: - Particle System Timing
    var particleBurst: Animation {
        .easeOut(duration: 0.8)
    }

    var particleFade: Animation {
        .easeIn(duration: 1.2)
    }

    // MARK: - Shimmer Animation
    var shimmerSlide: Animation {
        .linear(duration: 1.8).repeatForever(autoreverses: false)
    }

    // MARK: - Gradient Animation
    var gradientShift: Animation {
        .linear(duration: 4).repeatForever(autoreverses: true)
    }

    var gradientPulse: Animation {
        .easeInOut(duration: 3).repeatForever(autoreverses: true)
    }

    // MARK: - Sparkle Animation
    var sparkleTwinkle: Animation {
        .easeInOut(duration: 0.8).repeatForever(autoreverses: true)
    }

    // MARK: - Confetti Animation
    var confettiFall: Animation {
        .easeIn(duration: 2.5)
    }

    // MARK: - Haptic-Enhanced Animations
    func withHaptic(_ style: UIImpactFeedbackGenerator.FeedbackStyle, animation: Animation) -> Animation {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
        return animation
    }

    // MARK: - Card Position Helpers
    func cardOffset(for index: Int, total: Int, isExpanded: Bool) -> CGFloat {
        if isExpanded {
            return CGFloat(index) * 220
        } else {
            return CGFloat(index) * 12
        }
    }

    func cardScale(for index: Int, total: Int, isExpanded: Bool) -> CGFloat {
        if isExpanded { return 1.0 }
        let progress = CGFloat(index) / CGFloat(max(total - 1, 1))
        return 1.0 - (progress * 0.03)
    }

    // MARK: - 3D Rotation Helpers
    func rotation3D(for progress: Double, axis: (x: CGFloat, y: CGFloat, z: CGFloat)) -> (angle: Double, axis: (x: CGFloat, y: CGFloat, z: CGFloat)) {
        let angle = progress * 180
        return (angle, axis)
    }

    // MARK: - Depth Effect
    func depthScale(for offset: CGFloat, maxOffset: CGFloat) -> CGFloat {
        let normalized = min(abs(offset) / maxOffset, 1.0)
        return 1.0 - (normalized * 0.15)
    }

    func depthOpacity(for offset: CGFloat, maxOffset: CGFloat) -> Double {
        let normalized = min(abs(offset) / maxOffset, 1.0)
        return 1.0 - (normalized * 0.4)
    }

    // MARK: - Staggered Animation
    func staggeredDelay(for index: Int, baseDelay: Double = 0.05) -> Double {
        return Double(index) * baseDelay
    }

    // MARK: - Smooth Damping
    func smoothDamping(current: CGFloat, target: CGFloat, velocity: inout CGFloat, stiffness: CGFloat = 150, damping: CGFloat = 15, delta: CGFloat = 1/60) -> CGFloat {
        let displacement = target - current
        let springForce = stiffness * displacement
        let dampingForce = damping * velocity
        let acceleration = springForce - dampingForce
        velocity += acceleration * delta
        return current + velocity * delta
    }
}

// MARK: - View Extension for Smooth Animations
extension View {
    func smoothAnimation(_ animation: Animation = AnimationManager.shared.cardSpring) -> some View {
        self.animation(animation, value: UUID())
    }

    func withElasticTransition() -> some View {
        self.transition(
            .asymmetric(
                insertion: .scale.combined(with: .opacity).animation(AnimationManager.shared.elasticIn),
                removal: .scale.combined(with: .opacity).animation(AnimationManager.shared.elasticOut)
            )
        )
    }

    func withCardFlipTransition() -> some View {
        self.transition(
            .asymmetric(
                insertion: .scale(scale: 0.8, anchor: .center)
                    .combined(with: .opacity)
                    .combined(with: .rotation3DEffect(.degrees(-90), axis: (x: 0, y: 1, z: 0)))
                    .animation(AnimationManager.shared.cardFlipSpring),
                removal: .scale(scale: 1.2, anchor: .center)
                    .combined(with: .opacity)
                    .combined(with: .rotation3DEffect(.degrees(90), axis: (x: 0, y: 1, z: 0)))
                    .animation(AnimationManager.shared.cardFlipSpring)
            )
        )
    }
}
