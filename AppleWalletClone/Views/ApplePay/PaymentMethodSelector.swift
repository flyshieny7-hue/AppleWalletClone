import SwiftUI

struct SearchFiltersView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var minAmount: String = ""
    @State private var maxAmount: String = ""
    @State private var fromDate = Calendar.current.date(byAdding: .year, value: -1, to: Date()) ?? Date()
    @State private var toDate = Date()
    @State private var selectedCategories: Set<TransactionCategory> = []
    @State private var selectedTypes: Set<TransactionType> = []
    @State private var selectedStatuses: Set<TransactionStatus> = []
    @State private var selectedNetworks: Set<CardNetwork> = []

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                List {
                    amountRangeSection
                    dateRangeSection
                    categorySection
                    typeSection
                    statusSection
                    networkSection
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Search Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset") {
                        resetAll()
                        HapticManager.shared.lightImpact()
                    }
                    .foregroundColor(.red)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Apply") {
                        HapticManager.shared.mediumImpact()
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                }
            }
        }
    }

    private var amountRangeSection: some View {
        Section {
            HStack(spacing: 12) {
                TextField("Min $", text: $minAmount)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 16))
                    .foregroundColor(.white)

                Text("–")
                    .foregroundColor(.white.opacity(0.4))

                TextField("Max $", text: $maxAmount)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
        } header: {
            Text("Amount Range")
                .foregroundColor(.white.opacity(0.6))
        }
        .listRowBackground(Color.white.opacity(0.06))
    }

    private var dateRangeSection: some View {
        Section {
            DatePicker("From", selection: $fromDate, displayedComponents: .date)
                .foregroundColor(.white)
                .colorMultiply(.blue)

            DatePicker("To", selection: $toDate, displayedComponents: .date)
                .foregroundColor(.white)
                .colorMultiply(.blue)
        } header: {
            Text("Date Range")
                .foregroundColor(.white.opacity(0.6))
        }
        .listRowBackground(Color.white.opacity(0.06))
    }

    private var categorySection: some View {
        Section {
            FlowLayout(spacing: 8) {
                ForEach(TransactionCategory.allCases, id: \.self) { cat in
                    toggleChip(cat.rawValue, isSelected: selectedCategories.contains(cat)) {
                        toggleSet(&selectedCategories, cat)
                    }
                }
            }
        } header: {
            Text("Categories")
                .foregroundColor(.white.opacity(0.6))
        }
        .listRowBackground(Color.white.opacity(0.06))
    }

    private var typeSection: some View {
        Section {
            FlowLayout(spacing: 8) {
                ForEach(TransactionType.allCases, id: \.self) { type in
                    toggleChip(type.rawValue, isSelected: selectedTypes.contains(type)) {
                        toggleSet(&selectedTypes, type)
                    }
                }
            }
        } header: {
            Text("Transaction Types")
                .foregroundColor(.white.opacity(0.6))
        }
        .listRowBackground(Color.white.opacity(0.06))
    }

    private var statusSection: some View {
        Section {
            FlowLayout(spacing: 8) {
                ForEach(TransactionStatus.allCases, id: \.self) { status in
                    toggleChip(status.rawValue, isSelected: selectedStatuses.contains(status)) {
                        toggleSet(&selectedStatuses, status)
                    }
                }
            }
        } header: {
            Text("Status")
                .foregroundColor(.white.opacity(0.6))
        }
        .listRowBackground(Color.white.opacity(0.06))
    }

    private var networkSection: some View {
        Section {
            FlowLayout(spacing: 8) {
                ForEach(CardNetwork.allCases, id: \.self) { network in
                    toggleChip(network.rawValue, isSelected: selectedNetworks.contains(network)) {
                        toggleSet(&selectedNetworks, network)
                    }
                }
            }
        } header: {
            Text("Card Networks")
                .foregroundColor(.white.opacity(0.6))
        }
        .listRowBackground(Color.white.opacity(0.06))
    }

    private func toggleChip(_ title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: isSelected ? .semibold : .medium))
                .foregroundColor(isSelected ? .black : .white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.white : Color.white.opacity(0.1))
                .clipShape(Capsule())
        }
        .buttonStyle(PlainButtonStyle())
    }

    private func toggleSet<T: Hashable>(_ set: inout Set<T>, _ value: T) {
        withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) {
            if set.contains(value) {
                set.remove(value)
            } else {
                set.insert(value)
            }
        }
    }

    private func resetAll() {
        minAmount = ""
        maxAmount = ""
        fromDate = Calendar.current.date(byAdding: .year, value: -1, to: Date()) ?? Date()
        toDate = Date()
        selectedCategories.removeAll()
        selectedTypes.removeAll()
        selectedStatuses.removeAll()
        selectedNetworks.removeAll()
    }
}

// MARK: - Flow Layout
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
    SearchFiltersView()
}
