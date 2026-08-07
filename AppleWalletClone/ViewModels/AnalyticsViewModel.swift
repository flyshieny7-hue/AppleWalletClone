import SwiftUI
import Combine

@Observable
class AnalyticsViewModel {
    var transactions: [Transaction] = []

    // MARK: — Spending by Category
    var spendingByCategory: [(category: TransactionCategory, amount: Double)] {
        let expenses = transactions.filter { $0.amount < 0 }
        let grouped = Dictionary(grouping: expenses) { $0.category }
        return grouped.map { (cat, txs) in
            (cat, abs(txs.reduce(0) { $0 + $1.amount }))
        }.sorted { $0.amount > $1.amount }
    }

    // MARK: — Spending by Month
    var spendingByMonth: [(month: String, amount: Double)] {
        let calendar = Calendar.current
        let expenses = transactions.filter { $0.amount < 0 }
        let grouped = Dictionary(grouping: expenses) { tx -> String in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM yyyy"
            return formatter.string(from: tx.date)
        }
        return grouped.map { (month, txs) in
            (month, abs(txs.reduce(0) { $0 + $1.amount }))
        }.sorted { a, b in
            let df = DateFormatter()
            df.dateFormat = "MMM yyyy"
            return df.date(from: a.month) ?? Date() > df.date(from: b.month) ?? Date()
        }
    }

    // MARK: — Monthly Comparison (last 6 months)
    var monthlyComparison: [(month: String, income: Double, expense: Double)] {
        let calendar = Calendar.current
        let now = Date()
        var result: [(String, Double, Double)] = []

        for i in (0..<6).reversed() {
            guard let monthStart = calendar.date(byAdding: .month, value: -i, to: now) else { continue }
            let monthTxs = transactions.filter {
                calendar.isDate($0.date, equalTo: monthStart, toGranularity: .month)
            }
            let income = monthTxs.filter { $0.amount > 0 }.reduce(0) { $0 + $1.amount }
            let expense = abs(monthTxs.filter { $0.amount < 0 }.reduce(0) { $0 + $1.amount })

            let formatter = DateFormatter()
            formatter.dateFormat = "MMM"
            result.append((formatter.string(from: monthStart), income, expense))
        }
        return result
    }

    // MARK: — Total Spending
    var totalSpending: Double {
        abs(transactions.filter { $0.amount < 0 }.reduce(0) { $0 + $1.amount })
    }

    var totalIncome: Double {
        transactions.filter { $0.amount > 0 }.reduce(0) { $0 + $1.amount }
    }

    var netFlow: Double {
        totalIncome - totalSpending
    }

    // MARK: — Top Merchant
    var topMerchant: (name: String, amount: Double)? {
        let expenses = transactions.filter { $0.amount < 0 }
        let grouped = Dictionary(grouping: expenses) { $0.title }
        return grouped.map { (name, txs) in
            (name, abs(txs.reduce(0) { $0 + $1.amount }))
        }.sorted { $0.amount > $1.amount }.first
    }

    // MARK: — Average Daily Spending
    var averageDailySpending: Double {
        guard !transactions.isEmpty else { return 0 }
        let dates = transactions.map(\.date)
        guard let earliest = dates.min(), let latest = dates.max() else { return 0 }
        let days = max(Calendar.current.dateComponents([.day], from: earliest, to: latest).day ?? 1, 1)
        return totalSpending / Double(days)
    }

    func loadSampleData(cardID: UUID) {
        let sample: [(String, String, Double, TransactionCategory)] = [
            ("Starbucks", "Coffee", -5.67, .food),
            ("Whole Foods", "Groceries", -89.45, .food),
            ("Uber", "Ride", -23.50, .transport),
            ("Amazon", "Shopping", -149.99, .shopping),
            ("Netflix", "Subscription", -15.99, .entertainment),
            ("Shell", "Gas", -45.00, .transport),
            ("Apple Store", "AirPods", -249.00, .shopping),
            ("Salary", "Monthly", 5000.00, .transfer),
            ("Starbucks", "Coffee", -6.50, .food),
            ("Uber Eats", "Dinner", -32.00, .food),
            ("Spotify", "Premium", -9.99, .entertainment),
            ("CVS", "Pharmacy", -28.75, .health),
            ("Delta", "Flight", -450.00, .travel),
        ]

        transactions = sample.enumerated().map { index, data in
            Transaction(
                cardID: cardID,
                title: data.0,
                subtitle: data.1,
                amount: data.2,
                date: Calendar.current.date(byAdding: .day, value: -index * 2, to: Date()) ?? Date(),
                type: data.2 > 0 ? .deposit : .purchase,
                category: data.3,
                tags: [data.3.rawValue]
            )
        }
    }
}
