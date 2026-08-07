import SwiftUI
import CoreMotion

@Observable
class MotionManager {
    private let motion = CMMotionManager()
    var pitch: Double = 0
    var roll: Double = 0
    var isActive: Bool = false

    func start() {
        guard motion.isDeviceMotionAvailable else { return }
        motion.deviceMotionUpdateInterval = 1/60
        motion.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let data = data else { return }
            self?.pitch = data.attitude.pitch
            self?.roll = data.attitude.roll
        }
        isActive = true
    }

    func stop() {
        motion.stopDeviceMotionUpdates()
        isActive = false
    }

    var parallaxOffset: CGSize {
        CGSize(
            width: roll * 15,
            height: pitch * 15
        )
    }
}
