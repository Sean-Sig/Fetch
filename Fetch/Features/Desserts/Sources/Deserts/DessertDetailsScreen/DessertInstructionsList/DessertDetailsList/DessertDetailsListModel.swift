import Foundation

struct DesertDetailsListModel: Equatable, Decodable {
    var meals: [DessertDetailItemModel]
}

#if DEBUG
extension DesertDetailsListModel {
    static let desertDetailsMock = DesertDetailsListModel(
        meals: [.desertDetailItemMock]
    )
}
#endif
