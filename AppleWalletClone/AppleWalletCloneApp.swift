import SwiftUI
import SwiftData

@main
struct AppleWalletCloneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: [Card.self, Transaction.self, User.self])
    }
}
