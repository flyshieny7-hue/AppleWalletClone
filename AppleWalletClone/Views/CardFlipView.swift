import SwiftUI

struct CardFlipView<Front: View, Back: View>: View {
    let front: Front
    let back: Back
    var cornerRadius: CGFloat = 20
    var flipDuration: Double = 0.6

    @State private var isFlipped = false
    @State private var rotation: Double = 0
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            // Front
            front
                .opacity(rotation < 90 ? 1 : 0)
                .rotation3DEffect(
                    .degrees(rotation),
                    axis: (x: 0, y: 1, z: 0)
                )

            // Back
            back
                .opacity(rotation >= 90 ? 1 : 0)
                .rotation3DEffect(
                    .degrees(rotation - 180),
                    axis: (x: 0, y: 1, z: 0)
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .onTapGesture {
            flip()
        }
        .gesture(
            LongPressGesture(minimumDuration: 0.3)
                .onEnded { _ in
                    flip()
                }
        )
    }

    func flip() {
        guard !isAnimating else { return }
        isAnimating = true
        HapticManager.shared.mediumImpact()

        withAnimation(.easeInOut(duration: flipDuration / 2)) {
            rotation = isFlipped ? 90 : 90
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + flipDuration / 2) {
            isFlipped.toggle()
            withAnimation(.easeInOut(duration: flipDuration / 2)) {
                rotation = isFlipped ? 180 : 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + flipDuration / 2) {
                isAnimating = false
            }
        }
    }

    func flipToFront() {
        if isFlipped {
            flip()
        }
    }

    func flipToBack() {
        if !isFlipped {
            flip()
        }
    }
}

// MARK: - Card Back View (CVV Side)
struct CardBackView: View {
    let card: Card
    var showCVV: Bool = true

    var body: some View {
        ZStack {
            // Background
            let colors = card.gradientColors.map { Color(hex: $0) }
            let padded = colors.count >= 4 ? colors : colors + Array(repeating: Color.black, count: max(0, 4 - colors.count))

            MeshGradient(
                width: 3, height: 3,
                points: [
                    .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                    .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                    .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1)
                ],
                colors: padded
            )

            VStack(spacing: 0) {
                // Magnetic stripe
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 50)
                    .padding(.top, 30)

                // Signature panel
                HStack {
                    Spacer()
                    ZStack(alignment: .trailing) {
                        Rectangle()
                            .fill(Color.white.opacity(0.9))
                            .frame(width: 200, height: 40)

                        Text(card.cardHolderName)
                            .font(.system(size: 12, weight: .medium, design: .cursive))
                            .foregroundColor(.black)
                            .padding(.trailing, 8)
                    }
                    Spacer()
                }
                .padding(.top, 20)

                // CVV
                if showCVV {
                    HStack {
                        Spacer()
                        VStack(alignment: .trailing, spacing: 4) {
                            Text("CVV")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.white.opacity(0.7))

                            Text(card.cvv)
                                .font(.system(size: 16, weight: .bold, design: .monospaced))
                                .foregroundColor(.black)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                        .padding(.trailing, 30)
                    }
                    .padding(.top, 12)
                }

                Spacer()

                // Hologram
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(
                                AngularGradient(
                                    gradient: Gradient(colors: [.silver, .gray, .white, .gray, .silver]),
                                    center: .center
                                )
                            )
                            .frame(width: 40, height: 40)

                        Image(systemName: "creditcard.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// MARK: - Flippable Card Wrapper
struct FlippableCardView: View {
    let card: Card
    @State private var showBack = false

    var body: some View {
        CardFlipView(
            front: CardFrontView(card: card),
            back: CardBackView(card: card),
            cornerRadius: 20,
            flipDuration: 0.6
        )
        .frame(height: 220)
        .overlay(
            // Flip hint
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "arrow.left.arrow.right.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.4))
                        .padding(8)
                }
            }
        )
    }
}

// MARK: - Card Front View (Simplified)
struct CardFrontView: View {
    let card: Card

    var body: some View {
        let colors = card.gradientColors.map { Color(hex: $0) }
        let padded = colors.count >= 4 ? colors : colors + Array(repeating: Color.black, count: max(0, 4 - colors.count))

        ZStack {
            MeshGradient(
                width: 3, height: 3,
                points: [
                    .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                    .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                    .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1)
                ],
                colors: padded
            )

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
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        FlippableCardView(
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
        .padding(.horizontal, 20)
    }
}
