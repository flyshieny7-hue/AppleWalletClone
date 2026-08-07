import SwiftUI

struct CardCellView: View {
    let card: Card
    let isExpanded: Bool
    let isSelected: Bool
    var namespace: Namespace.ID
    let index: Int
    let totalCards: Int

    @StateObject private var motionManager = MotionManager()
    @State private var isPressed = false
    @State private var glowIntensity: CGFloat = 0
    @State private var shimmerOffset: CGFloat = -200
    @State private var pulseScale: CGFloat = 1.0
    @State private var showDetail = false

    private var isAmexCenturion: Bool {
        card.cardNickname.contains("Centurion") || card.eliteTier == .centurion
    }

    private var isAppleCash: Bool {
        card.cardType == .appleCash
    }

    private var isAppleAccount: Bool {
        card.cardType == .appleAccount
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
            if isElite {
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

            cardBackground

            cardContent
                .offset(
                    x: motionManager.roll * 12,
                    y: motionManager.pitch * 12
                )
        }
        .frame(height: isExpanded && isSelected ? 280 : 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    isElite ? Color.white.opacity(0.3) : Color.clear,
                    lineWidth: isElite ? 1.5 : 0
                )
        )
        .shadow(
            color: isSelected
                ? (gradientColors.first ?? .white).opacity(0.4)
                : .black.opacity(0.5),
            radius: isSelected ? 20 : 8,
            x: 0,
            y: isSelected ? 12 : 4
        )
        .scaleEffect(isPressed ? 0.96 : pulseScale)
        .onTapGesture {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    isPressed = false
                }
            }
        }
        .onLongPressGesture(minimumDuration: 0.3, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.2)) {
                isPressed = pressing
            }
        }) {}
        .onAppear {
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
        .onDisappear {
            motionManager.stop()
        }
        .sheet(isPresented: $showDetail) {
            CardDetailView(card: card)
        }
    }

    private var cardBackground: some View {
        ZStack {
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
                        colors: gradientColors.count >= 4
                            ? gradientColors
                            : gradientColors + Array(repeating: .black, count: max(0, 4 - gradientColors.count))
                    )
                )

            LinearGradient(
                gradient: Gradient(colors: [.clear, .white.opacity(0.15), .clear]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .offset(x: shimmerOffset)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Group {
                if card.patternType == .appleCashPattern {
                    AppleCashPatternView()
                } else if card.patternType == .amexCenturion {
                    CenturionPatternView()
                } else if card.patternType != .none {
                    CardPatternView(patternType: card.patternType)
                }
            }
            .opacity(0.12)

            Image(systemName: "circle.grid.cross.fill")
                .resizable()
                .scaledToFill()
                .foregroundColor(.white.opacity(0.03))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }

    private var cardContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(card.cardNickname)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(textColor)

                    if isElite {
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

            HStack {
                if isAppleCash || isAppleAccount {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(isAppleCash ? "Apple Cash Balance" : "Account Balance")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(textColor.opacity(0.7))

                        Text(card.balance.currencyFormatted())
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .contentTransition(.numericText())
                    }
                } else {
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

                Spacer()

                Image(systemName: cardTypeIcon)
                    .font(.system(size: 28))
                    .foregroundColor(textColor.opacity(0.3))
            }

            Spacer()

            HStack {
                Text(card.cardHolderName.uppercased())
                    .font(.system(size: 13, weight: .semibold, design: .default))
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

    private var lastFourDigits: String {
        String(card.cardNumber.suffix(4))
    }

    private var cardTypeIcon: String {
        switch card.cardType {
        case .credit: return "creditcard.fill"
        case .debit: return "creditcard"
        case .appleCash: return "dollarsign.circle.fill"
        case .appleAccount: return "person.crop.circle.fill"
        case .prepaid: return "giftcard.fill"
        case .store: return "bag.fill"
        case .transit: return "train.side.front.car"
        case .loyalty: return "star.fill"
        }
    }

    private func countryFlag(for countryCode: String) -> String {
        let base: UInt32 = 127397
        return countryCode.uppercased().unicodeScalars.compactMap {
            UnicodeScalar(base + $0.value)
        }.map(String.init).joined()
    }
}

// MARK: - Network Logo View
struct NetworkLogoView: View {
    let network: CardNetwork
    let isElite: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.white.opacity(0.15))
                .frame(width: 44, height: 28)

            Text(network.rawValue)
                .font(.system(size: 9, weight: .black, design: .rounded))
                .foregroundColor(isElite ? Color(hex: "#C0A062") : .white)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
    }
}

// MARK: - Apple Cash Pattern
struct AppleCashPatternView: View {
    @State private var phase: CGFloat = 0

    var body: some View {
        TimelineView(.animation(minimumInterval: 0.03, paused: false)) { _ in
            Canvas { context, size in
                let arrowSize: CGFloat = 16
                let spacing: CGFloat = 36
                let rows = Int(size.height / spacing) + 3
                let cols = Int(size.width / spacing) + 3

                for row in 0..<rows {
                    for col in 0..<cols {
                        let offsetX = CGFloat(row % 2) * (spacing / 2)
                        let x = CGFloat(col) * spacing + offsetX
                        let y = CGFloat(row) * spacing + phase.truncatingRemainder(dividingBy: spacing)

                        var path = Path()
                        path.move(to: CGPoint(x: x, y: y))
                        path.addLine(to: CGPoint(x: x + arrowSize / 2, y: y + arrowSize))
                        path.addLine(to: CGPoint(x: x - arrowSize / 2, y: y + arrowSize))
                        path.closeSubpath()

                        context.fill(path, with: .color(.white.opacity(0.25)))
                    }
                }
            }
            .onAppear {
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                    phase = 36
                }
            }
        }
    }
}

