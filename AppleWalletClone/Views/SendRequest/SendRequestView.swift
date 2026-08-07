import SwiftUI

enum SendRequestMode: String, CaseIterable {
    case send = "Send"
    case request = "Request"
}

struct SendRequestView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(WalletViewModel.self) private var walletVM
    @State private var viewModel = TransactionViewModel()

    @State private var mode: SendRequestMode = .send
    @State private var amountText = ""
    @State private var selectedContact: ContactPerson?
    @State private var showContactPicker = false
    @State private var showTapToCash = false
    @State private var showSuccess = false

    private var numericAmount: Double {
        let cleaned = amountText.filter { $0.isNumber }
        return (Double(cleaned) ?? 0) / 100
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                navigationBar

                VStack(spacing: 24) {
                    contactButton
                    AmountPadView(amountText: $amountText)
                    Spacer()
                    continueButton
                }
                .padding(.horizontal, 20)
            }
        }
        .sheet(isPresented: $showContactPicker) {
            ContactPickerView(selectedContact: $selectedContact)
        }
        .overlay {
            if showTapToCash {
                TapToCashView(
                    amount: numericAmount,
                    contact: selectedContact?.name ?? "Unknown",
                    onComplete: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            showTapToCash = false
                            showSuccess = true
                        }
                        if let card = walletVM.cards.first(where: { $0.cardType == .appleCash }) {
                            let tx = Transaction(
                                cardID: card.id,
                                title: selectedContact?.name ?? "Tap to Cash",
                                subtitle: mode == .send ? "Sent" : "Requested",
                                amount: mode == .send ? -numericAmount : numericAmount,
                                type: .tapToCash,
                                merchantIcon: "iphone.circle"
                            )
                            viewModel.addTransaction(tx)
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

            Picker("Mode", selection: $mode) {
                ForEach(SendRequestMode.allCases, id: \.self) { m in
                    Text(m.rawValue).tag(m)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 200)
            .colorMultiply(.white)

            Spacer()

            Button("Cancel") { }
                .opacity(0)
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    private var contactButton: some View {
        Button {
            showContactPicker = true
            HapticManager.shared.lightImpact()
        } label: {
            HStack(spacing: 12) {
                if let contact = selectedContact {
                    ZStack {
                        Circle()
                            .fill(contact.color.gradient)
                            .frame(width: 40, height: 40)

                        Text(contact.initials)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(contact.name)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)

                        Text(contact.phone)
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.5))
                    }
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.white.opacity(0.3))

                    Text("Select Contact")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white.opacity(0.6))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(14)
            .background(Color.white.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(PlainButtonStyle())
    }

    private var continueButton: some View {
        Button {
            HapticManager.shared.mediumImpact()
            if mode == .send {
                showTapToCash = true
            } else {
                showSuccess = true
            }
        } label: {
            Text("Continue")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(numericAmount > 0 && selectedContact != nil ? Color.white : Color.white.opacity(0.3))
                )
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(numericAmount == 0 || selectedContact == nil)
        .padding(.bottom, 30)
        .sensoryFeedback(.impact(weight: .medium), trigger: showTapToCash)
    }
}

#Preview {
    SendRequestView()
        .environment(WalletViewModel())
}
