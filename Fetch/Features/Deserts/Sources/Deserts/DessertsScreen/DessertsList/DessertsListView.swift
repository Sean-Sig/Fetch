import SwiftUI

struct DessertsListView: View {
    var desertsListModel: DessertsListModel

    var body: some View {
        List {
            ForEach(desertsListModel.meals, id: \.id) { row in
                DessertItemView(
                    desertItemModel: row
                )
                .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(.plain)
    }
}

#if DEBUG
#Preview {
    DessertsListView(desertsListModel: .desertsMock)
}
#endif
