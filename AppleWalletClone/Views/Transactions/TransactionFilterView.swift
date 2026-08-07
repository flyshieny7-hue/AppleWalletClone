import SwiftUI

enum SortOption: String, CaseIterable {
    case dateDesc = "Newest First"
    case dateAsc = "Oldest First"
    case amountDesc = "Highest Amount"
    case amountAsc = "Lowest Amount"
}

struct TransactionFilterView: View {
    @Bindable var viewModel: TransactionViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var minAmount: String = ""
    @State private var maxAmount: String = ""
    @State private var fromDate = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
    @State private var toDate = Date()
    @State private var selectedCategories: Set<TransactionCategory> = []
    @State private var selectedTypes: Set<TransactionType> = []
    @State private var sortOption: SortOption = .dateDesc

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                List {
                    sortSection
                    amountSection
                    dateSection
                    categorySection
                    typeSection
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset") {
                        resetFilters()
                        HapticManager.shared.lightImpact()
                    }
                    .foregroundColor(.red)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        applyFilters()
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                }
            }
        }
    }

    private var sortSection: some View {
        Section {
            Picker("Sort By", selection: $sortOption) {
                ForEach(SortOption.allCases, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.menu)
            .foregroundColor(.white)
        } header: {
            Text("Sort")
                .foregroundColor(.white.opacity(0.6))
        }
        .listRowBackground(Color.white.opacity(0.06))
    }

    private var amountSection: some View {
        Section {
            HStack(spacing: 12) {
                TextField("Min", text: $minAmount)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 16))
                    .foregroundColor(.white)

                Text("–")
                    .foregroundColor(.white.opacity(0.4))

                TextField("Max", text: $maxAmount)
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

    private var dateSection: some View {
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
            ForEach(TransactionCategory.allCases, id: \.self) { cat in
                Button {
                    toggleCategory(cat)
                } label: {
                    HStack {
                        Text(cat.rawValue)
                            .foregroundColor(.white)
                        Spacer()
                        if selectedCategories.contains(cat) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
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
            ForEach(TransactionType.allCases, id: \.self) { type in
                Button {
                    toggleType(type)
                } label: {
                    HStack {
                        Text(type.rawValue)
                            .foregroundColor(.white)
                        Spacer()
                        if selectedTypes.contains(type) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        } header: {
            Text("Transaction Types")
                .foregroundColor(.white.opacity(0.6))
        }
        .listRowBackground(Color.white.opacity(0.06))
    }

    private func toggleCategory(_ cat: TransactionCategory) {
        withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) {
            if selectedCategories.contains(cat) {
                selectedCategories.remove(cat)
            } else {
                selectedCategories.insert(cat)
            }
        }
    }

    private func toggleType(_ type: TransactionType) {
        withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) {
            if selectedTypes.contains(type) {
                selectedTypes.remove(type)
            } else {
                selectedTypes.insert(type)
            }
        }
    }

    private func resetFilters() {
        minAmount = ""
        maxAmount = ""
        fromDate = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
        toDate = Date()
        selectedCategories.removeAll()
        selectedTypes.removeAll()
        sortOption = .dateDesc
        viewModel.filterCategory = nil
        viewModel.searchQuery = ""
    }

    private func applyFilters() {
        // Category filter applied via viewModel
        if let firstCat = selectedCategories.first, selectedCategories.count == 1 {
            viewModel.filterCategory = firstCat
        } else {
            viewModel.filterCategory = nil
        }
    }
}

#Preview {
    @Previewable @State var vm = TransactionViewModel()
    TransactionFilterView(viewModel: vm)
}
