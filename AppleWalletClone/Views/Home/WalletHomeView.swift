import SwiftUI

struct WalletHomeView: View {
    @Environment(WalletViewModel.self) var walletVM

    var body: some View {
        ZStack {
            Constants.Colors.background.ignoresSafeArea()

            VStack(spacing: 0) {
                WalletHeaderView()

                ScrollView(showsIndicators: false) {
                    CardStackView()
                        .padding(.top, 20)
                }
            }
        }
    }
}

#Preview {
    WalletHomeView()
        .environment(WalletViewModel())
}
