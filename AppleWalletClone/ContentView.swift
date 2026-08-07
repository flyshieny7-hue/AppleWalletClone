import SwiftUI

struct ContentView: View {
    @State private var walletVM = WalletViewModel()

    var body: some View {
        WalletHomeView()
            .environment(walletVM)
    }
}

#Preview {
    ContentView()
}
