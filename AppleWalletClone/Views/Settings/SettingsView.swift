import SwiftUI

struct SettingsView: View {
    @Environment(WalletViewModel.self) private var walletVM
    @Environment(\.dismiss) private var dismiss

    @State private var showHiddenSettings = false
    @State private var notificationsEnabled = true
    @State private var hapticsEnabled = true
    @State private var defaultCardID: UUID?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                List {
                    walletSection
                    preferencesSection
                    securitySection
                    aboutSection
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
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

    private var walletSection: some View {
        Section {
            NavigationLink {
                cardListEditor
            } label: {
                HStack {
                    Image(systemName: "creditcard.fill")
                        .foregroundColor(.blue)
                        .frame(width: 28)

                    Text("My Cards")
                        .font(.system(size: 16))
                        .foregroundColor(.white)

                    Spacer()

                    Text("\(walletVM.cards.count)")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            .listRowBackground(Color.white.opacity(0.06))

            NavigationLink {
                defaultCardPicker
            } label: {
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                        .frame(width: 28)

                    Text("Default Card")
                        .font(.system(size: 16))
                        .foregroundColor(.white)

                    Spacer()

                    if let card = walletVM.cards.first(where: { $0.isDefault }) {
                        Text(card.cardNickname)
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            }
            .listRowBackground(Color.white.opacity(0.06))
        } header: {
            Text("Wallet")
                .foregroundColor(.white.opacity(0.6))
        }
    }

    private var preferencesSection: some View {
        Section {
            Toggle(isOn: $notificationsEnabled) {
                HStack {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.orange)
                        .frame(width: 28)
                    Text("Notifications")
                        .foregroundColor(.white)
                }
            }
            .tint(.blue)
            .listRowBackground(Color.white.opacity(0.06))

            Toggle(isOn: $hapticsEnabled) {
                HStack {
                    Image(systemName: "hand.tap.fill")
                        .foregroundColor(.purple)
                        .frame(width: 28)
                    Text("Haptic Feedback")
                        .foregroundColor(.white)
                }
            }
            .tint(.blue)
            .listRowBackground(Color.white.opacity(0.06))
        } header: {
            Text("Preferences")
                .foregroundColor(.white.opacity(0.6))
        }
    }

    private var securitySection: some View {
        Section {
            Button {
                // Lock all cards action
            } label: {
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.red)
                        .frame(width: 28)

                    Text("Lock All Cards")
                        .foregroundColor(.red)

                    Spacer()
                }
            }
            .listRowBackground(Color.white.opacity(0.06))
        } header: {
            Text("Security")
                .foregroundColor(.white.opacity(0.6))
        }
    }

    private var aboutSection: some View {
        Section {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.gray)
                    .frame(width: 28)

                Text("Version")
                    .foregroundColor(.white)

                Spacer()

                Text("1.0.0")
                    .foregroundColor(.white.opacity(0.5))
            }
            .listRowBackground(Color.white.opacity(0.06))

            Button {
                showHiddenSettings = true
            } label: {
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.clear)
                        .frame(width: 28)
                    Text("")
                        .foregroundColor(.clear)
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
            .opacity(0)
            .sheet(isPresented: $showHiddenSettings) {
                HiddenSettingsView()
            }
        } header: {
            Text("About")
                .foregroundColor(.white.opacity(0.6))
        }
    }

    private var cardListEditor: some View {
        List {
            ForEach(walletVM.cards) { card in
                NavigationLink {
                    CardEditorView(card: card)
                } label: {
                    HStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(hex: card.gradientColors.first ?? "#333333"))
                            .frame(width: 32, height: 20)

                        Text(card.cardNickname)
                            .foregroundColor(.white)

                        Spacer()

                        if card.isDefault {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                                .font(.system(size: 12, weight: .bold))
                        }
                    }
                }
                .listRowBackground(Color.white.opacity(0.06))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("My Cards")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var defaultCardPicker: some View {
        List {
            ForEach(walletVM.cards) { card in
                Button {
                    for c in walletVM.cards {
                        c.isDefault = false
                    }
                    card.isDefault = true
                    HapticManager.shared.success()
                } label: {
                    HStack {
                        Text(card.cardNickname)
                            .foregroundColor(.white)

                        Spacer()

                        if card.isDefault {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .listRowBackground(Color.white.opacity(0.06))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Default Card")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
        .environment(WalletViewModel())
}
