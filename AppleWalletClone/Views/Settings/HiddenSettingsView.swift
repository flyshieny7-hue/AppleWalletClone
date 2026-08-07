import SwiftUI

struct HiddenSettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(WalletViewModel.self) private var walletVM

    @State private var showAllCards = false
    @State private var resetBalance = false
    @State private var addTestData = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                List {
                    Section {
                        Toggle(isOn: $showAllCards) {
                            Text("Show All 331 Cards")
                                .foregroundColor(.white)
                        }
                        .tint(.blue)
                        .listRowBackground(Color.white.opacity(0.06))

                        Button {
                            for card in walletVM.cards {
                                if card.cardType == .appleCash {
                                    card.balance = 5100.00
                                }
                            }
                            HapticManager.shared.success()
                        } label: {
                            Text("Reset Apple Cash Balance")
                                .foregroundColor(.blue)
                        }
                        .listRowBackground(Color.white.opacity(0.06))

                        Button {
                            let vm = TransactionViewModel()
                            for card in walletVM.cards.prefix(5) {
                                let txs = vm.generateSampleTransactions(for: card.id)
                                // transactions are stored in viewModel, not directly on card in this flow
                            }
                            HapticManager.shared.success()
                        } label: {
                            Text("Generate Test Transactions")
                                .foregroundColor(.blue)
                        }
                        .listRowBackground(Color.white.opacity(0.06))
                    } header: {
                        Text("Debug")
                            .foregroundColor(.white.opacity(0.6))
                    }

                    Section {
                        Button(role: .destructive) {
                            walletVM.cards.removeAll()
                            HapticManager.shared.error()
                        } label: {
                            Text("Delete All Cards")
                        }
                        .listRowBackground(Color.white.opacity(0.06))
                    } header: {
                        Text("Danger Zone")
                            .foregroundColor(.red.opacity(0.8))
                    }
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Developer")
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
        }
    }
}

#Preview {
    HiddenSettingsView()
        .environment(WalletViewModel())
}
