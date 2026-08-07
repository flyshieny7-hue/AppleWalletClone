import SwiftUI

struct CardNumberEditor: View {
    @Binding var cardNumber: String
    let network: CardNetwork

    var body: some View {
        Text("Card Number Editor")
            .foregroundColor(.white)
    }
}
