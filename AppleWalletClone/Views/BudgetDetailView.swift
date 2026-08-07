import SwiftUI
import Charts

struct BudgetDetailView: View {
    @Bindable var viewModel: BudgetViewModel
    let budget: Budget
    @Environment(\.dismiss) private var dismiss

    @State private var showEdit = false
    @State private var editedLimit: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        headerCard
                            .padding(.horizontal, 20)
                            .padding(.top, 12)

                        statsGrid
                            .padding(.horizontal, 20)

                        weeklyChart
                            .padding(.horizontal, 20)

                        transactionsSection
                            .padding(.horizontal, 20)

                        Spacer(minLength: 40)
                    }
                }
            }
            .navigationTitle(budget.category.rawValue)
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            editedLimit = String(format: "%.2f", budget.limit)
                            showEdit = true
                        } label: {
                            Label("Edit Limit", systemImage: "pencil")
                        }

                        Button(role: .destructive) {
                            viewModel.removeBudget(budget)
                            dismiss()
                        } label: {
                            Label("Delete Budget", systemImage: "trash")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }
                }
            }
            .alert("Edit Budget Limit", isPresented: $showEdit) {
                TextField("Limit", text: $editedLimit)
                    .keyboardType(.decimalPad)
                Button("Cancel", role: .cancel) {}
                Button("Save") {
                    if let newLimit = Double(editedLimit), newLimit > 0 {
                        var updated = budget
                        updated.limit = newLimit
                        viewModel.updateBudget(updated)
                        HapticManager.shared.success()
                    }
                }
            } message: {
                Text("Enter new monthly limit for \(budget.category.rawValue)")
            }
        }
    }

    private var headerCard: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(budget.color.opacity(0.15))
                    .frame(width: 80, height: 80)

                Image(systemName: budget.icon)
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundColor(budget.color)
            }

            VStack(spacing: 6) {
                Text(viewModel.spent(for: budget.category).currencyFormatted())
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Text("of \(budget.limit.currencyFormatted())")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 16)

                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [budget.color, budget.color.opacity(0.7)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * CGFloat(viewModel.percentage(for: budget)), height: 16)
                }
            }
            .frame(height: 16)

            HStack {
                BudgetStatusBadge(status: viewModel.status(for: budget))
                Spacer()
                Text("\(Int(viewModel.percentage(for: budget) * 100))% used")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding(24)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private var statsGrid: some View {
        let spent = viewModel.spent(for: budget.category)
        let remaining = viewModel.remaining(for: budget)
        let daily = budget.limit / 30

        return LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 12) {
            StatCard(title: "Remaining", value: remaining.currencyFormatted(), color: "#34C759")
            StatCard(title: "Daily Budget", value: daily.currencyFormatted(), color: "#007AFF")
            StatCard(title: "Limit", value: budget.limit.currencyFormatted(), color: "#AF52DE")
            StatCard(title: "Status", value: viewModel.status(for: budget).rawValue, color: viewModel.status(for: budget).color.toHex() ?? "#8E8E93")
        }
    }

    private var weeklyChart: some View {
        let calendar = Calendar.current
        let now = Date()
        let weeklyData = (0..<4).map { week -> (String, Double) in
            guard let weekStart = calendar.date(byAdding: .weekOfYear, value: -week, to: now) else { return ("", 0) }
            let weekTxs = viewModel.transactions.filter {
                $0.category == budget.category &&
                $0.amount < 0 &&
                calendar.isDate($0.date, equalTo: weekStart, toGranularity: .weekOfYear)
            }
            let amount = abs(weekTxs.reduce(0) { $0 + $1.amount })
            let formatter = DateFormatter()
            formatter.dateFormat = "'W'w"
            return (formatter.string(from: weekStart), amount)
        }.reversed()

        return VStack(alignment: .leading, spacing: 12) {
            Text("Weekly Trend")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)

            Chart(Array(weeklyData), id: \.0) { item in
                BarMark(
                    x: .value("Week", item.0),
                    y: .value("Amount", item.1)
                )
                .foregroundStyle(budget.color)
                .cornerRadius(4)
            }
            .frame(height: 140)
            .chartYAxis {
                AxisMarks(position: .leading) { value in
                    AxisGridLine().foregroundStyle(Color.white.opacity(0.1))
                    AxisValueLabel {
                        if let v = value.as(Double.self) {
                            Text("$\(Int(v))")
                                .font(.system(size: 10))
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                }
            }
            .chartXAxis {
                AxisMarks { value in
                    AxisValueLabel {
                        if let str = value.as(String.self) {
                            Text(str)
                                .font(.system(size: 10))
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                }
            }
        }
        .padding(16)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var transactionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recent Transactions")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)

            let recentTxs = viewModel.transactions
                .filter { $0.category == budget.category }
                .sorted { $0.date > $1.date }
                .prefix(5)

            if recentTxs.isEmpty {
                Text("No transactions this month")
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
            } else {
                ForEach(Array(recentTxs)) { tx in
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(budget.color.opacity(0.2))
                                .frame(width: 36, height: 36)
                            Image(systemName: tx.merchantIcon)
                                .font(.system(size: 14))
                                .foregroundColor(budget.color)
                        }

                        VStack(alignment: .leading, spacing: 2) {
                            Text(tx.title)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.white)
                            Text(tx.date, style: .date)
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.5))
                        }

                        Spacer()

                        Text(abs(tx.amount).currencyFormatted())
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .padding(16)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct BudgetStatusBadge: View {
    let status: BudgetStatus

    var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(status.color)
                .frame(width: 6, height: 6)
            Text(status.rawValue)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(status.color)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(status.color.opacity(0.15))
        .clipShape(Capsule())
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let color: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.5))
            Text(value)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(Color(hex: color))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    let vm = BudgetViewModel()
    vm.loadSampleBudgets()
    return BudgetDetailView(
        viewModel: vm,
        budget: vm.budgets.first ?? Budget(category: .food, limit: 500, icon: "fork.knife", colorHex: "#FF9500")
    )
}
