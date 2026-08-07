import SwiftUI

extension View {
    func cardStyle() -> some View {
        self
            .cornerRadius(Constants.cardCornerRadius)
            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
    }

    func glassmorphic() -> some View {
        self
            .background(.ultraThinMaterial)
            .cornerRadius(Constants.cardCornerRadius)
    }
}

extension Date {
    func formattedWalletStyle() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }

    func relativeWalletStyle() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}

extension Double {
    func currencyFormatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "$0.00"
    }
}

extension String {
    func maskedCardNumber() -> String {
        let digits = self.filter { $0.isNumber }
        guard digits.count >= 4 else { return self }
        let lastFour = String(digits.suffix(4))
        return "•••• •••• •••• \(lastFour)"
    }
}
