import SwiftUI
import SwiftData

@Model
class Transaction: Identifiable {
    var id: UUID
    var cardID: UUID
    var title: String
    var subtitle: String
    var amount: Double
    var date: Date
    var type: TransactionType
    var status: TransactionStatus
    var merchantIcon: String
    var category: TransactionCategory
    var note: String
    var isPending: Bool

    init(
        id: UUID = UUID(),
        cardID: UUID,
        title: String,
        subtitle: String = "",
        amount: Double,
        date: Date = Date(),
        type: TransactionType,
        status: TransactionStatus = .completed,
        merchantIcon: String = "dollarsign.circle",
        category: TransactionCategory = .other,
        note: String = "",
        isPending: Bool = false
    ) {
        self.id = id
        self.cardID = cardID
        self.title = title
        self.subtitle = subtitle
        self.amount = amount
        self.date = date
        self.type = type
        self.status = status
        self.merchantIcon = merchantIcon
        self.category = category
        self.note = note
        self.isPending = isPending
    }
}

enum TransactionType: String, Codable, CaseIterable {
    case purchase = "Purchase"
    case refund = "Refund"
    case transfer = "Transfer"
    case deposit = "Deposit"
    case withdrawal = "Withdrawal"
    case tapToCash = "Tap to Cash"
    case applePay = "Apple Pay"
    case addedToBalance = "Added to Balance"
}

enum TransactionStatus: String, Codable, CaseIterable {
    case pending = "Pending"
    case completed = "Completed"
    case failed = "Failed"
    case reversed = "Reversed"
}

enum TransactionCategory: String, Codable, CaseIterable {
    case food = "Food & Drink"
    case shopping = "Shopping"
    case transport = "Transport"
    case entertainment = "Entertainment"
    case health = "Health"
    case travel = "Travel"
    case bills = "Bills & Utilities"
    case transfer = "Transfer"
    case other = "Other"
}
