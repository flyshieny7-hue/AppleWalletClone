import SwiftUI

struct CardDesignPicker: View {
    @Binding var gradientColors: [String]
    @Binding var patternType: CardPattern

    var body: some View {
        Text("Card Design Picker")
            .foregroundColor(.white)
    }
}
