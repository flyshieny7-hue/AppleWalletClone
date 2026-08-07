import SwiftUI

struct AmountPadView: View {
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

    private let quickAmounts = [10, 20, 50, 100]

    var body: some View {
        VStack(spacing: 20) {
            Text(displayAmount)
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .contentTransition(.numericText())
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: amountText)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding(.top, 20)

            HStack(spacing: 12) {
                ForEach(quickAmounts, id: \.self) { amount in
                    Button {
                        HapticManager.shared.lightImpact()
                        amountText = String(amount * 100)
                    } label: {
                        Text("$\(amount)")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }

            customKeypad
        }
    }

    private var customKeypad: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)

        return LazyVGrid(columns: columns, spacing: 12) {
            ForEach(1...9, id: \.self) { digit in
                keypadButton("\(digit)")
            }

            keypadButton("00") {
                if !amountText.isEmpty {
                    amountText.append("00")
                }
            }
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
    AmountPadView(amountText: $text)
        .background(Color.black)
}
