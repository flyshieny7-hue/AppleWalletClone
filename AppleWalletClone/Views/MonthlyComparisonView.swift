import SwiftUI
import Charts

struct MonthlyComparisonView: View {
    @State private var viewModel = AnalyticsViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header

            if viewModel.monthlyComparison.isEmpty {
                emptyState
            } else {
                comparisonChart
                legendRow
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
                Text("Monthly Comparison")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)

                Text("Income vs Expenses")
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()

            Image(systemName: "chart.bar.xaxis")
                .font(.system(size: 24))
                .foregroundColor(Color(hex: "#34C759"))
        }
    }

    private var comparisonChart: some View {
        Chart {
            ForEach(viewModel.monthlyComparison, id: \.month) { item in
                BarMark(
                    x: .value("Month", item.month),
                    y: .value("Income", item.income)
                )
                .foregroundStyle(Color(hex: "#34C759"))
                .cornerRadius(4)
                .position(by: .value("Type", "Income"))

                BarMark(
                    x: .value("Month", item.month),
                    y: .value("Expense", item.expense)
                )
                .foregroundStyle(Color(hex: "#FF3B30"))
                .cornerRadius(4)
                .position(by: .value("Type", "Expense"))
            }
        }
        .frame(height: 200)
        .chartYAxis {
            AxisMarks(position: .leading) { value in
                AxisGridLine()
                    .foregroundStyle(Color.white.opacity(0.1))
                AxisValueLabel {
                    if let doubleValue = value.as(Double.self) {
                        Text("$\(Int(doubleValue))")
                            .font(.system(size: 10))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            }
        }
        .chartXAxis {
            AxisMarks { value in
                AxisValueLabel {
                    if let strValue = value.as(String.self) {
                        Text(strValue)
                            .font(.system(size: 10))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            }
        }
    }

    private var legendRow: some View {
        HStack(spacing: 20) {
            HStack(spacing: 6) {
                Circle()
                    .fill(Color(hex: "#34C759"))
                    .frame(width: 8, height: 8)
                Text("Income")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))
            }

            HStack(spacing: 6) {
                Circle()
                    .fill(Color(hex: "#FF3B30"))
                    .frame(width: 8, height: 8)
                Text("Expenses")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))
            }

            Spacer()
        }
        .padding(.top, 4)
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "chart.bar.xaxis")
                .font(.system(size: 40))
                .foregroundColor(.white.opacity(0.25))
            Text("No Data")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
}

#Preview {
    MonthlyComparisonView()
        .background(Color.black)
}
