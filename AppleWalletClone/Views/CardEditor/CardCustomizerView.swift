import SwiftUI

struct CardCustomizerView: View {
    @Bindable var card: Card
    @Environment(\.dismiss) private var dismiss

    @State private var selectedPattern: CardPattern = .none

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        livePreview
                            .padding(.top, 12)

                        CardDesignPicker(
                            gradientColors: Binding(
                                get: { card.gradientColors },
                                set: { card.gradientColors = $0 }
                            ),
                            patternType: Binding(
                                get: { card.patternType },
                                set: { card.patternType = $0 }
                            )
                        )

                        patternSelector

                        Spacer(minLength: 40)
                    }
                }
            }
            .navigationTitle("Customize")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                }
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

            if card.patternType != .none {
                CardPatternView(patternType: card.patternType)
                    .opacity(0.12)
            }

            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(card.cardNickname)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(card.cardHolderName.uppercased())
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.85))
                    Spacer()
                }
            }
            .padding(22)
        }
        .padding(.horizontal, 20)
    }

    private var patternSelector: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Pattern")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(CardPattern.allCases, id: \.self) { pattern in
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                card.patternType = pattern
                            }
                            HapticManager.shared.lightImpact()
                        } label: {
                            Text(pattern.rawValue)
                                .font(.system(size: 13, weight: card.patternType == pattern ? .semibold : .medium))
                                .foregroundColor(card.patternType == pattern ? .black : .white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(card.patternType == pattern ? Color.white : Color.white.opacity(0.1))
                                .clipShape(Capsule())
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    CardCustomizerView(
        card: Card(
            cardType: .credit,
            cardNetwork: .visa,
            cardHolderName: "JOHN DOE",
            cardNumber: "•••• •••• •••• 4242",
            expirationDate: "12/28",
            cvv: "123",
            balance: 0,
            cardNickname: "Chase Sapphire",
            gradientColors: ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"],
            patternType: .none,
            isDefault: false,
            country: "USA",
            eliteTier: .platinum
        )
    )
}
