import SwiftUI

struct WalletHeaderView: View {
    @Environment(WalletViewModel.self) var walletVM

    var body: some View {
        HStack {
            Text("Wallet")
                .font(Constants.Fonts.largeTitle)
                .foregroundColor(.white)

            Spacer()

            Button(action: {}) {
                Image(systemName: "cube.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }

            Button(action: {}) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

#Preview {
    WalletHeaderView()
        .environment(WalletViewModel())
}
