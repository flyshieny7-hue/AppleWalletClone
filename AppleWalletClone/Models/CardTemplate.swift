import SwiftUI

struct CardTemplate: Identifiable {
    let id = UUID()
    let name: String
    let cardNetwork: CardNetwork
    let cardType: CardType
    let country: String
    let eliteTier: EliteTier
    let gradientColors: [String]
    let patternType: CardPattern
    let logoColor: String
    let textColor: String
    let description: String
}
