import Foundation

struct DesertItemModel: Equatable, Decodable {
    var id: String {idMeal}
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}

#if DEBUG
extension DesertItemModel {
    static let desertItemMock = DesertItemModel(
        strMeal: "Apple & Blackberry Crumble",
        strMealThumb: "www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
        idMeal: "52893"
    )
}
#endif
