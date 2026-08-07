import SwiftUI

struct ContactPerson: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
    let initials: String
    let color: Color
}

struct ContactPickerView: View {
    @Binding var selectedContact: ContactPerson?
    @Environment(\.dismiss) private var dismiss

    @State private var searchQuery = ""

    private let recentContacts: [ContactPerson] = [
        ContactPerson(name: "Alice Johnson", phone: "+1 (555) 123-4567", initials: "AJ", color: .blue),
        ContactPerson(name: "Bob Smith", phone: "+1 (555) 987-6543", initials: "BS", color: .green),
        ContactPerson(name: "Charlie Brown", phone: "+1 (555) 456-7890", initials: "CB", color: .orange),
        ContactPerson(name: "Diana Prince", phone: "+1 (555) 234-5678", initials: "DP", color: .purple),
        ContactPerson(name: "Evan Wright", phone: "+1 (555) 876-5432", initials: "EW", color: .pink),
    ]

    private var filteredContacts: [ContactPerson] {
        if searchQuery.isEmpty { return recentContacts }
        return recentContacts.filter {
            $0.name.localizedCaseInsensitiveContains(searchQuery) ||
            $0.phone.localizedCaseInsensitiveContains(searchQuery)
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                List {
                    Section {
                        ForEach(filteredContacts) { contact in
                            Button {
                                selectedContact = contact
                                HapticManager.shared.mediumImpact()
                                dismiss()
                            } label: {
                                HStack(spacing: 14) {
                                    ZStack {
                                        Circle()
                                            .fill(contact.color.gradient)
                                            .frame(width: 44, height: 44)

                                        Text(contact.initials)
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)
                                    }

                                    VStack(alignment: .leading, spacing: 3) {
                                        Text(contact.name)
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)

                                        Text(contact.phone)
                                            .font(.system(size: 13))
                                            .foregroundColor(.white.opacity(0.5))
                                    }

                                    Spacer()

                                    if selectedContact?.id == contact.id {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 22))
                                    }
                                }
                            }
                            .listRowBackground(Color.white.opacity(0.05))
                            .listRowSeparator(.hidden)
                        }
                    } header: {
                        Text("Recent")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white.opacity(0.6))
                            .textCase(.uppercase)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("To:")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .searchable(text: $searchQuery, prompt: "Search contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var contact: ContactPerson? = nil
    ContactPickerView(selectedContact: $contact)
}
