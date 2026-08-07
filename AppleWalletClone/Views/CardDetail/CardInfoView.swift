import SwiftUI

struct CardInfoView: View {
    let card: Card
    @Bindable var viewModel: TransactionViewModel

    @State private var showSendRequest = false

    var body: some View {
        VStack(spacing: 24) {
            balanceSection
            sendRequestButton

            if viewModel.isEditing {
                editingBanner
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
    }

    // MARK: - Balance
    private var balanceSection: some View {
        VStack(spacing: 6) {
            Text(balanceLabel)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.white.opacity(0.6))

            Text(card.balance.currencyFormatted())
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .contentTransition(.numericText())
        }
    }

    private var balanceLabel: String {
        switch card.cardType {
        case .appleCash: return "Apple Cash Balance"
        case .appleAccount: return "Account Balance"
        default: return "Current Balance"
        }
    }

    // MARK: - Send or Request
    private var sendRequestButton: some View {
        Button {
            showSendRequest = true
            HapticManager.shared.mediumImpact()
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "arrow.left.arrow.right.circle.fill")
                    .font(.system(size: 20))
                Text("Send or Request")
                    .font(.system(size: 17, weight: .semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(
                Capsule()
                    .fill(Color.white.opacity(0.12))
            )
            .overlay(
                Capsule()
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .sensoryFeedback(.impact(weight: .medium), trigger: showSendRequest)
        .sheet(isPresented: $showSendRequest) {
            SendRequestView()
        }
    }

    // MARK: - Hidden Editor Banner
    private var editingBanner: some View {
        HStack(spacing: 8) {
            Image(systemName: "pencil.circle.fill")
                .foregroundColor(.blue)
            Text("Transaction Editor Enabled")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.blue)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(Color.blue.opacity(0.12))
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(Color.blue.opacity(0.2), lineWidth: 1)
        )
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var vm = TransactionViewModel()
    CardInfoView(
        card: Card(
            cardType: .appleCash,
            cardNetwork: .other,
            cardHolderName: "JOHN DOE",
            cardNumber: "•••• •••• •••• 0000",
            expirationDate: "12/28",
            cvv: "123",
            balance: 5100.00,
            cardNickname: "Apple Cash",
            gradientColors: ["#1C1C1E", "#2C2C2E", "#3A3A3C", "#48484A"],
            patternType: .appleCashPattern,
            isDefault: true,
            country: "USA",
            eliteTier: .standard
        ),
        viewModel: vm
    )
    .padding()
    .background(Color.black)
}
