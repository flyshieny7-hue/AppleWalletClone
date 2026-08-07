import SwiftUI

struct GlobalSearchView: View {
    @Environment(WalletViewModel.self) private var walletVM
    @State private var searchQuery = ""
    @State private var showFilters = false
    @State private var selectedTransaction: Transaction?

    private var filteredCards: [Card] {
        guard !searchQuery.isEmpty else { return [] }
        return walletVM.cards.filter {
            $0.cardNickname.localizedCaseInsensitiveContains(searchQuery) ||
            $0.cardHolderName.localizedCaseInsensitiveContains(searchQuery) ||
            $0.cardNetwork.rawValue.localizedCaseInsensitiveContains(searchQuery) ||
            $0.country.localizedCaseInsensitiveContains(searchQuery)
        }
    }

    private var sampleTransactions: [Transaction] {
        let vm = TransactionViewModel()
        return walletVM.cards.flatMap { card in
            vm.generateSampleTransactions(for: card.id)
        }
    }

    private var filteredTransactions: [Transaction] {
        guard !searchQuery.isEmpty else { return [] }
        return sampleTransactions.filter {
            $0.title.localizedCaseInsensitiveContains(searchQuery) ||
            $0.subtitle.localizedCaseInsensitiveContains(searchQuery)
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                List {
                    if !filteredCards.isEmpty {
                        Section {
                            ForEach(filteredCards) { card in
                                cardRow(card)
                            }
                        } header: {
                            Text("Cards")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .listRowBackground(Color.white.opacity(0.06))
                    }

                    if !filteredTransactions.isEmpty {
                        Section {
                            ForEach(filteredTransactions) { tx in
                                Button {
                                    selectedTransaction = tx
                                    HapticManager.shared.lightImpact()
                                } label: {
                                    TransactionRowView(transaction: tx)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        } header: {
                            Text("Transactions")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .listRowBackground(Color.white.opacity(0.06))
                    }

                    if searchQuery.isEmpty {
                        emptyState
                    } else if filteredCards.isEmpty && filteredTransactions.isEmpty {
                        noResultsState
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .searchable(text: $searchQuery, prompt: "Search cards & transactions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showFilters = true
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 22))
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showFilters) {
                SearchFiltersView()
            }
            .sheet(item: $selectedTransaction) { tx in
                TransactionDetailView(transaction: tx)
            }
        }
    }

    private func cardRow(_ card: Card) -> some View {
        let colors = card.gradientColors.map { Color(hex: $0) }

        return HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 6)
                .fill(colors.first ?? .gray)
                .frame(width: 40, height: 26)

            VStack(alignment: .leading, spacing: 2) {
                Text(card.cardNickname)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)

                Text(card.cardNetwork.rawValue)
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.5))
            }

            Spacer()

            Text(card.balance.currencyFormatted())
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.vertical, 4)
    }

    private var emptyState: some View {
        Section {
            VStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 40))
                    .foregroundColor(.white.opacity(0.25))

                Text("Search Everything")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white.opacity(0.5))

                Text("Find cards, transactions, and more")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.35))
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 60)
        }
    }

    private var noResultsState: some View {
        Section {
            VStack(spacing: 12) {
                Image(systemName: "magnifyingglass.circle")
                    .font(.system(size: 40))
                    .foregroundColor(.white.opacity(0.25))

                Text("No Results")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white.opacity(0.5))
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 60)
        }
    }
}

#Preview {
    GlobalSearchView()
        .environment(WalletViewModel())
}
