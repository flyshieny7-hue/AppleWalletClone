import SwiftUI

@Observable
class TransactionViewModel {
    var transactions: [Transaction] = []
    var filterCategory: TransactionCategory?
    var searchQuery: String = ""
    var isEditing: Bool = false

    var filteredTransactions: [Transaction] {
        var result = transactions

        if let category = filterCategory {
            result = result.filter { $0.category == category }
        }

        if !searchQuery.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(searchQuery) ||
                $0.subtitle.localizedCaseInsensitiveContains(searchQuery)
            }
        }

        return result.sorted { $0.date > $1.date }
    }

    func addTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
    }

    func removeTransaction(_ transaction: Transaction) {
        transactions.removeAll { $0.id == transaction.id }
    }

    func updateTransaction(_ transaction: Transaction) {
        if let index = transactions.firstIndex(where: { $0.id == transaction.id }) {
            transactions[index] = transaction
        }
    }

    func generateSampleTransactions(for cardID: UUID) -> [Transaction] {
        let sampleData: [(String, String, Double, TransactionType, String)] = [
            ("iPhone", "Tap to Cash Received", 2500.00, .tapToCash, "iphone.circle"),
            ("iPhone", "Tap to Cash Received", 25.00, .tapToCash, "iphone.circle"),
            ("iPhone", "Tap to Cash Received", 25.00, .tapToCash, "iphone.circle"),
            ("Added to Balance", "Octopus Card", 2550.00, .addedToBalance, "creditcard"),
            ("Starbucks", "Coffee", -5.67, .purchase, "cup.and.saucer"),
            ("Uber", "Ride", -23.50, .purchase, "car"),
            ("Amazon", "Shopping", -149.99, .purchase, "bag"),
            ("Transfer to Bank", "Chase Checking", -1000.00, .transfer, "building.columns"),
        ]

        return sampleData.enumerated().map { index, data in
            Transaction(
                cardID: cardID,
                title: data.0,
                subtitle: data.1,
                amount: data.2,
                date: Calendar.current.date(byAdding: .day, value: -index, to: Date()) ?? Date(),
                type: data.3,
                merchantIcon: data.4
            )
        }
    }
}
