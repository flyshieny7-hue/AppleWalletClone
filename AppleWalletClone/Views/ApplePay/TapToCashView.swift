import SwiftUI

struct TransactionDetailView: View {
    @Bindable var transaction: Transaction
    @Environment(WalletViewModel.self) private var walletVM
    @Environment(\.dismiss) private var dismiss

    @State private var editedNote: String = ""
    @State private var showCategoryPicker = false

    private var card: Card? {
        walletVM.cards.first { $0.id == transaction.cardID }
    }

    private var isPositive: Bool {
        transaction.amount > 0
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        amountHeader

                        if let card = card {
                            cardPreview(card: card)
                        }

                        detailSection

                        noteSection

                        categorySection

                        statusSection

                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
            .onAppear {
                editedNote = transaction.note
            }
        }
    }

    private var amountHeader: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 64, height: 64)

                Image(systemName: transaction.merchantIcon)
                    .font(.system(size: 28))
                    .foregroundColor(.white)
            }

            Text(transaction.title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)

            Text(transaction.amount.currencyFormatted())
                .font(.system(size: 38, weight: .bold, design: .rounded))
                .foregroundColor(isPositive ? Color(hex: "#34C759") : .white)
                .contentTransition(.numericText())

            Text(transaction.date, style: .date)
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
    }

    private func cardPreview(card: Card) -> some View {
        let colors = card.gradientColors.map { Color(hex: $0) }
        let padded = colors.count >= 4 ? colors : colors + Array(repeating: Color.black, count: max(0, 4 - colors.count))

        return HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    MeshGradient(
                        width: 2, height: 2,
                        points: [.init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 0, y: 1), .init(x: 1, y: 1)],
                        colors: Array(padded.prefix(4))
                    )
                )
                .frame(width: 48, height: 30)

            VStack(alignment: .leading, spacing: 2) {
                Text(card.cardNickname)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)

                Text("•••• \(String(card.cardNumber.suffix(4)))")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.5))
            }

            Spacer()
        }
        .padding(14)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var detailSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            DetailRow(label: "Type", value: transaction.type.rawValue)
            DetailRow(label: "Status", value: transaction.status.rawValue, valueColor: statusColor)
            if !transaction.subtitle.isEmpty {
                DetailRow(label: "Description", value: transaction.subtitle)
            }
        }
        .padding(16)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var noteSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Note")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)

            TextField("Add a note...", text: $editedNote, axis: .vertical)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .padding(12)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .onChange(of: editedNote) { _, newValue in
                    transaction.note = newValue
                }
        }
    }

    private var categorySection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Category")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)

            Menu {
                ForEach(TransactionCategory.allCases, id: \.self) { cat in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            transaction.category = cat
                        }
                        HapticManager.shared.lightImpact()
                    } label: {
                        HStack {
                            Text(cat.rawValue)
                            if transaction.category == cat {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            } label: {
                HStack {
                    Text(transaction.category.rawValue)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: "chevron.up.chevron.down")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white.opacity(0.4))
                }
                .padding(12)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }

    private var statusSection: some View {
        HStack {
            Circle()
                .fill(statusColor)
                .frame(width: 8, height: 8)

            Text(transaction.status.rawValue)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(statusColor)

            Spacer()
        }
        .padding(.top, 8)
    }

    private var statusColor: Color {
        switch transaction.status {
        case .completed: return Color(hex: "#34C759")
        case .pending: return .orange
        case .failed: return Color(hex: "#FF3B30")
        case .reversed: return .gray
        }
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    var valueColor: Color = .white

    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.5))

            Spacer()

            Text(value)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(valueColor)
        }
    }
}

#Preview {
    TransactionDetailView(
        transaction: Transaction(
            cardID: UUID(),
            title: "Starbucks",
            subtitle: "Coffee",
            amount: -5.67,
            date: Date(),
            type: .purchase,
            status: .completed,
            merchantIcon: "cup.and.saucer",
            category: .food,
            note: "Morning coffee"
        )
    )
    .environment(WalletViewModel())
}
