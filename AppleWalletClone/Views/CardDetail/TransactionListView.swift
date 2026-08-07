import SwiftUI

struct TransactionListView: View {
    let card: Card
    @Bindable var viewModel: TransactionViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
                .padding(.horizontal, 20)
                .padding(.bottom, 12)

            if viewModel.filteredTransactions.isEmpty {
                emptyState
                    .padding(.horizontal, 20)
            } else {
                LazyVStack(spacing: 0) {
                    ForEach(Array(viewModel.filteredTransactions.enumerated()), id: \.element.id) { index, transaction in
                        TransactionRowView(transaction: transaction)
                            .padding(.horizontal, 20)
                            .scrollTransition(.animated.threshold(.visible(0.3))) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.5)
                                    .offset(y: phase.isIdentity ? 0 : 12)
                            }

                        if index < viewModel.filteredTransactions.count - 1 {
                            Divider()
                                .background(Color.white.opacity(0.08))
                                .padding(.leading, 74)
                                .padding(.trailing, 20)
                        }
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchQuery, prompt: "Search transactions")
        .sensoryFeedback(.success, trigger: viewModel.isEditing)
    }

    // MARK: - Header
    private var header: some View {
        HStack {
            Text("Latest Transactions")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)

            Spacer()

            if viewModel.isEditing {
                Button("Done") {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        viewModel.isEditing = false
                    }
                    HapticManager.shared.lightImpact()
                }
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.blue)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .onLongPressGesture(minimumDuration: 0.6) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                viewModel.isEditing.toggle()
            }
            HapticManager.shared.success()
        }
    }

    // MARK: - Empty State
    private var emptyState: some View {
        VStack(spacing: 10) {
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 36))
                .foregroundColor(.white.opacity(0.3))

            Text("No Transactions")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white.opacity(0.6))

            Text("Pull down to refresh")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.4))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var vm = TransactionViewModel()
    let card = Card(
        cardType: .credit,
        cardNetwork: .visa,
        cardHolderName: "JOHN DOE",
        cardNumber: "•••• •••• •••• 4242",
        expirationDate: "12/28",
        cvv: "123",
        balance: 1247.50,
        cardNickname: "Chase Sapphire",
        gradientColors: ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"],
        patternType: .none,
        isDefault: false,
        country: "USA",
        eliteTier: .platinum
    )

    vm.transactions = vm.generateSampleTransactions(for: card.id)

    return TransactionListView(card: card, viewModel: vm)
        .background(Color.black)
}
