import SwiftUI
import SwiftData

@Model
class Card: Identifiable {
    var id: UUID
    var cardType: CardType
    var cardNetwork: CardNetwork
    var cardHolderName: String
    var cardNumber: String
    var expirationDate: String
    var cvv: String
    var balance: Double
    var cardNickname: String
    var gradientColors: [String]
    var patternType: CardPattern
    var isLocked: Bool
    var isDefault: Bool
    var country: String
    var eliteTier: EliteTier
    var createdAt: Date

    @Relationship(deleteRule: .cascade) var transactions: [Transaction]?

    init(
        id: UUID = UUID(),
        cardType: CardType,
        cardNetwork: CardNetwork,
        cardHolderName: String = "JOHN DOE",
        cardNumber: String = "•••• •••• •••• 1234",
        expirationDate: String = "12/28",
        cvv: String = "123",
        balance: Double = 0.0,
        cardNickname: String = "",
        gradientColors: [String] = ["#1C1C1E", "#2C2C2E"],
        patternType: CardPattern = .none,
        isLocked: Bool = false,
        isDefault: Bool = false,
        country: String = "USA",
        eliteTier: EliteTier = .standard
    ) {
        self.id = id
        self.cardType = cardType
        self.cardNetwork = cardNetwork
        self.cardHolderName = cardHolderName
        self.cardNumber = cardNumber
        self.expirationDate = expirationDate
        self.cvv = cvv
        self.balance = balance
        self.cardNickname = cardNickname
        self.gradientColors = gradientColors
        self.patternType = patternType
        self.isLocked = isLocked
        self.isDefault = isDefault
        self.country = country
        self.eliteTier = eliteTier
        self.createdAt = Date()
    }
}

enum CardType: String, Codable, CaseIterable {
    case credit = "Credit"
    case debit = "Debit"
    case prepaid = "Prepaid"
    case store = "Store"
    case transit = "Transit"
    case appleCash = "Apple Cash"
    case appleAccount = "Apple Account"
    case loyalty = "Loyalty"
}

enum CardNetwork: String, Codable, CaseIterable {
    case visa = "Visa"
    case mastercard = "Mastercard"
    case amex = "American Express"
    case discover = "Discover"
    case unionPay = "UnionPay"
    case jcb = "JCB"
    case dinersClub = "Diners Club"
    case interac = "Interac"
    case rupay = "RuPay"
    case mir = "Mir"
    case appleCard = "Apple Card"
    case other = "Other"
}

enum CardPattern: String, Codable, CaseIterable {
    case none = "None"
    case dots = "Dots"
    case lines = "Lines"
    case waves = "Waves"
    case arrows = "Arrows"
    case circles = "Circles"
    case hexagons = "Hexagons"
    case amexCenturion = "Amex Centurion"
    case appleCashPattern = "Apple Cash"
}

enum EliteTier: String, Codable, CaseIterable {
    case standard = "Standard"
    case gold = "Gold"
    case platinum = "Platinum"
    case black = "Black"
    case infinite = "Infinite"
    case worldElite = "World Elite"
    case centurion = "Centurion"
    case reserve = "Reserve"
    case royal = "Royal"
    case silk = "Silk"
    case theClass = "The Class"
    case insignia = "Insignia"
}
