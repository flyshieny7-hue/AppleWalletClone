import SwiftUI

enum Constants {
    static let cardAspectRatio: CGFloat = 1.586
    static let cardCornerRadius: CGFloat = 12
    static let cardWidth: CGFloat = UIScreen.main.bounds.width - 40
    static let cardHeight: CGFloat = (UIScreen.main.bounds.width - 40) / cardAspectRatio

    static let stackCollapsedSpacing: CGFloat = 12
    static let stackExpandedSpacing: CGFloat = 220

    static let animationDuration: Double = 0.4
    static let springDamping: Double = 0.75
    static let springResponse: Double = 0.4

    enum Colors {
        static let background = Color.black
        static let cardBackground = Color(hex: "#1C1C1E")
        static let secondaryBackground = Color(hex: "#2C2C2E")
        static let tertiaryBackground = Color(hex: "#3A3A3C")
        static let accentBlue = Color(hex: "#007AFF")
        static let accentGreen = Color(hex: "#34C759")
        static let accentRed = Color(hex: "#FF3B30")
        static let textPrimary = Color.white
        static let textSecondary = Color(hex: "#8E8E93")
        static let textTertiary = Color(hex: "#636366")
    }

    enum Fonts {
        static let largeTitle = Font.system(size: 34, weight: .bold)
        static let title = Font.system(size: 28, weight: .bold)
        static let title2 = Font.system(size: 22, weight: .bold)
        static let title3 = Font.system(size: 20, weight: .semibold)
        static let headline = Font.system(size: 17, weight: .semibold)
        static let body = Font.system(size: 17, weight: .regular)
        static let callout = Font.system(size: 16, weight: .regular)
        static let subheadline = Font.system(size: 15, weight: .regular)
        static let footnote = Font.system(size: 13, weight: .regular)
        static let caption = Font.system(size: 12, weight: .regular)
        static let caption2 = Font.system(size: 11, weight: .regular)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
