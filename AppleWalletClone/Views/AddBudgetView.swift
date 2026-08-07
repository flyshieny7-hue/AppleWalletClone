import SwiftUI

struct AddBudgetView: View {
    @Bindable var viewModel: BudgetViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var selectedCategory: TransactionCategory = .food
    @State private var limitText: String = ""
    @State private var selectedIcon: String = "fork.knife"
    @State private var selectedColor: String = "#FF9500"
    @State private var alertThreshold: Double = 0.8

    private let categoryIcons: [TransactionCategory: String] = [
        .food: "fork.knife",
        .shopping: "bag.fill",
        .transport: "car.fill",
        .entertainment: "film.fill",
        .health: "heart.fill",
        .travel: "airplane",
        .bills: "doc.text.fill",
        .transfer: "arrow.left.arrow.right",
        .other: "tag.fill"
    ]

    private let categoryColors: [TransactionCategory: String] = [
        .food: "#FF9500",
        .shopping: "#007AFF",
        .transport: "#34C759",
        .entertainment: "#AF52DE",
        .health: "#FF2D55",
        .travel: "#5856D6",
        .bills: "#FF3B30",
        .transfer: "#5AC8FA",
        .other: "#8E8E93"
    ]

    private var numericLimit: Double {
        Double(limitText) ?? 0
    }

    private var isValid: Bool {
        numericLimit > 0 && !viewModel.budgets.contains(where: { $0.category == selectedCategory })
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        previewCard
                            .padding(.horizontal, 20)
                            .padding(.top, 12)

                        categorySection
                            .padding(.horizontal, 20)

                        limitSection
                            .padding(.horizontal, 20)

                        alertSection
                            .padding(.horizontal, 20)

                        Spacer(minLength: 40)
                    }
                }
            }
            .navigationTitle("New Budget")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let budget = Budget(
                            category: selectedCategory,
                            limit: numericLimit,
                            icon: selectedIcon,
                            colorHex: selectedColor,
                            alertThreshold: alertThreshold
                        )
                        viewModel.addBudget(budget)
                        HapticManager.shared.success()
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .disabled(!isValid)
                    .opacity(isValid ? 1.0 : 0.5)
                }
            }
            .onChange(of: selectedCategory) { _, newCat in
                selectedIcon = categoryIcons[newCat] ?? "tag.fill"
                selectedColor = categoryColors[newCat] ?? "#8E8E93"
            }
        }
    }

    private var previewCard: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color(hex: selectedColor).opacity(0.15))
                    .frame(width: 72, height: 72)

                Image(systemName: selectedIcon)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(Color(hex: selectedColor))
            }

            Text(selectedCategory.rawValue)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)

            Text(numericLimit > 0 ? numericLimit.currencyFormatted() : "$0.00")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .contentTransition(.numericText())
        }
        .padding(28)
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private var categorySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Category")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)

            FlowLayout(spacing: 8) {
                ForEach(TransactionCategory.allCases, id: \.self) { cat in
                    Button {
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) {
                            selectedCategory = cat
                        }
                        HapticManager.shared.lightImpact()
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: categoryIcons[cat] ?? "tag.fill")
                                .font(.system(size: 12))
                            Text(cat.rawValue)
                                .font(.system(size: 13, weight: selectedCategory == cat ? .semibold : .medium))
                        }
                        .foregroundColor(selectedCategory == cat ? .black : .white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(selectedCategory == cat ? Color.white : Color.white.opacity(0.1))
                        .clipShape(Capsule())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }

    private var limitSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Monthly Limit")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)

            HStack(spacing: 12) {
                Text("$")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)

                TextField("0.00", text: $limitText)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.leading)
            }
            .padding(16)
            .background(Color.white.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            HStack(spacing: 8) {
                ForEach([50, 100, 200, 500, 1000], id: \.self) { quick in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            limitText = String(quick)
                        }
                        HapticManager.shared.lightImpact()
                    } label: {
                        Text("+\(quick)")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }

    private var alertSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Alert Threshold")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)

            VStack(spacing: 8) {
                HStack {
                    Text("\(Int(alertThreshold * 100))%")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Spacer()

                    Text("Notify when reached")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.5))
                }

                Slider(value: $alertThreshold, in: 0.5...0.95, step: 0.05)
                    .tint(Color(hex: selectedColor))
            }
            .padding(16)
            .background(Color.white.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

// MARK: - Flow Layout (reused)
struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x,
                                       y: bounds.minY + result.positions[index].y),
                         proposal: .unspecified)
        }
    }

    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []

        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var rowHeight: CGFloat = 0

            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                if x + size.width > maxWidth && x > 0 {
                    x = 0
                    y += rowHeight + spacing
                    rowHeight = 0
                }
                positions.append(CGPoint(x: x, y: y))
                rowHeight = max(rowHeight, size.height)
                x += size.width + spacing
            }

            self.size = CGSize(width: maxWidth, height: y + rowHeight)
        }
    }
}

#Preview {
    AddBudgetView(viewModel: BudgetViewModel())
}
