import SwiftUI

struct DesertItemView: View {
    var desertItemModel: DesertItemModel
    var isLast: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 0) {
                Text(desertItemModel.strMeal)
                Spacer()
            }
            .padding()
            if !isLast {
                Divider()
                    .padding(.leading, 8)
            }
        }
    }
}

#if DEBUG
#Preview {
    DesertItemView(desertItemModel: .desertItemMock)
}
#endif
