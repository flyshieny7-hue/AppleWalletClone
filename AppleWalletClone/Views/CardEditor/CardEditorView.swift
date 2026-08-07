import SwiftUI

// MARK: - Optimized Card Stack View
// Features: Lazy loading, memory management, battery-efficient animations

struct CardStackView: View {
    let cards: [Card]
    @Binding var isExpanded: Bool
    var namespace: Namespace.ID

    @State private var selectedCardID: UUID?
    @State private var dragOffset: CGSize = .zero
    @State private var draggedCardID: UUID?
    @State private var rotationAngles: [UUID: Double] = [:]
    @State private var zOffsets: [UUID: Double] = [:]
    @State private var detailCard: Card? = nil

    // Memory-efficient state tracking
    @State private var visibleCardIDs: Set<UUID> = []
    @State private var lastVisibleRange: Range<Int> = 0..<0

    private let collapsedSpacing: CGFloat = 14
    private let expandedSpacing: CGFloat = 240
    private let viewportBuffer: Int = 3 // Render buffer above/below viewport

    var body: some View {
        VStack(spacing: isExpanded ? expandedSpacing : collapsedSpacing) {
            ForEach(Array(cards.enumerated()), id: \1.element.id) { index, card in
                // Only render visible cards + buffer for performance
                if shouldRenderCard(at: index) {
                    CardCellView(
                        card: card,
                        isExpanded: isExpanded,
                        isSelected: selectedCardID == card.id,
                        namespace: namespace,
                        index: index,
                        totalCards: cards.count
                    )
                    .matchedGeometryEffect(
                        id: "card_\(card.id)",
                        in: namespace,
                        properties: .frame,
                        anchor: .top
                    )
                    .offset(
                        x: draggedCardID == card.id ? dragOffset.width : 0,
                        y: draggedCardID == card.id ? dragOffset.height : 0
                    )
                    .rotationEffect(.degrees(rotationAngles[card.id] ?? 0))
                    .zIndex(zOffsets[card.id] ?? Double(index))
                    .scaleEffect(isExpanded && selectedCardID != card.id ? 0.92 : 1.0)
                    .opacity(isExpanded && selectedCardID != card.id ? 0.6 : 1.0)
                    .onTapGesture {
                        handleCardTap(card)
                    }
                    .gesture(
                        LongPressGesture(minimumDuration: 0.5)
                            .onEnded { _ in
                                HapticManager.shared.success()
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    rotationAngles[card.id] = (rotationAngles[card.id] ?? 0) + 360
                                }
                            }
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if isExpanded && selectedCardID == card.id {
                                    draggedCardID = card.id
                                    dragOffset = value.translation
                                    if abs(value.translation.width) > 100 {
                                        HapticManager.shared.lightImpact()
                                    }
                                }
                            }
                            .onEnded { value in
                                if isExpanded && selectedCardID == card.id {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                                        if abs(value.translation.width) > 120 {
                                            if value.translation.width > 0 {
                                                HapticManager.shared.success()
                                            }
                                        }
                                        dragOffset = .zero
                                        draggedCardID = nil
                                    }
                                }
                            }
                    )
                    .contextMenu {
                        Button {
                            HapticManager.shared.mediumImpact()
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                                selectedCardID = card.id
                                isExpanded = true
                                zOffsets[card.id] = 1000
                            }
                        } label: {
                            Label("Expand", systemImage: "arrow.up.left.and.arrow.down.right")
                        }

                        Button {
                            HapticManager.shared.lightImpact()
                            UIPasteboard.general.string = card.cardNumber
                        } label: {
                            Label("Copy Number", systemImage: "doc.on.doc")
                        }

                        Button {
                            HapticManager.shared.lightImpact()
                            detailCard = card
                        } label: {
                            Label("View Details", systemImage: "eye")
                        }
                    }
                    .onAppear {
                        visibleCardIDs.insert(card.id)
                    }
                    .onDisappear {
                        visibleCardIDs.remove(card.id)
                    }
                } else {
                    // Placeholder for off-screen cards (maintains scroll position)
                    Color.clear
                        .frame(height: isExpanded ? expandedSpacing : collapsedSpacing)
                }
            }
        }
        .fullScreenCover(item: $detailCard) { card in
            CardDetailView(card: card, namespace: namespace)
        }
    }

    // MARK: - Visibility Optimization
    private func shouldRenderCard(at index: Int) -> Bool {
        // When expanded, only render selected card and nearby
        if isExpanded {
            guard let selectedID = selectedCardID,
                  let selectedIndex = cards.firstIndex(where: { $0.id == selectedID }) else {
                return true // Fallback: render all when no selection
            }
            return abs(index - selectedIndex) <= viewportBuffer
        }

        // When collapsed, render all (they're stacked)
        return true
    }

    private func handleCardTap(_ card: Card) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0)) {
            if isExpanded {
                if selectedCardID == card.id {
                    detailCard = card
                } else {
                    selectedCardID = card.id
                    zOffsets[card.id] = 1000
                }
            } else {
                isExpanded = true
                selectedCardID = card.id
                zOffsets[card.id] = 1000
            }
            HapticManager.shared.mediumImpact()
        }
    }
}

