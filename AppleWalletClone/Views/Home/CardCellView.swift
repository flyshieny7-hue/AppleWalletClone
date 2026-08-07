import SwiftUI

struct CardCellView: View {
    let card: Card
    @State private var motionManager = MotionManager()

    var body: some View {
        RoundedRectangle(cornerRadius: Constants.cardCornerRadius)
            .fill(
                LinearGradient(
                    colors: card.gradientColors.map { Color(hex: $0) },
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(height: Constants.cardHeight)
            .overlay(
                CardContentOverlay(card: card)
            )
            .cardStyle()
            .offset(motionManager.parallaxOffset)
            .onAppear { motionManager.start() }
            .onDisappear { motionManager.stop() }
    }
}

struct CardContentOverlay: View {
    let card: Card

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(card.cardNickname.isEmpty ? card.cardNetwork.rawValue : card.cardNickname)
                    .font(Constants.Fonts.headline)
                    .foregroundColor(Color(hex: card.textColor))

                Spacer()

                Text(card.cardNetwork.rawValue)
                    .font(Constants.Fonts.caption)
                    .foregroundColor(Color(hex: card.textColor).opacity(0.7))
            }

            Spacer()

            if card.cardType == .appleCash || card.cardType == .appleAccount {
                HStack {
                    Spacer()
                    Text(card.balance.currencyFormatted())
                        .font(Constants.Fonts.title)
                        .foregroundColor(Color(hex: card.textColor))
                }
            }

            HStack {
                Text(card.cardHolderName)
                    .font(Constants.Fonts.subheadline)
                    .foregroundColor(Color(hex: card.textColor).opacity(0.8))

                Spacer()

                Text(card.cardNumber)
                    .font(Constants.Fonts.footnote)
                    .foregroundColor(Color(hex: card.textColor).opacity(0.6))
            }
        }
        .padding(20)
    }
}

#Preview {
    let card = Card(
        cardType: .credit,
        cardNetwork: .amex,
        cardHolderName: "JOHN DOE",
        cardNumber: "•••• •••••• ••••1234",
        gradientColors: ["#000000", "#1a1a1a"],
        cardNickname: "American Express Centurion",
        eliteTier: .centurion
    )
    CardCellView(card: card)
        .padding()
}
