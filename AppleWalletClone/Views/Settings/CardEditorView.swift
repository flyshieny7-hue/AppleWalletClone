import SwiftUI

struct CardEditorView: View {
    @Bindable var card: Card

    var body: some View {
        Text("Card Editor — \(card.cardHolderName)")
            .foregroundColor(.white)
    }
}
