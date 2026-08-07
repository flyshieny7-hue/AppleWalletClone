import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction

    private var isPositive: Bool {
        transaction.amount > 0
    }

    private var displaySubtitle: String {
        if transaction.type == .applePay {
            return transaction.subtitle.isEmpty ? "Apple Pay" : "\(transaction.subtitle) · Apple Pay"
        }
        return transaction.subtitle.isEmpty ? transaction.type.rawValue : transaction.subtitle
    }

    var body: some View {
        HStack(spacing: 14) {
            // MARK: - Icon
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.1))
                    .frame(width: 40, height: 40)

                Image(systemName: transaction.merchantIcon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
            }

            // MARK: - Info
            VStack(alignment: .leading, spacing: 3) {
                Text(transaction.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(1)

                Text(displaySubtitle)
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.6))
                    .lineLimit(1)

                Text(transaction.date, style: .date)
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.4))
            }

            Spacer()

            // MARK: - Amount
            VStack(alignment: .trailing, spacing: 3) {
                Text(formattedAmount)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(amountColor)

                if transaction.isPending {
                    Text("Pending")
                        .font(.system(size: 11))
                        .foregroundColor(.orange)
                }
            }

            // MARK: - Chevron
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white.opacity(0.25))
        }
        .padding(.vertical, 10)
        .contentShape(Rectangle())
    }

    // MARK: - Formatting
    private var formattedAmount: String {
        transaction.amount.currencyFormatted()
    }

    private var amountColor: Color {
        if isPositive {
            return Color(hex: "#34C759")
        }
        return .white
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 0) {
        TransactionRowView(transaction: Transaction(
            cardID: UUID(),
            title: "Starbucks",
            subtitle: "Coffee",
            amount: -5.67,
            date: Date(),
            type: .purchase,
            merchantIcon: "cup.and.saucer"
        ))
        .padding(.horizontal, 20)

        Divider()
            .background(Color.white.opacity(0.08))
            .padding(.leading, 74)
            .padding(.trailing, 20)

        TransactionRowView(transaction: Transaction(
            cardID: UUID(),
            title: "Tap to Cash",
            subtitle: "Received",
            amount: 2500.00,
            date: Date(),
            type: .tapToCash,
            merchantIcon: "iphone.circle"
        ))
        .padding(.horizontal, 20)
    }
    .background(Color.black)
}
