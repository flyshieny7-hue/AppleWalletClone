import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction

    var body: some View {
        Text(transaction.title)
            .foregroundColor(.white)
    }
}
