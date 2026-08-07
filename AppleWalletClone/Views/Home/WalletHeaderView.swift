import SwiftUI

struct WalletHeaderView: View {
    @Binding var isExpanded: Bool
    @Binding var showSearch: Bool
    @Binding var showSettings: Bool
    @Binding var showCardCube: Bool
    @Binding var showAddCardSheet: Bool
    var namespace: Namespace.ID

    @State private var profileScale: CGFloat = 1.0

    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    profileScale = 0.9
                }
                HapticManager.shared.lightImpact()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        profileScale = 1.0
                    }
                }
                showSettings = true
            }) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.blue, .purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 40, height: 40)

                    Text("JD")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                .scaleEffect(profileScale)
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
                )
            }

            VStack(alignment: .leading, spacing: 2) {
                Text("Wallet")
                    .font(Constants.Fonts.largeTitle)
                    .foregroundColor(.white)

                Text("Good afternoon, John")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()

            HStack(spacing: 12) {
                HeaderButton(
                    icon: "magnifyingglass",
                    action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            showSearch.toggle()
                        }
                        HapticManager.shared.lightImpact()
                    }
                )

                HeaderButton(
                    icon: "cube.fill",
                    action: {
                        HapticManager.shared.mediumImpact()
                        showCardCube = true
                    }
                )

                HeaderButton(
                    icon: "plus.circle.fill",
                    isPrimary: true,
                    action: {
                        HapticManager.shared.mediumImpact()
                        showAddCardSheet = true
                    }
                )
            }
        }
    }
}

struct HeaderButton: View {
    let icon: String
    var isPrimary: Bool = false
    let action: () -> Void

    @State private var isPressed = false

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(isPrimary
                        ? Color.white.opacity(0.15)
                        : Color.white.opacity(0.08)
                    )
                    .frame(width: isPrimary ? 44 : 38, height: isPrimary ? 44 : 38)

                Image(systemName: icon)
                    .font(.system(
                        size: isPrimary ? 22 : 18,
                        weight: isPrimary ? .semibold : .medium
                    ))
                    .foregroundColor(.white)
            }
            .scaleEffect(isPressed ? 0.85 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
        )
    }
}

#Preview {
    @Previewable @Namespace var previewNamespace
    WalletHeaderView(
        isExpanded: .constant(false),
        showSearch: .constant(false),
        showSettings: .constant(false),
        showCardCube: .constant(false),
        showAddCardSheet: .constant(false),
        namespace: previewNamespace
    )
    .padding(.horizontal, 20)
    .background(Color.black)
}
