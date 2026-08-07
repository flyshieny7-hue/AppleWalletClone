import SwiftUI
import SwiftData
import Combine

@Observable
class WalletViewModel {
    var cards: [Card] = []
    var selectedCard: Card?
    var isCardStackExpanded: Bool = false
    var isApplePayPresented: Bool = false

    init() {
        loadDefaultCards()
    }

    func loadDefaultCards() {
        cards = CardTemplates.allCards.map { template in
            Card(
                cardType: template.cardType,
                cardNetwork: template.cardNetwork,
                cardHolderName: "JOHN DOE",
                cardNumber: generateCardNumber(for: template.cardNetwork),
                expirationDate: generateExpirationDate(),
                cvv: generateCVV(),
                balance: template.cardType == .appleCash ? 5100.00 : 
                         template.cardType == .appleAccount ? 0.00 : 0.00,
                cardNickname: template.name,
                gradientColors: template.gradientColors,
                patternType: template.patternType,
                isDefault: template.name == "Apple Cash",
                country: template.country,
                eliteTier: template.eliteTier
            )
        }
    }

    func addCard(_ card: Card) {
        cards.append(card)
    }

    func removeCard(_ card: Card) {
        cards.removeAll { $0.id == card.id }
    }

    func updateCard(_ card: Card) {
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            cards[index] = card
        }
    }

    func selectCard(_ card: Card?) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            selectedCard = card
        }
    }

    func toggleCardStack() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.75)) {
            isCardStackExpanded.toggle()
        }
    }

    private func generateCardNumber(for network: CardNetwork) -> String {
        let lastFour = String(format: "%04d", Int.random(in: 1000...9999))
        switch network {
        case .amex:
            return "•••• •••••• ••••\(lastFour)"
        default:
            return "•••• •••• •••• \(lastFour)"
        }
    }

    private func generateExpirationDate() -> String {
        let month = String(format: "%02d", Int.random(in: 1...12))
        let year = Int.random(in: 26...30)
        return "\(month)/\(year)"
    }

    private func generateCVV() -> String {
        String(format: "%03d", Int.random(in: 100...999))
    }
}