// MARK: - Centurion Pattern
struct CenturionPatternView: View {
    var body: some View {
        Canvas { context, size in
            let spacing: CGFloat = 30
            for x in stride(from: 0, to: size.width, by: spacing) {
                for y in stride(from: 0, to: size.height, by: spacing) {
                    let rect = CGRect(x: x - 6, y: y - 6, width: 12, height: 12)
                    context.stroke(Path(ellipseIn: rect), with: .color(Color(hex: "#C0A062").opacity(0.2)), lineWidth: 1)
                }
            }
        }
    }
}

// MARK: - Card Pattern View
struct CardPatternView: View {
    let patternType: CardPattern

    var body: some View {
        GeometryReader { geo in
            Canvas { context, size in
                switch patternType {
                case .dots:
                    drawDots(context: context, size: size)
                case .lines:
                    drawLines(context: context, size: size)
                case .waves:
                    drawWaves(context: context, size: size)
                case .hexagons:
                    drawHexagons(context: context, size: size)
                case .circles:
                    drawCircles(context: context, size: size)
                case .arrows:
                    drawArrows(context: context, size: size)
                default:
                    break
                }
            }
        }
    }

    private func drawDots(context: GraphicsContext, size: CGSize) {
        let spacing: CGFloat = 24
        for x in stride(from: 0, to: size.width, by: spacing) {
            for y in stride(from: 0, to: size.height, by: spacing) {
                let rect = CGRect(x: x, y: y, width: 4, height: 4)
                context.fill(Path(ellipseIn: rect), with: .color(.white))
            }
        }
    }

    private func drawLines(context: GraphicsContext, size: CGSize) {
        let spacing: CGFloat = 20
        for x in stride(from: 0, to: size.width, by: spacing) {
            var path = Path()
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: size.height))
            context.stroke(path, with: .color(.white), lineWidth: 1)
        }
    }

    private func drawWaves(context: GraphicsContext, size: CGSize) {
        for i in 0..<5 {
            var path = Path()
            let y = CGFloat(i) * 50
            path.move(to: CGPoint(x: 0, y: y))
            for x in stride(from: 0, to: size.width, by: 10) {
                let waveY = y + sin(x / 30) * 15
                path.addLine(to: CGPoint(x: x, y: waveY))
            }
            context.stroke(path, with: .color(.white), lineWidth: 1.5)
        }
    }

    private func drawHexagons(context: GraphicsContext, size: CGSize) {
        let spacing: CGFloat = 40
        for row in 0..<Int(size.height / spacing) + 2 {
            for col in 0..<Int(size.width / spacing) + 2 {
                let x = CGFloat(col) * spacing + (CGFloat(row % 2) * spacing / 2)
                let y = CGFloat(row) * spacing
                let rect = CGRect(x: x - 10, y: y - 10, width: 20, height: 20)
                context.stroke(Path(roundedRect: rect, cornerRadius: 4), with: .color(.white), lineWidth: 1)
            }
        }
    }

    private func drawCircles(context: GraphicsContext, size: CGSize) {
        let spacing: CGFloat = 30
        for x in stride(from: 0, to: size.width, by: spacing) {
            for y in stride(from: 0, to: size.height, by: spacing) {
                let rect = CGRect(x: x - 8, y: y - 8, width: 16, height: 16)
                context.stroke(Path(ellipseIn: rect), with: .color(.white), lineWidth: 1)
            }
        }
    }

    private func drawArrows(context: GraphicsContext, size: CGSize) {
        let spacing: CGFloat = 36
        for row in 0..<Int(size.height / spacing) + 2 {
            for col in 0..<Int(size.width / spacing) + 2 {
                let x = CGFloat(col) * spacing + (CGFloat(row % 2) * spacing / 2)
                let y = CGFloat(row) * spacing
                var path = Path()
                path.move(to: CGPoint(x: x, y: y))
                path.addLine(to: CGPoint(x: x + 8, y: y + 16))
                path.addLine(to: CGPoint(x: x - 8, y: y + 16))
                path.closeSubpath()
                context.fill(path, with: .color(.white.opacity(0.2)))
            }
        }
    }
}

#Preview {
    @Previewable @Namespace var previewNamespace
    VStack(spacing: 20) {
        CardCellView(
            card: Card(
                cardType: .credit,
                cardNetwork: .visa,
                cardHolderName: "JOHN DOE",
                cardNumber: "•••• •••• •••• 1234",
                expirationDate: "12/28",
                cvv: "123",
                balance: 0.0,
                cardNickname: "Chase Sapphire Reserve",
                gradientColors: ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"],
                patternType: .none,
                isDefault: false,
                country: "USA",
                eliteTier: .reserve
            ),
            isExpanded: false,
            isSelected: false,
            namespace: previewNamespace,
            index: 0,
            totalCards: 5
        )
        .frame(width: 360, height: 200)

        CardCellView(
            card: Card(
                cardType: .appleCash,
                cardNetwork: .other,
                cardHolderName: "JOHN DOE",
                cardNumber: "•••• •••• •••• 0000",
                expirationDate: "12/28",
                cvv: "123",
                balance: 5100.0,
                cardNickname: "Apple Cash",
                gradientColors: ["#1C1C1E", "#2C2C2E", "#3A3A3C", "#48484A"],
                patternType: .appleCashPattern,
                isDefault: true,
                country: "USA",
                eliteTier: .standard
            ),
            isExpanded: false,
            isSelected: false,
            namespace: previewNamespace,
            index: 1,
            totalCards: 5
        )
        .frame(width: 360, height: 200)
    }
    .background(Color.black)
}
