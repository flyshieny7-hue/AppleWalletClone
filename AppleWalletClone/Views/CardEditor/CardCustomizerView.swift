import SwiftUI

struct CardCustomizerView: View {
    @Bindable var card: Card

    var body: some View {
        Text("Card Customizer")
            .foregroundColor(.white)
    }
}
