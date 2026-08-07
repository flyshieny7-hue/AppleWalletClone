import SwiftUI

struct ApplePaySheetView: View {
    let card: Card?
    let amount: String
    let onComplete: () -> Void

    @State private var cardRotation: Double = -30
    @State private var opacity: Double = 0

    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture { }

            VStack(spacing: 24) {
                Image(systemName: "apple.logo")
                    .font(.system(size: 32, weight: .light))
                    .foregroundColor(.white)
                    .padding(.top, 20)

                Text("Pay")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)

                if let card = card {
                    CardPresentationView(card: card)
                        .frame(height: 220)
                        .rotation3DEffect(.degrees(cardRotation), axis: (x: 0, y: 1, z: 0))
                }

                Text(amount)
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .contentTransition(.numericText())

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
        }
        .opacity(opacity)
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                opacity = 1
                cardRotation = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                HapticManager.shared.success()
                onComplete()
            }
        }
    }
}

#Preview {
    ApplePaySheetView(
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
        ),
        amount: "$100.00",
        onComplete: {}
    )
}
