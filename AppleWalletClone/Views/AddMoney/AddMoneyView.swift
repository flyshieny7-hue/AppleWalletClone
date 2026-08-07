import SwiftUI

struct AddMoneyView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(WalletViewModel.self) private var walletVM

    @State private var amountText: String = ""
    @State private var showPaymentMethod = false
    @State private var showApplePay = false
    @State private var showSuccess = false
    @State private var selectedCard: Card?

    private var appleCashCard: Card? {
        walletVM.cards.first { $0.cardType == .appleCash }
    }

    private var numericAmount: Double {
        let cleaned = amountText.filter { $0.isNumber }
        return (Double(cleaned) ?? 0) / 100
    }

    private var formattedAmount: String {
        numericAmount.currencyFormatted()
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                navigationBar

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 32) {
                        if let card = appleCashCard {
                            appleCashPreview(card: card)
                        }

                        AmountInputView(amountText: $amountText)

                        if numericAmount > 0 {
                            DoubleClickPromptView()
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                    .padding(.top, 40)
                }

                Spacer()
            }
        }
        .sheet(isPresented: $showPaymentMethod) {
            PaymentMethodSelector(selectedCard: $selectedCard, amount: numericAmount)
        }
        .overlay {
            if showApplePay {
                ApplePaySheetView(
                    card: selectedCard ?? walletVM.cards.first { $0.cardType != .appleCash },
                    amount: formattedAmount,
                    onComplete: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            showApplePay = false
                            showSuccess = true
                        }
                        if let card = appleCashCard {
                            card.balance += numericAmount
                        }
                    }
                )
                .transition(.opacity)
            }

            if showSuccess {
                SuccessAnimationView {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        showSuccess = false
                    }
                    dismiss()
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
    }

    private var navigationBar: some View {
        HStack {
            Button("Cancel") {
                HapticManager.shared.lightImpact()
                dismiss()
            }
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.blue)

            Spacer()

            Text("Add Money")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)

            Spacer()

            Button("Add") {
                HapticManager.shared.mediumImpact()
                showPaymentMethod = true
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.blue)
            .disabled(numericAmount == 0)
            .opacity(numericAmount == 0 ? 0.5 : 1)
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    private func appleCashPreview(card: Card) -> some View {
        let colors = card.gradientColors.map { Color(hex: $0) }
        let padded = colors.count >= 4 ? colors : colors + Array(repeating: Color.black, count: max(0, 4 - colors.count))

        return VStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        MeshGradient(
                            width: 3, height: 3,
                            points: [
                                .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                                .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                                .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1)
                            ],
                            colors: padded
                        )
                    )
                    .frame(width: 200, height: 126)
                    .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Spacer()
                        Text(card.cardNetwork.rawValue)
                            .font(.system(size: 8, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.15)))
                    }

                    Spacer()

                    Text(card.cardHolderName.uppercased())
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.white.opacity(0.85))
                }
                .padding(14)
                .frame(width: 200, height: 126)
            }

            Text("Current Balance: \(card.balance.currencyFormatted())")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
                .contentTransition(.numericText())
        }
    }
}

#Preview {
    AddMoneyView()
        .environment(WalletViewModel())
}
