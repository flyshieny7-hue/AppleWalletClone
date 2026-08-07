import SwiftUI

class CardManager {
    static let shared = CardManager()

    private init() {}

    func formatCardNumber(_ number: String, network: CardNetwork) -> String {
        let digits = number.filter { $0.isNumber }
        switch network {
        case .amex:
            if digits.count == 15 {
                let p1 = digits.prefix(4)
                let p2 = digits.dropFirst(4).prefix(6)
                let p3 = digits.suffix(5)
                return "\(p1) \(p2) \(p3)"
            }
        default:
            if digits.count == 16 {
                let p1 = digits.prefix(4)
                let p2 = digits.dropFirst(4).prefix(4)
                let p3 = digits.dropFirst(8).prefix(4)
                let p4 = digits.suffix(4)
                return "\(p1) \(p2) \(p3) \(p4)"
            }
        }
        return number
    }

    func maskCardNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }
        guard digits.count >= 4 else { return number }
        let lastFour = String(digits.suffix(4))
        return "•••• •••• •••• \(lastFour)"
    }

    func validateCardNumber(_ number: String, network: CardNetwork) -> Bool {
        let digits = number.filter { $0.isNumber }
        switch network {
        case .amex: return digits.count == 15
        default: return digits.count == 16
        }
    }
}
