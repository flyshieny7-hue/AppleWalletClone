import SwiftUI

struct PaymentMethodSelector: View {
    @Binding var selectedCard: Card?
    @Environment(\.dismiss) private var dismiss
    @Environment(WalletViewModel.self) private var walletVM

    let amount: Double
    @State private var showAllCards = false

    private var displayAmount: String {
        amount.currencyFormatted()
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Confirm with Side Button")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.top, 8)

                    if let card = selectedCard ?? walletVM.cards.first(where: { $0.cardType != .appleCash }) {
                        CardPresentationView(card: card)
                            .frame(height: 200)
                            .padding(.horizontal, 20)
                    }

                    Button {
                        showAllCards = true
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "creditcard")
                            Text("Change Payment Method")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .foregroundColor(.blue)
                        .padding(.vertical, 12)
                    }

                    Text("Add to Apple Cash \(displayAmount)")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)

                    Spacer()
                }
            }
            .navigationTitle("Apple Pay")
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
            .sheet(isPresented: $showAllCards) {
                cardListSheet
            }
        }
    }

    private var cardListSheet: some View {
        NavigationStack {
            List {
                ForEach(walletVM.cards.filter { $0.cardType != .appleCash }) { card in
                    Button {
                        selectedCard = card
                        showAllCards = false
                    } label: {
                        HStack {
                            Text(card.cardNickname)
                                .foregroundColor(.white)
                            Spacer()
                            if selectedCard?.id == card.id {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.05))
                }
            }
            .listStyle(.plain)
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Payment Methods")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        showAllCards = false
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var card: Card? = nil
    PaymentMethodSelector(selectedCard: $card, amount: 100.00)
        .environment(WalletViewModel())
}
