import SwiftUI
import SwiftData

@Model
class User: Identifiable {
    var id: UUID
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var appleCashBalance: Double
    var appleAccountBalance: Double
    var profileImage: Data?
    var createdAt: Date

    // MARK: — NEW FIELDS
    var totalNetWorth: Double
    var monthlySpending: Double
    var creditScore: Int?
    var darkMode: Bool

    init(
        id: UUID = UUID(),
        firstName: String = "John",
        lastName: String = "Doe",
        email: String = "john.doe@icloud.com",
        phoneNumber: String = "+1 (555) 123-4567",
        appleCashBalance: Double = 5100.00,
        appleAccountBalance: Double = 0.00,
        totalNetWorth: Double = 0.0,
        monthlySpending: Double = 0.0,
        creditScore: Int? = nil,
        darkMode: Bool = true
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.appleCashBalance = appleCashBalance
        self.appleAccountBalance = appleAccountBalance
        self.createdAt = Date()
        self.totalNetWorth = totalNetWorth
        self.monthlySpending = monthlySpending
        self.creditScore = creditScore
        self.darkMode = darkMode
    }

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
