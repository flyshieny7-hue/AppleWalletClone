import SwiftUI

class AnimationManager {
    static let shared = AnimationManager()

    private init() {}

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
}
