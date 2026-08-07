import SwiftUI
import Charts

struct CategoryBreakdownView: View {
    @State private var viewModel = AnalyticsViewModel()
    @State private var selectedCategory: TransactionCategory?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header

            if viewModel.spendingByCategory.isEmpty {
                emptyState
            } else {
                chartSection
                legendSection
            }
        }
        .padding(20)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onAppear {
            viewModel.loadSampleData(cardID: UUID())
        }
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("By Category")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)

                Text("\(viewModel.spendingByCategory.count) categories")
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()

            Image(systemName: "chart.pie.fill")
                .font(.system(size: 24))
                .foregroundColor(Color(hex: "#AF52DE"))
        }
    }

    private var chartSection: some View {
        Chart(viewModel.spendingByCategory, id: \.category) { item in
            SectorMark(
                angle: .value("Amount", item.amount),
                innerRadius: .ratio(0.55),
                angularInset: 2
            )
            .foregroundStyle(by: .value("Category", item.category.rawValue))
            .cornerRadius(6)
            .opacity(selectedCategory == nil || selectedCategory == item.category ? 1.0 : 0.3)
        }
        .frame(height: 220)
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    VStack(spacing: 4) {
                        if let selected = selectedCategory,
                           let item = viewModel.spendingByCategory.first(where: { $0.category == selected }) {
                            Text(item.category.rawValue)
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.7))
                            Text(item.amount.currencyFormatted())
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        } else {
                            Text("Total")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.5))
                            Text(viewModel.totalSpending.currencyFormatted())
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    .position(x: frame.midX, y: frame.midY)
                }
            }
        }
        .chartAngleSelection(value: .constant(nil))
        .onChange(of: selectedCategory) { _, _ in
            HapticManager.shared.selection()
        }
    }

    private var legendSection: some View {
        VStack(spacing: 10) {
            ForEach(viewModel.spendingByCategory, id: \.category) { item in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        selectedCategory = (selectedCategory == item.category) ? nil : item.category
                    }
                } label: {
                    HStack(spacing: 12) {
                        Circle()
                            .fill(categoryColor(item.category))
                            .frame(width: 10, height: 10)

                        Text(item.category.rawValue)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)

                        Spacer()

                        Text(item.amount.currencyFormatted())
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)

                        Text("\(Int((item.amount / max(viewModel.totalSpending, 1)) * 100))%")
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.5))
                            .frame(width: 40, alignment: .trailing)
                    }
                    .padding(.vertical, 6)
                    .contentShape(Rectangle())
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "chart.pie")
                .font(.system(size: 40))
                .foregroundColor(.white.opacity(0.25))
            Text("No Data")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }

    private func categoryColor(_ category: TransactionCategory) -> Color {
        switch category {
        case .food: return Color(hex: "#FF9500")
        case .shopping: return Color(hex: "#007AFF")
        case .transport: return Color(hex: "#34C759")
        case .entertainment: return Color(hex: "#AF52DE")
        case .health: return Color(hex: "#FF2D55")
        case .travel: return Color(hex: "#5856D6")
        case .bills: return Color(hex: "#FF3B30")
        case .transfer: return Color(hex: "#5AC8FA")
        case .other: return Color(hex: "#8E8E93")
        }
    }
}

#Preview {
    CategoryBreakdownView()
        .background(Color.black)
}
