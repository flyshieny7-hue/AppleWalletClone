import SwiftUI

struct CardStackView: View {
    @Environment(WalletViewModel.self) var walletVM

    var body: some View {
        VStack(spacing: 0) {
            ForEach(walletVM.cards) { card in
                CardCellView(card: card)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
            }
        }
    }
}

#Preview {
    CardStackView()
        .environment(WalletViewModel())
}
