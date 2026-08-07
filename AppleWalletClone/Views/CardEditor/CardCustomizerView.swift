import SwiftUI

struct CardEditorView: View {
    @Bindable var card: Card
    @Environment(\.dismiss) private var dismiss

    @State private var editedName: String = ""
    @State private var editedNumber: String = ""
    @State private var editedExpiry: String = ""
    @State private var editedCVV: String = ""
    @State private var editedBalance: String = ""
    @State private var showCustomizer = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        livePreview
                            .padding(.top, 12)

                        formSection

                        Button {
                            showCustomizer = true
                        } label: {
                            HStack {
                                Image(systemName: "paintbrush")
                                Text("Customize Design")
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 20)

                        Spacer(minLength: 40)
                    }
                }
            }
            .navigationTitle("Edit Card")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveChanges()
                        HapticManager.shared.success()
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                }
            }
            .sheet(isPresented: $showCustomizer) {
                CardCustomizerView(card: card)
            }
            .onAppear {
                editedName = card.cardHolderName
                editedNumber = card.cardNumber
                editedExpiry = card.expirationDate
                editedCVV = card.cvv
                editedBalance = String(format: "%.2f", card.balance)
            }
        }
    }

    private var livePreview: some View {
        let colors = card.gradientColors.map { Color(hex: $0) }
        let padded = colors.count >= 4 ? colors : colors + Array(repeating: Color.black, count: max(0, 4 - colors.count))

        return ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    MeshGradient(
                        width: 3, height: 3,
                        points: [
                            .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                            .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                            .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1)
                        ],
                        colors: padded
                    )
                )
                .frame(height: 200)
                .shadow(color: (colors.first ?? .white).opacity(0.3), radius: 16, x: 0, y: 8)

            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(card.cardNickname)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Spacer()

                    Text(card.cardNetwork.rawValue)
                        .font(.system(size: 9, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.15)))
                }

                Spacer()

                HStack(spacing: 12) {
                    ForEach(0..<3) { _ in
                        Text("••••")
                            .font(.system(size: 14, weight: .medium, design: .monospaced))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    Text(String(card.cardNumber.suffix(4)))
                        .font(.system(size: 14, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                }

                Spacer()

                HStack {
                    Text(card.cardHolderName.uppercased())
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.85))

                    Spacer()

                    Text(card.expirationDate)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                }
            }
            .padding(22)
        }
        .padding(.horizontal, 20)
    }

    private var formSection: some View {
        VStack(spacing: 16) {
            editorField("Cardholder Name", text: $editedName)
            CardNumberEditor(cardNumber: $editedNumber, network: card.cardNetwork)
            editorField("Expiry Date (MM/YY)", text: $editedExpiry)
                .keyboardType(.numbersAndPunctuation)
            editorField("CVV", text: $editedCVV)
                .keyboardType(.numberPad)
            editorField("Balance", text: $editedBalance)
                .keyboardType(.decimalPad)
        }
        .padding(.horizontal, 20)
    }

    private func editorField(_ title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)

            TextField(title, text: text)
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding(14)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private func saveChanges() {
        card.cardHolderName = editedName
        card.cardNumber = editedNumber
        card.expirationDate = editedExpiry
        card.cvv = editedCVV
        card.balance = Double(editedBalance) ?? card.balance
    }
}

#Preview {
    CardEditorView(
        card: Card(
            cardType: .credit,
            cardNetwork: .visa,
            cardHolderName: "JOHN DOE",
            cardNumber: "•••• •••• •••• 4242",
            expirationDate: "12/28",
            cvv: "123",
            balance: 1247.50,
            cardNickname: "Chase Sapphire",
            gradientColors: ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"],
            patternType: .none,
            isDefault: false,
            country: "USA",
            eliteTier: .platinum
        )
    )
}
