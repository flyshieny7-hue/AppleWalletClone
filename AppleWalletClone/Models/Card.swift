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

    // MARK: — NEW FIELDS
    var currencyCode: String
    var cardStatus: CardStatus
    var creditLimit: Double?
    var availableCredit: Double?
    var statementBalance: Double?
    var minimumPayment: Double?
    var paymentDueDate: Date?
    var rewardPoints: Int?
    var miles: Int?
    var cashbackPercentage: Double?

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
        eliteTier: EliteTier = .standard,
        currencyCode: String = "USD",
        cardStatus: CardStatus = .active,
        creditLimit: Double? = nil,
        availableCredit: Double? = nil,
        statementBalance: Double? = nil,
        minimumPayment: Double? = nil,
        paymentDueDate: Date? = nil,
        rewardPoints: Int? = nil,
        miles: Int? = nil,
        cashbackPercentage: Double? = nil
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
        self.currencyCode = currencyCode
        self.cardStatus = cardStatus
        self.creditLimit = creditLimit
        self.availableCredit = availableCredit
        self.statementBalance = statementBalance
        self.minimumPayment = minimumPayment
        self.paymentDueDate = paymentDueDate
        self.rewardPoints = rewardPoints
        self.miles = miles
        self.cashbackPercentage = cashbackPercentage
    }

    var maskedNumber: String {
        let digits = cardNumber.filter { $0.isNumber }
        guard digits.count >= 4 else { return cardNumber }
        let lastFour = String(digits.suffix(4))
        return "•••• •••• •••• \(lastFour)"
    }

    var isCredit: Bool {
        cardType == .credit
    }

    var utilizationRate: Double? {
        guard let limit = creditLimit, limit > 0 else { return nil }
        let used = limit - (availableCredit ?? 0)
        return used / limit
    }

    var formattedCurrencyCode: String {
        currencyCode.uppercased()
    }
}

// MARK: — Original Enums (preserved)
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

// MARK: — New Enum
enum CardStatus: String, Codable, CaseIterable {
    case active = "active"
    case frozen = "frozen"
    case expired = "expired"
}
