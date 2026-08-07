import SwiftUI
import TipKit

struct WalletHomeView: View {
    @Environment(WalletViewModel.self) private var viewModel
    @State private var isExpanded = false
    @State private var showSearch = false
    @State private var searchText = ""
    @State private var selectedCategory: CardType? = nil
    @State private var showSettings = false
    @State private var showAddCardSheet = false
    @State private var showCardCube = false

    @Namespace private var animation
    @FocusState private var isSearchFocused: Bool

    private let addCardTip = AddCardTip()
    private let expandStackTip = ExpandStackTip()

    var filteredCards: [Card] {
        var result = viewModel.cards

        if let category = selectedCategory {
            result = result.filter { $0.cardType == category }
        }

        if !searchText.isEmpty {
            result = result.filter {
                $0.cardNickname.localizedCaseInsensitiveContains(searchText) ||
                $0.cardHolderName.localizedCaseInsensitiveContains(searchText) ||
                $0.cardNetwork.rawValue.localizedCaseInsensitiveContains(searchText) ||
                $0.country.localizedCaseInsensitiveContains(searchText)
            }
        }

        return result
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // Header
                    WalletHeaderView(
                        isExpanded: $isExpanded,
                        showSearch: $showSearch,
                        showSettings: $showSettings,
                        showCardCube: $showCardCube,
                        showAddCardSheet: $showAddCardSheet,
                        namespace: animation
                    )
                    .padding(.horizontal, 20)
                    .padding(.top, 8)

                    // Search Bar
                    if showSearch {
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white.opacity(0.6))

                            TextField("Search cards...", text: $searchText)
                                .foregroundColor(.white)
                                .focused($isSearchFocused)

                            if !searchText.isEmpty {
                                Button(action: { searchText = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.white.opacity(0.6))
                                }
                            }
                        }
                        .padding(12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                        .transition(.move(edge: .top).combined(with: .opacity))
                    }

                    // Category Filter
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            FilterChip(title: "All", isSelected: selectedCategory == nil) {
                                selectedCategory = nil
                            }

                            ForEach(CardType.allCases, id: \.self) { type in
                                FilterChip(
                                    title: type.rawValue,
                                    isSelected: selectedCategory == type
                                ) {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                        selectedCategory = (selectedCategory == type) ? nil : type
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 16)

                    // Card Stack
                    CardStackView(
                        cards: filteredCards,
                        isExpanded: $isExpanded,
                        namespace: animation
                    )
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .popoverTip(expandStackTip)

                    Spacer(minLength: 60)
                }
            }

            // Floating Add Button
            if !isExpanded {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            HapticManager.shared.mediumImpact()
                            showAddCardSheet = true
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.15))
                                    .frame(width: 56, height: 56)

                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 30)
                        .popoverTip(addCardTip)
                    }
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            Text("Settings")
                .foregroundColor(.white)
                .preferredColorScheme(.dark)
        }
        .sheet(isPresented: $showAddCardSheet) {
            Text("Add Card")
                .foregroundColor(.white)
                .preferredColorScheme(.dark)
        }
        .fullScreenCover(isPresented: $showCardCube) {
            Text("Card Cube")
                .foregroundColor(.white)
                .preferredColorScheme(.dark)
        }
        .preferredColorScheme(.dark)
        .task {
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
    }
}

// MARK: - Filter Chip
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
                .cornerRadius(20)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - TipKit Tips
struct AddCardTip: Tip {
    var title: Text { Text("Add New Card") }
    var message: Text? { Text("Tap to add a new card to your wallet") }
    var image: Image? { Image(systemName: "plus.circle.fill") }
}

struct ExpandStackTip: Tip {
    var title: Text { Text("Expand Cards") }
    var message: Text? { Text("Tap any card to expand the stack") }
    var image: Image? { Image(systemName: "arrow.up.and.down") }
}

#Preview {
    WalletHomeView()
        .environment(WalletViewModel())
}
