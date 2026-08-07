import SwiftUI
import CoreMotion

@Observable
class MotionManager {
    private let motion = CMMotionManager()
    var pitch: Double = 0
    var roll: Double = 0
    var yaw: Double = 0
    var isActive: Bool = false
    var acceleration: CMAcceleration = CMAcceleration(x: 0, y: 0, z: 0)
    var rotationRate: CMRotationRate = CMRotationRate(x: 0, y: 0, z: 0)

    // MARK: - Parallax
    var parallaxOffset: CGSize {
        CGSize(
            width: roll * 20,
            height: pitch * 20
        )
    }

    var subtleParallax: CGSize {
        CGSize(
            width: roll * 8,
            height: pitch * 8
        )
    }

    // MARK: - 3D Rotation
    var rotation3D: (x: Double, y: Double, z: Double) {
        (
            x: pitch * 12,
            y: roll * 12,
            z: yaw * 5
        )
    }

    var cardTilt: (x: Double, y: Double) {
        (
            x: pitch * 8,
            y: roll * 8
        )
    }

    // MARK: - Depth Effect
    var depthIntensity: Double {
        let total = abs(pitch) + abs(roll)
        return min(total * 2, 1.0)
    }

    // MARK: - Swipe Rotation
    func swipeRotation(progress: Double) -> Double {
        let baseRotation = roll * 10
        let swipeRotation = progress * 30
        return baseRotation + swipeRotation
    }

    // MARK: - Life Cycle
    func start() {
        guard motion.isDeviceMotionAvailable else { return }
        motion.deviceMotionUpdateInterval = 1/60
        motion.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let data = data else { return }
            self?.pitch = data.attitude.pitch
            self?.roll = data.attitude.roll
            self?.yaw = data.attitude.yaw
            self?.acceleration = data.userAcceleration
            self?.rotationRate = data.rotationRate
        }
        isActive = true
    }

    func startWithAccelerometer() {
        guard motion.isAccelerometerAvailable else { return }
        motion.accelerometerUpdateInterval = 1/60
        motion.startAccelerometerUpdates(to: .main) { [weak self] data, _ in
            guard let data = data else { return }
            self?.acceleration = data.acceleration
        }
        isActive = true
    }

    func stop() {
        motion.stopDeviceMotionUpdates()
        motion.stopAccelerometerUpdates()
        isActive = false
    }

    // MARK: - Shake Detection
    func isShaking(threshold: Double = 2.0) -> Bool {
        let magnitude = sqrt(
            acceleration.x * acceleration.x +
            acceleration.y * acceleration.y +
            acceleration.z * acceleration.z
        )
        return magnitude > threshold
    }

    // MARK: - Tilt Direction
    enum TiltDirection {
        case none, left, right, up, down
    }

    var tiltDirection: TiltDirection {
        if roll > 0.3 { return .left }
        if roll < -0.3 { return .right }
        if pitch > 0.3 { return .up }
        if pitch < -0.3 { return .down }
        return .none
    }
}

// MARK: - Motion Effect Modifier
struct Motion3DEffect: ViewModifier {
    @StateObject private var motion = MotionManager()
    var intensity: Double = 1.0

    func body(content: Content) -> some View {
        content
            .offset(
                x: motion.parallaxOffset.width * intensity,
                y: motion.parallaxOffset.height * intensity
            )
            .rotation3DEffect(
                .degrees(motion.rotation3D.x * intensity),
                axis: (x: 1, y: 0, z: 0)
            )
            .rotation3DEffect(
                .degrees(motion.rotation3D.y * intensity),
                axis: (x: 0, y: 1, z: 0)
            )
            .onAppear { motion.start() }
            .onDisappear { motion.stop() }
    }
}

extension View {
    func motion3DEffect(intensity: Double = 1.0) -> some View {
        self.modifier(Motion3DEffect(intensity: intensity))
    }
}
