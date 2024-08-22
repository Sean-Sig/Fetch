import SwiftUI

struct DessertDetailsListView: View {
    var desertDetailsListModel: DesertDetailsListModel

    var body: some View {
        ScrollView {
            ForEach(desertDetailsListModel.meals, id: \.id) { row in
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
    DessertDetailsListView(desertDetailsListModel: .desertDetailsMock)
}
#endif
