import SwiftUI
import SwiftData

@Model
class Wallet: Identifiable {
    var id: UUID
    var name: String
    var isDefault: Bool
    var createdAt: Date

    @Relationship(deleteRule: .cascade) var cards: [Card]?

    init(
        id: UUID = UUID(),
        name: String = "My Wallet",
        isDefault: Bool = true
    ) {
        self.id = id
        self.name = name
        self.isDefault = isDefault
        self.createdAt = Date()
    }
}
