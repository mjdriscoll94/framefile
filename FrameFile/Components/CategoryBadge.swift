import SwiftUI

struct CategoryBadge: View {
    let name: String
    let symbolName: String

    var body: some View {
        Label(name, systemImage: symbolName)
            .font(.caption.weight(.medium))
            .lineLimit(1)
            .foregroundStyle(FrameFileTheme.brandBlue)
            .padding(.horizontal, 9)
            .padding(.vertical, 5)
            .background(FrameFileTheme.brandBlue.opacity(0.10), in: Capsule())
            .overlay {
                Capsule()
                    .stroke(FrameFileTheme.brandBlue.opacity(0.15), lineWidth: 1)
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Category: \(name)")
    }
}

#Preview {
    CategoryBadge(name: "Read Later", symbolName: "book.closed")
        .padding()
}
