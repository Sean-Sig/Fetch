import Foundation

struct DesertsListModel: Equatable, Decodable {
    var meals: [DesertItemModel]
}

#if DEBUG
extension DesertsListModel {
    static let desertsMock = DesertsListModel(
        meals: [
            .desertItemMock
        ]
    )
}
#endif
