import SwiftUI

struct CardDetailView: View {
    let card: Card

    var body: some View {
        Text("Card Detail — \(card.cardNickname)")
            .foregroundColor(.white)
    }
}
