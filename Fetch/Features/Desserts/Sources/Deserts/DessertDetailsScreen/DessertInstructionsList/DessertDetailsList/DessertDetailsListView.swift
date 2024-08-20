import SwiftUI

struct DessertDetailsListView: View {
    var desertsListModel: DesertDetailsListModel

    var body: some View {
        ScrollView {
            ForEach(desertsListModel.meals, id: \.id) { row in
                DessertDetailItemView(
                    dessertDetailsItemModel: row
                )
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

#if DEBUG
#Preview {
    DessertDetailsListView(desertsListModel: .desertDetailsMock)
}
#endif