// MARK: - Memory-Efficient Card Cell
struct CardCellView_Optimized: View {
    let card: Card
    let isExpanded: Bool
    let isSelected: Bool
    var namespace: Namespace.ID
    let index: Int
    let totalCards: Int

    // Use @StateObject for proper lifecycle management
    @StateObject private var motionManager = MotionManager()
    @State private var isPressed = false
    @State private var glowIntensity: CGFloat = 0
    @State private var shimmerOffset: CGFloat = -200
    @State private var pulseScale: CGFloat = 1.0

    // Computed properties (no stored state)
    private var isAmexCenturion: Bool {
        card.cardNickname.contains("Centurion") || card.eliteTier == .centurion
    }

    private var isAppleCash: Bool {
        card.cardType == .appleCash
    }

    private var isElite: Bool {
        card.eliteTier != .standard
    }

    private var gradientColors: [Color] {
        card.gradientColors.map { Color(hex: $0) }
    }

    private var textColor: Color {
        isAmexCenturion ? Color(hex: "#C0A062") : .white
    }

    var body: some View {
        ZStack {
            // Elite glow effect (battery efficient)
            if isElite {
                eliteGlow
            }

            cardBackground
            cardContent
                .offset(
                    x: motionManager.roll * 12,
                    y: motionManager.pitch * 12
                )
        }
        .frame(height: isExpanded && isSelected ? 280 : 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(eliteBorder)
        .shadow(
            color: isSelected
                ? (gradientColors.first ?? .white).opacity(0.4)
                : .black.opacity(0.5),
            radius: isSelected ? 20 : 8,
            x: 0,
            y: isSelected ? 12 : 4
        )
        .scaleEffect(isPressed ? 0.96 : pulseScale)
        .onTapGesture { handleTap() }
        .onLongPressGesture(minimumDuration: 0.3, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.2)) {
                isPressed = pressing
            }
        }) {}
        .onAppear { startAnimations() }
        .onDisappear { stopAnimations() }
    }

    // MARK: - Subviews (computed, no stored state)
    private var eliteGlow: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        gradientColors.first?.opacity(0.6) ?? .white.opacity(0.6),
                        gradientColors.last?.opacity(0.3) ?? .white.opacity(0.3)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .blur(radius: 20)
            .opacity(glowIntensity)
            .scaleEffect(1.05)
    }

    private var eliteBorder: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(
                isElite ? Color.white.opacity(0.3) : Color.clear,
                lineWidth: isElite ? 1.5 : 0
            )
    }

    private var cardBackground: some View {
        ZStack {
            // Base mesh gradient
            RoundedRectangle(cornerRadius: 20)
                .fill(meshGradient)

            // Shimmer effect (only on visible cards)
            shimmerOverlay

            // Pattern overlay
            patternOverlay

            // Subtle texture
            Image(systemName: "circle.grid.cross.fill")
                .resizable()
                .scaledToFill()
                .foregroundColor(.white.opacity(0.03))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }

    private var meshGradient: MeshGradient {
        let colors = gradientColors.count >= 4
            ? gradientColors
            : gradientColors + Array(repeating: .black, count: max(0, 4 - gradientColors.count))

        return MeshGradient(
            width: 3,
            height: 3,
            points: [
                .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1)
            ],
            colors: colors
        )
    }

    private var shimmerOverlay: some View {
        LinearGradient(
            gradient: Gradient(colors: [.clear, .white.opacity(0.15), .clear]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .offset(x: shimmerOffset)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private var patternOverlay: some View {
        Group {
            switch card.patternType {
            case .appleCashPattern:
                AppleCashPatternView().opacity(0.12)
            case .amexCenturion:
                CenturionPatternView().opacity(0.12)
            case .none:
                EmptyView()
            default:
                CardPatternView(patternType: card.patternType).opacity(0.12)
            }
        }
    }

    private var cardContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(card.cardNickname)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(textColor)

                    if isElite {
                        eliteBadge
                    }
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 6) {
                    NetworkLogoView(network: card.cardNetwork, isElite: isAmexCenturion)

                    if card.cardType != .appleCash && card.cardType != .appleAccount {
                        Image(systemName: "wave.3.forward")
                            .font(.system(size: 16))
                            .foregroundColor(textColor.opacity(0.7))
                    }
                }
            }

            Spacer()

            // Middle section
            HStack {
                if isAppleCash || card.cardType == .appleAccount {
                    balanceSection
                } else {
                    cardNumberSection
                }
                Spacer()
            }

            Spacer()

            // Footer
            HStack {
                Text(card.cardHolderName.uppercased())
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(textColor.opacity(0.85))

                Spacer()

                Text(countryFlag(for: card.country))
                    .font(.system(size: 20))

                if card.isDefault {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.green)
                }

                if card.isLocked {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.orange)
                }
            }
        }
        .padding(22)
    }

    private var eliteBadge: some View {
        HStack(spacing: 4) {
            Image(systemName: "crown.fill")
                .font(.system(size: 10))
            Text(card.eliteTier.rawValue.uppercased())
                .font(.system(size: 10, weight: .heavy))
        }
        .foregroundColor(isAmexCenturion ? Color(hex: "#C0A062") : .yellow)
        .padding(.horizontal, 8)
        .padding(.vertical, 3)
        .background(Capsule().fill(Color.black.opacity(0.3)))
    }

    private var balanceSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(isAppleCash ? "Apple Cash Balance" : "Account Balance")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(textColor.opacity(0.7))

            Text(card.balance.currencyFormatted())
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .contentTransition(.numericText())
        }
    }

    private var cardNumberSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 12) {
                ForEach(0..<3) { _ in
                    Text("••••")
                        .font(.system(size: 14, weight: .medium, design: .monospaced))
                        .foregroundColor(textColor.opacity(0.8))
                }
                Text(lastFourDigits)
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundColor(textColor)
            }

            Text(card.expirationDate)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(textColor.opacity(0.6))
        }
    }

    private var lastFourDigits: String {
        String(card.cardNumber.suffix(4))
    }

    // MARK: - Lifecycle
    private func startAnimations() {
        motionManager.start()

        withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
            shimmerOffset = 400
        }

        if card.isDefault {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                pulseScale = 1.02
            }
        }

        if isElite {
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                glowIntensity = 1.0
            }
        }
    }

    private func stopAnimations() {
        motionManager.stop()
    }

    private func handleTap() {
        withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
            isPressed = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isPressed = false
            }
        }
    }

    private func countryFlag(for countryCode: String) -> String {
        let base: UInt32 = 127397
        return countryCode.uppercased().unicodeScalars.compactMap {
            UnicodeScalar(base + $0.value)
        }.map(String.init).joined()
    }
}

// MARK: - Preview
#Preview {
    @Previewable @Namespace var previewNamespace
    CardStackView(
        cards: CardTemplates.allCards.prefix(5).map {
            Card(
                cardType: $0.cardType,
                cardNetwork: $0.cardNetwork,
                cardHolderName: "JOHN DOE",
                cardNumber: "•••• •••• •••• 1234",
                expirationDate: "12/28",
                cvv: "123",
                balance: $0.cardType == .appleCash ? 5100.0 : 0.0,
                cardNickname: $0.name,
                gradientColors: $0.gradientColors,
                patternType: $0.patternType,
                isDefault: $0.name == "Apple Cash",
                country: $0.country,
                eliteTier: $0.eliteTier
            )
        },
        isExpanded: .constant(false),
        namespace: previewNamespace
    )
    .background(Color.black)
}
