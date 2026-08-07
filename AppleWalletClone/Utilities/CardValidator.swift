import SwiftUI

struct CardValidator {
    static func isValidCardNumber(_ number: String) -> Bool {
        let digits = number.filter { $0.isNumber }
        guard digits.count >= 13 else { return false }

        var sum = 0
        var isEven = false
        for digit in digits.reversed() {
            guard let d = digit.wholeNumberValue else { return false }
            if isEven {
                let doubled = d * 2
                sum += (doubled > 9) ? (doubled - 9) : doubled
            } else {
                sum += d
            }
            isEven.toggle()
        }
        return sum % 10 == 0
    }

    static func isValidCVV(_ cvv: String, network: CardNetwork) -> Bool {
        let digits = cvv.filter { $0.isNumber }
        switch network {
        case .amex: return digits.count == 4
        default: return digits.count == 3
        }
    }

    static func isValidExpiry(_ expiry: String) -> Bool {
        let pattern = "^(0[1-9]|1[0-2])\/([2-9][0-9])$"
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }
        let range = NSRange(location: 0, length: expiry.utf16.count)
        return regex.firstMatch(in: expiry, options: [], range: range) != nil
    }
}
