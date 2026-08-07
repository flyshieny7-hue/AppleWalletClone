import SwiftUI

struct CardNumberEditor: View {
    @Binding var cardNumber: String
    let network: CardNetwork

    @State private var isValid = true

    private var maskedInput: String {
        let digits = cardNumber.filter { $0.isNumber }
        return CardManager.shared.formatCardNumber(digits, network: network)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("Card Number")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white.opacity(0.5))
                    .textCase(.uppercase)

                Spacer()

                if !isValid && !cardNumber.isEmpty {
                    Text("Invalid")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.red)
                }
            }

            TextField("•••• •••• •••• ••••", text: $cardNumber)
                .font(.system(size: 17, weight: .medium, design: .monospaced))
                .foregroundColor(isValid ? .white : .red)
                .keyboardType(.numberPad)
                .padding(14)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isValid ? Color.clear : Color.red.opacity(0.5), lineWidth: 1)
                )
                .onChange(of: cardNumber) { _, newValue in
                    let digits = newValue.filter { $0.isNumber }
                    let maxDigits = network == .amex ? 15 : 16
                    if digits.count > maxDigits {
                        cardNumber = String(digits.prefix(maxDigits))
                    } else {
                        cardNumber = digits
                    }
                    isValid = CardValidator.isValidCardNumber(cardNumber)
                }
        }
    }
}

#Preview {
    @Previewable @State var number = ""
    CardNumberEditor(cardNumber: $number, network: .visa)
        .padding()
        .background(Color.black)
}
