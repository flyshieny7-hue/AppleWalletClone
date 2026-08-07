import SwiftUI

struct BudgetOverviewView: View {
    @State private var viewModel = BudgetViewModel()
    @State private var showAddBudget = false
    @State private var selectedBudget: Budget?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        totalSummaryCard
                            .padding(.horizontal, 20)
                            .padding(.top, 12)

                        budgetsList
                            .padding(.horizontal, 20)

                        Spacer(minLength: 40)
                    }
                }
            }
            .navigationTitle("Budgets")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddBudget = true
                        HapticManager.shared.mediumImpact()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showAddBudget) {
                AddBudgetView(viewModel: viewModel)
            }
            .sheet(item: $selectedBudget) { budget in
                BudgetDetailView(viewModel: viewModel, budget: budget)
            }
            .onAppear {
                viewModel.loadSampleBudgets()
            }
        }
    }

    private var totalSummaryCard: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Total Budgeted")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                    Text(viewModel.totalBudgeted.currencyFormatted())
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Spent")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                    Text(viewModel.totalSpent.currencyFormatted())
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(Color(hex: "#FF3B30"))
                }
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 12)

                    let pct = min(viewModel.totalBudgeted > 0 ? viewModel.totalSpent / viewModel.totalBudgeted : 0, 1.0)
                    RoundedRectangle(cornerRadius: 6)
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "#34C759"), Color(hex: "#FF9500"), Color(hex: "#FF3B30")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * CGFloat(pct), height: 12)
                }
            }
            .frame(height: 12)

            HStack {
                Text("\(Int((viewModel.totalBudgeted > 0 ? viewModel.totalSpent / viewModel.totalBudgeted : 0) * 100))% used")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.5))
                Spacer()
                Text("Remaining: \((viewModel.totalBudgeted - viewModel.totalSpent).currencyFormatted())")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding(20)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private var budgetsList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Categories")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, 4)

            ForEach(viewModel.budgets) { budget in
                Button {
                    selectedBudget = budget
                    HapticManager.shared.lightImpact()
                } label: {
                    BudgetRowView(viewModel: viewModel, budget: budget)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct BudgetRowView: View {
    let viewModel: BudgetViewModel
    let budget: Budget

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(budget.color.opacity(0.2))
                    .frame(width: 44, height: 44)

                Image(systemName: budget.icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(budget.color)
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(budget.category.rawValue)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)

                    Spacer()

                    Text("\(Int(viewModel.percentage(for: budget) * 100))%")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(viewModel.status(for: budget).color)
                }

                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white.opacity(0.1))
                            .frame(height: 6)

                        RoundedRectangle(cornerRadius: 4)
                            .fill(budget.color)
                            .frame(width: geo.size.width * CGFloat(viewModel.percentage(for: budget)), height: 6)
                    }
                }
                .frame(height: 6)

                HStack {
                    Text("\(viewModel.spent(for: budget.category).currencyFormatted()) spent")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))

                    Spacer()

                    Text("\(viewModel.remaining(for: budget).currencyFormatted()) left")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                }
            }
        }
        .padding(16)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(viewModel.status(for: budget).color.opacity(0.3), lineWidth: viewModel.status(for: budget) != .onTrack ? 1 : 0)
        )
    }
}

#Preview {
    BudgetOverviewView()
}
