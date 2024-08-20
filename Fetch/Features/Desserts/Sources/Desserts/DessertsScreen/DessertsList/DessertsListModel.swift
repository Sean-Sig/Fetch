import Foundation

struct DessertsListModel: Equatable, Decodable {
    var meals: [DessertItemModel]
}

#if DEBUG
extension DessertsListModel {
    static let desertsMock = DessertsListModel(
        meals: [
            .desertItemMock
        ]
    )
}
#endif
