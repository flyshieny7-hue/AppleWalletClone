import SwiftUI

struct CardDetailView: View {
    let card: Card
    var namespace: Namespace.ID?

    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = TransactionViewModel()
    @State private var motionManager = MotionManager()
    @State private var isAppeared = false

    init(card: Card, namespace: Namespace.ID? = nil) {
        self.card = card
        self.namespace = namespace
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    detailCard
                        .padding(.horizontal, 20)
                        .padding(.top, 80)
                        .padding(.bottom, 32)

                    CardInfoView(card: card, viewModel: viewModel)
                        .padding(.horizontal, 20)

                    TransactionListView(card: card, viewModel: viewModel)
                        .padding(.top, 32)

                    Spacer(minLength: 40)
                }
            }
            .refreshable {
                await performRefresh()
            }

            topBarButtons
        }
        .onAppear {
            motionManager.start()
            viewModel.transactions = viewModel.generateSampleTransactions(for: card.id)
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                isAppeared = true
            }
        }
        .onDisappear {
            motionManager.stop()
        }
    }

    // MARK: - Detail Card (Hero + Parallax)
    private var detailCard: some View {
        Group {
            if let namespace {
                cardContent
                    .matchedGeometryEffect(id: "card_\(card.id)", in: namespace, properties: .frame, anchor: .top)
            } else {
                cardContent
            }
        }
    }

    private var cardContent: some View {
        let colors = card.gradientColors.map { Color(hex: $0) }
        let paddedColors = colors.count >= 4 ? colors : colors + Array(repeating: Color.black, count: max(0, 4 - colors.count))

        return ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    MeshGradient(
                        width: 3,
                        height: 3,
                        points: [
                            .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                            .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                            .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1)
                        ],
                        colors: paddedColors
                    )
                )

            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(card.cardNickname)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)

                        if card.eliteTier != .standard {
                            HStack(spacing: 4) {
                                Image(systemName: "crown.fill")
                                    .font(.system(size: 10))
                                Text(card.eliteTier.rawValue.uppercased())
                                    .font(.system(size: 10, weight: .heavy))
                            }
                            .foregroundColor(.yellow)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .background(Capsule().fill(Color.black.opacity(0.3)))
                        }
                    }

                    Spacer()

                    Text(card.cardNetwork.rawValue)
                        .font(.system(size: 10, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.15)))
                }

                Spacer()

                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 12) {
                            ForEach(0..<3) { _ in
                                Text("••••")
                                    .font(.system(size: 14, weight: .medium, design: .monospaced))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            Text(String(card.cardNumber.suffix(4)))
                                .font(.system(size: 14, weight: .semibold, design: .monospaced))
                                .foregroundColor(.white)
                        }

                        Text(card.expirationDate)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.white.opacity(0.6))
                    }

                    Spacer()
                }

                Spacer()

                HStack {
                    Text(card.cardHolderName.uppercased())
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.85))

                    Spacer()

                    if card.isDefault {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 14))
                            .foregroundColor(.green)
                    }
                }
            }
            .padding(24)
        }
        .frame(height: 240)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(
            color: (colors.first ?? .white).opacity(0.3),
            radius: 20, x: 0, y: 10
        )
        .offset(x: motionManager.roll * 12, y: motionManager.pitch * 12)
        .rotation3DEffect(.degrees(motionManager.pitch * 10), axis: (x: 1, y: 0, z: 0))
        .rotation3DEffect(.degrees(motionManager.roll * 10), axis: (x: 0, y: 1, z: 0))
        .scaleEffect(isAppeared ? 1.0 : 0.9)
        .opacity(isAppeared ? 1.0 : 0.0)
    }

    // MARK: - Top Bar
    private var topBarButtons: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                        dismiss()
                    }
                    HapticManager.shared.lightImpact()
                } label: {
                    Text("Done")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 7)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                }

                Spacer()

                Menu {
                    Button {
                        // Card settings action
                    } label: {
                        Label("Card Settings", systemImage: "gear")
                    }

                    Button {
                        // Lock card action
                    } label: {
                        Label("Lock Card", systemImage: "lock.fill")
                    }

                    Button(role: .destructive) {
                        // Remove card action
                    } label: {
                        Label("Remove Card", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 38, height: 38)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)

            Spacer()
        }
    }

    // MARK: - Pull-to-Refresh
    private func performRefresh() async {
        try? await Task.sleep(nanoseconds: 800_000_000)
        await MainActor.run {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                viewModel.transactions = viewModel.generateSampleTransactions(for: card.id)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    @Previewable @Namespace var previewNamespace
    CardDetailView(
        card: Card(
            cardType: .credit,
            cardNetwork: .visa,
            cardHolderName: "JOHN DOE",
            cardNumber: "•••• •••• •••• 4242",
            expirationDate: "12/28",
            cvv: "123",
            balance: 1247.50,
            cardNickname: "Chase Sapphire",
            gradientColors: ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"],
            patternType: .none,
            isDefault: false,
            country: "USA",
            eliteTier: .platinum
        ),
        namespace: previewNamespace
    )
}
