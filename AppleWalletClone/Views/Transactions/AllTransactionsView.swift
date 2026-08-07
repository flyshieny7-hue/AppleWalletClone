import SwiftUI

struct AllTransactionsView: View {
    @Environment(WalletViewModel.self) private var walletVM
    @State private var viewModel = TransactionViewModel()
    @State private var showFilters = false
    @State private var selectedTransaction: Transaction?

    private var groupedTransactions: [(String, [Transaction])] {
        let calendar = Calendar.current
        let grouped = Dictionary(grouping: viewModel.filteredTransactions) { tx in
            if calendar.isDateInToday(tx.date) { return "Today" }
            if calendar.isDateInYesterday(tx.date) { return "Yesterday" }
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM d, yyyy"
            return formatter.string(from: tx.date)
        }
        return grouped.sorted { a, b in
            guard let dateA = a.1.first?.date, let dateB = b.1.first?.date else { return false }
            return dateA > dateB
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        categoryFilters
                            .padding(.top, 8)
                            .padding(.bottom, 12)

                        if viewModel.filteredTransactions.isEmpty {
                            emptyState
                        } else {
                            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                                ForEach(groupedTransactions, id: \.0) { section in
                                    Section {
                                        ForEach(section.1) { tx in
                                            Button {
                                                selectedTransaction = tx
                                                HapticManager.shared.lightImpact()
                                            } label: {
                                                TransactionRowView(transaction: tx)
                                                    .padding(.horizontal, 20)
                                            }
                                            .buttonStyle(PlainButtonStyle())

                                            if tx.id != section.1.last?.id {
                                                Divider()
                                                    .background(Color.white.opacity(0.06))
                                                    .padding(.leading, 74)
                                                    .padding(.trailing, 20)
                                            }
                                        }
                                    } header: {
                                        HStack {
                                            Text(section.0)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 8)
                                        .background(Color.black)
                                    }
                                }
                            }
                        }

                        Spacer(minLength: 40)
                    }
                }
                .refreshable {
                    await performRefresh()
                }
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .searchable(text: $viewModel.searchQuery, prompt: "Search transactions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showFilters = true
                        HapticManager.shared.lightImpact()
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 22))
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showFilters) {
                TransactionFilterView(viewModel: viewModel)
            }
            .sheet(item: $selectedTransaction) { tx in
                TransactionDetailView(transaction: tx)
            }
        }
        .onAppear {
            if viewModel.transactions.isEmpty {
                let cardID = walletVM.cards.first?.id ?? UUID()
                viewModel.transactions = viewModel.generateSampleTransactions(for: cardID)
            }
        }
    }

    private var categoryFilters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FilterChip(
                    title: "All",
                    isSelected: viewModel.filterCategory == nil
                ) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        viewModel.filterCategory = nil
                    }
                }

                ForEach(TransactionCategory.allCases, id: \.self) { cat in
                    FilterChip(
                        title: cat.rawValue,
                        isSelected: viewModel.filterCategory == cat
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            viewModel.filterCategory = (viewModel.filterCategory == cat) ? nil : cat
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 40))
                .foregroundColor(.white.opacity(0.25))

            Text("No Transactions")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))

            Text("Pull down to refresh or adjust filters")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.35))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 80)
    }

    private func performRefresh() async {
        try? await Task.sleep(nanoseconds: 800_000_000)
        await MainActor.run {
            let cardID = walletVM.cards.first?.id ?? UUID()
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                viewModel.transactions = viewModel.generateSampleTransactions(for: cardID)
            }
        }
    }
}

// MARK: - Filter Chip (reused)
struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: isSelected ? .semibold : .medium))
                .foregroundColor(isSelected ? .black : .white)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(isSelected ? Color.white : Color.white.opacity(0.1))
                .clipShape(Capsule())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    AllTransactionsView()
        .environment(WalletViewModel())
}
