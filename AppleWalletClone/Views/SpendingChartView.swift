import SwiftUI
import Charts

struct SpendingChartView: View {
    @State private var viewModel = AnalyticsViewModel()
    @State private var selectedTimeRange: TimeRange = .week

    enum TimeRange: String, CaseIterable {
        case week = "Week"
        case month = "Month"
        case year = "Year"
    }

    var filteredData: [(day: String, amount: Double)] {
        let calendar = Calendar.current
        let now = Date()
        var result: [(String, Double)] = []

        switch selectedTimeRange {
        case .week:
            for i in (0..<7).reversed() {
                guard let date = calendar.date(byAdding: .day, value: -i, to: now) else { continue }
                let dayTxs = viewModel.transactions.filter {
                    calendar.isDate($0.date, inSameDayAs: date) && $0.amount < 0
                }
                let amount = abs(dayTxs.reduce(0) { $0 + $1.amount })
                let formatter = DateFormatter()
                formatter.dateFormat = "E"
                result.append((formatter.string(from: date), amount))
            }
        case .month:
            for i in (0..<30).reversed() {
                guard let date = calendar.date(byAdding: .day, value: -i, to: now) else { continue }
                let dayTxs = viewModel.transactions.filter {
                    calendar.isDate($0.date, inSameDayAs: date) && $0.amount < 0
                }
                let amount = abs(dayTxs.reduce(0) { $0 + $1.amount })
                let formatter = DateFormatter()
                formatter.dateFormat = "d"
                result.append((formatter.string(from: date), amount))
            }
        case .year:
            for i in (0..<12).reversed() {
                guard let date = calendar.date(byAdding: .month, value: -i, to: now) else { continue }
                let monthTxs = viewModel.transactions.filter {
                    calendar.isDate($0.date, equalTo: date, toGranularity: .month) && $0.amount < 0
                }
                let amount = abs(monthTxs.reduce(0) { $0 + $1.amount })
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM"
                result.append((formatter.string(from: date), amount))
            }
        }
        return result
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header

            timeRangePicker

            Chart {
                ForEach(filteredData, id: \.day) { item in
                    BarMark(
                        x: .value("Period", item.day),
                        y: .value("Amount", item.amount)
                    )
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "#007AFF"), Color(hex: "#5856D6")],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .cornerRadius(4)
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

            summaryRow
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
                Text("Spending")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)

                Text("Total: \(viewModel.totalSpending.currencyFormatted())")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()

            Image(systemName: "chart.bar.fill")
                .font(.system(size: 24))
                .foregroundColor(Color(hex: "#007AFF"))
        }
    }

    private var timeRangePicker: some View {
        HStack(spacing: 8) {
            ForEach(TimeRange.allCases, id: \.self) { range in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        selectedTimeRange = range
                    }
                    HapticManager.shared.lightImpact()
                } label: {
                    Text(range.rawValue)
                        .font(.system(size: 13, weight: selectedTimeRange == range ? .semibold : .medium))
                        .foregroundColor(selectedTimeRange == range ? .black : .white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(selectedTimeRange == range ? Color.white : Color.white.opacity(0.1))
                        .clipShape(Capsule())
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }

    private var summaryRow: some View {
        HStack(spacing: 16) {
            SummaryPill(title: "Income", value: viewModel.totalIncome.currencyFormatted(), color: "#34C759")
            SummaryPill(title: "Net", value: viewModel.netFlow.currencyFormatted(), color: viewModel.netFlow >= 0 ? "#34C759" : "#FF3B30")
        }
    }
}

struct SummaryPill: View {
    let title: String
    let value: String
    let color: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.5))
            Text(value)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Color(hex: color))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    SpendingChartView()
        .background(Color.black)
}
