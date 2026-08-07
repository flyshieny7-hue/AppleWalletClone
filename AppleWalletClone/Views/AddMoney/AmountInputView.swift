import SwiftUI

struct AmountInputView: View {
    @Binding var amountText: String

    private var displayAmount: String {
        let cleaned = amountText.filter { $0.isNumber }
        guard !cleaned.isEmpty else { return "$0.00" }
        let value = Double(cleaned) ?? 0
        let dollars = value / 100

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.groupingSeparator = ","
        formatter.usesGroupingSeparator = true
        return formatter.string(from: NSNumber(value: dollars)) ?? "$0.00"
    }

    var body: some View {
        VStack(spacing: 24) {
            Text(displayAmount)
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .contentTransition(.numericText())
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: amountText)
                .minimumScaleFactor(0.5)
                .lineLimit(1)

            customKeypad
        }
    }

    private var customKeypad: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)

        return LazyVGrid(columns: columns, spacing: 16) {
            ForEach(1...9, id: \.self) { digit in
                keypadButton("\(digit)")
            }

            keypadButton(".", action: { })
            keypadButton("0")
            keypadButton("delete.fill", isSystemImage: true)
        }
        .padding(.horizontal, 32)
    }

    private func keypadButton(_ label: String, isSystemImage: Bool = false, action: (() -> Void)? = nil) -> some View {
        Button {
            HapticManager.shared.lightImpact()
            if let customAction = action {
                customAction()
            } else if label == "delete.fill" {
                if !amountText.isEmpty {
                    amountText.removeLast()
                }
            } else if label == "." {
                // Handled by cent-based logic
            } else {
                amountText.append(label)
            }
        } label: {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.1))
                    .frame(width: 78, height: 78)

                if isSystemImage {
                    Image(systemName: label)
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.white)
                } else {
                    Text(label)
                        .font(.system(size: 28, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .sensoryFeedback(.impact(weight: .light), trigger: amountText)
    }
}

#Preview {
    @Previewable @State var text = ""
    AmountInputView(amountText: $text)
        .background(Color.black)
}
