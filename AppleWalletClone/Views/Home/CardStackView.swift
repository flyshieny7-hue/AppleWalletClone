import SwiftUI

struct CardStackView: View {
    let cards: [Card]
    @Binding var isExpanded: Bool
    var namespace: Namespace.ID

    @State private var selectedCardID: UUID?
    @State private var dragOffset: CGSize = .zero
    @State private var draggedCardID: UUID?
    @State private var rotationAngles: [UUID: Double] = [:]
    @State private var zOffsets: [UUID: Double] = [:]
    @State private var detailCard: Card? = nil   // ← ДОБАВЛЕНО

    private let collapsedSpacing: CGFloat = 14
    private let expandedSpacing: CGFloat = 240

    var body: some View {
        VStack(spacing: isExpanded ? expandedSpacing : collapsedSpacing) {
            ForEach(Array(cards.enumerated()), id: \1.element.id) { index, card in
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
                }
            }
        }
        .fullScreenCover(item: $detailCard) { card in   // ← ДОБАВЛЕНО
            CardDetailView(card: card, namespace: namespace)
        }
    }

    private func handleCardTap(_ card: Card) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0)) {
            if isExpanded {
                if selectedCardID == card.id {
                    detailCard = card   // ← ИЗМЕНЕНО: открываем детали вместо сворачивания
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
