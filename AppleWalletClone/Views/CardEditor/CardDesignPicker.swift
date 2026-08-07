import SwiftUI

struct CardDesignPicker: View {
    @Binding var gradientColors: [String]
    @Binding var patternType: CardPattern

    private let presets: [[String]] = [
        ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"],
        ["#E8E8E8", "#D0D0D0", "#F5F5F7", "#B8B8B8"],
        ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        ["#1C1C1E", "#2C2C2E", "#3A3A3C", "#48484A"],
        ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        ["#5B2E91", "#4A2578", "#6C3DAA", "#391E5F"],
        ["#76B82A", "#669E24", "#8ACC40", "#55841E"],
        ["#FFDD2D", "#E5C528", "#FFE840", "#CCAE1F"],
    ]

    @State private var customColors: [Color] = [.black, .black, .black, .black]

    var body: some View {
        VStack(spacing: 20) {
            presetGrid

            Divider()
                .background(Color.white.opacity(0.1))
                .padding(.horizontal, 20)

            customBuilder
        }
    }

    private var presetGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Presets")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)
                .padding(.horizontal, 20)

            let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 4)

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(presets.indices, id: \.self) { index in
                    let preset = presets[index]
                    let isSelected = gradientColors == preset

                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            gradientColors = preset
                        }
                        HapticManager.shared.lightImpact()
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(
                                    colors: preset.prefix(2).map { Color(hex: $0) },
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(height: 56)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(isSelected ? Color.white : Color.clear, lineWidth: 2)
                            )
                            .overlay(
                                isSelected ?
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .shadow(radius: 2)
                                : nil
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 20)
        }
    }

    private var customBuilder: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Custom Colors")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
                .textCase(.uppercase)
                .padding(.horizontal, 20)

            HStack(spacing: 12) {
                ForEach(0..<4, id: \.self) { index in
                    ColorPicker("", selection: Binding(
                        get: {
                            if index < gradientColors.count {
                                return Color(hex: gradientColors[index])
                            }
                            return .black
                        },
                        set: { newColor in
                            var hex = newColor.toHex() ?? "#000000"
                            if index < gradientColors.count {
                                gradientColors[index] = hex
                            } else {
                                gradientColors.append(hex)
                            }
                        }
                    ))
                    .labelsHidden()
                    .frame(width: 44, height: 44)
                    .background(Color.white.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

// MARK: - Color to Hex
extension Color {
    func toHex() -> String? {
        let uic = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        guard uic.getRed(&r, green: &g, blue: &b, alpha: &a) else { return nil }
        return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
}

#Preview {
    @Previewable @State var colors = ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"]
    @Previewable @State var pattern: CardPattern = .none
    CardDesignPicker(gradientColors: $colors, patternType: $pattern)
        .padding(.vertical, 20)
        .background(Color.black)
}
