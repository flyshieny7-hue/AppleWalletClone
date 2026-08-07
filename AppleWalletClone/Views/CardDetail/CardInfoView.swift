import SwiftUI

struct CardPresentationView: View {
    let card: Card
    @State private var rotation: Double = -25

    var body: some View {
        let colors = card.gradientColors.map { Color(hex: $0) }
        let padded = colors.count >= 4 ? colors : colors + Array(repeating: Color.black, count: max(0, 4 - colors.count))

        ZStack {
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
                .shadow(color: .black.opacity(0.4), radius: 12, x: 0, y: 8)

            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    // Chip
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "#D4AF37"), Color(hex: "#C5A028")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 40, height: 30)
                        .overlay(
                            HStack(spacing: 2) {
                                Rectangle().fill(Color.black.opacity(0.3)).frame(width: 1)
                                Rectangle().fill(Color.clear).frame(width: 8)
                                Rectangle().fill(Color.black.opacity(0.3)).frame(width: 1)
                            }
                        )

                    Spacer()

                    // Network Logo
                    Text(card.cardNetwork.rawValue)
                        .font(.system(size: 10, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.15)))
                }

                Spacer()

                // Card Number
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
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                rotation = 0
            }
        }
    }
}

#Preview {
    CardPresentationView(
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
    .frame(height: 220)
    .padding(.horizontal, 20)
    .background(Color.black)
}
