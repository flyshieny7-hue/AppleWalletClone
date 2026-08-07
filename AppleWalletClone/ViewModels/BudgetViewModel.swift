import SwiftUI

@Observable
class BudgetViewModel {
    var budgets: [Budget] = []
    var transactions: [Transaction] = []

    var totalBudgeted: Double {
        budgets.reduce(0) { $0 + $1.limit }
    }

    var totalSpent: Double {
        budgets.reduce(0) { $0 + spent(for: $1.category) }
    }

    func spent(for category: TransactionCategory) -> Double {
        let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date())) ?? Date()
        return abs(transactions.filter {
            $0.category == category &&
            $0.amount < 0 &&
            $0.date >= startOfMonth
        }.reduce(0) { $0 + $1.amount })
    }

    func remaining(for budget: Budget) -> Double {
        max(budget.limit - spent(for: budget.category), 0)
    }

    func percentage(for budget: Budget) -> Double {
        guard budget.limit > 0 else { return 0 }
        return min(spent(for: budget.category) / budget.limit, 1.0)
    }

    func status(for budget: Budget) -> BudgetStatus {
        let pct = percentage(for: budget)
        if pct >= 1.0 { return .exceeded }
        if pct >= 0.8 { return .warning }
        return .onTrack
    }

    func addBudget(_ budget: Budget) {
        budgets.append(budget)
    }

    func removeBudget(_ budget: Budget) {
        budgets.removeAll { $0.id == budget.id }
    }

    func updateBudget(_ budget: Budget) {
        if let index = budgets.firstIndex(where: { $0.id == budget.id }) {
            budgets[index] = budget
        }
    }

    func loadSampleBudgets() {
        budgets = [
            Budget(category: .food, limit: 500, icon: "fork.knife", colorHex: "#FF9500"),
            Budget(category: .shopping, limit: 300, icon: "bag.fill", colorHex: "#007AFF"),
            Budget(category: .transport, limit: 200, icon: "car.fill", colorHex: "#34C759"),
            Budget(category: .entertainment, limit: 150, icon: "film.fill", colorHex: "#AF52DE"),
            Budget(category: .travel, limit: 800, icon: "airplane", colorHex: "#5856D6"),
            Budget(category: .bills, limit: 400, icon: "doc.text.fill", colorHex: "#FF3B30"),
        ]
    }
}

struct Budget: Identifiable, Equatable {
    let id: UUID
    var category: TransactionCategory
    var limit: Double
    var icon: String
    var colorHex: String
    var alertThreshold: Double
    var isActive: Bool

    init(
        id: UUID = UUID(),
        category: TransactionCategory,
        limit: Double,
        icon: String,
        colorHex: String,
        alertThreshold: Double = 0.8,
        isActive: Bool = true
    ) {
        self.id = id
        self.category = category
        self.limit = limit
        self.icon = icon
        self.colorHex = colorHex
        self.alertThreshold = alertThreshold
        self.isActive = isActive
    }

    var color: Color {
        Color(hex: colorHex)
    }
}

enum BudgetStatus: String, CaseIterable {
    case onTrack = "On Track"
    case warning = "Warning"
    case exceeded = "Exceeded"

    var color: Color {
        switch self {
        case .onTrack: return Color(hex: "#34C759")
        case .warning: return Color(hex: "#FF9500")
        case .exceeded: return Color(hex: "#FF3B30")
        }
    }
}
