import SwiftUI

public struct GrowRadioButton: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let text: String
    private let icon: GrowIconography
    private let isSelected: Bool
    private let action: () -> Void
    
    public init(
        _ text: String,
        icon: GrowIconography = .radio,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.icon = icon
        self.isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        
        let primary: GrowColorScheme = isSelected ? .radioButtonPrimary : .radioButtonPrimaryDisabled
        let secondary: GrowColorScheme = isSelected ? .radioButtonSecondary : .radioButtonSecondaryDisabled
        
        Button {
            action()
        } label: {
            HStack(spacing: 6) {
                if isSelected {
                    Image(icon: icon)
                        .resizable()
                        .growIconColor(primary)
                        .frame(size: 24)
                }
                Text(text)
                    .growFont(.bodyM)
                    .growColor(secondary)
            }
            .padding(.horizontal, 14)
            .frame(height: 44)
            .stroke(12, content: colorProvider.color(primary), lineWidth: 1.5)
        }
        .applyAnimation()
    }
}