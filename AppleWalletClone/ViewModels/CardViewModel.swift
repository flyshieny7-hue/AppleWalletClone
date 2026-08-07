import SwiftUI
import Combine

@Observable
class CardViewModel {
    var currentCard: Card?
    var isEditing: Bool = false
    var editedName: String = ""
    var editedNumber: String = ""
    var editedExpiry: String = ""
    var editedCVV: String = ""
    var editedBalance: Double = 0.0

    func startEditing(_ card: Card) {
        currentCard = card
        editedName = card.cardHolderName
        editedNumber = card.cardNumber
        editedExpiry = card.expirationDate
        editedCVV = card.cvv
        editedBalance = card.balance
        isEditing = true
    }

    func saveChanges() {
        guard var card = currentCard else { return }
        card.cardHolderName = editedName
        card.cardNumber = editedNumber
        card.expirationDate = editedExpiry
        card.cvv = editedCVV
        card.balance = editedBalance
        isEditing = false
    }

    func cancelEditing() {
        isEditing = false
        currentCard = nil
    }
}
