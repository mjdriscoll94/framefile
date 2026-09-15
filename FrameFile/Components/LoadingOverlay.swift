import SwiftUI

struct LoadingOverlay: View {
    let message: String

    var body: some View {
        VStack(spacing: FrameFileTheme.compactSpacing) {
            ProgressView()
                .controlSize(.large)
                .tint(FrameFileTheme.brandBlue)
            Text(message)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: FrameFileTheme.cardCornerRadius))
        .overlay {
            RoundedRectangle(cornerRadius: FrameFileTheme.cardCornerRadius)
                .stroke(FrameFileTheme.cardStroke, lineWidth: 1)
        }
        .shadow(color: .black.opacity(0.10), radius: 16, y: 7)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(message)
    }
}
