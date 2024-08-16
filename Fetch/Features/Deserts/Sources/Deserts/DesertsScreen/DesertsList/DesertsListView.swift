import SwiftUI

struct DesertsListView: View {
    var desertsListModel: DesertsListModel

    var body: some View {
        List {
            ForEach(desertsListModel.meals, id: \.id) { row in
                DesertItemView(
                    desertItemModel: row,
                    isLast: row.id == desertsListModel.meals.last?.id
                )
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}

#if DEBUG
#Preview {
    DesertsListView(desertsListModel: .desertsMock)
}
#endif
