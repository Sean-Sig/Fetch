import Foundation

struct DessertItemModel: Equatable, Decodable {
    var id: String {idMeal}
    var strMeal: String
    var strMealThumb: URL?
    var idMeal: String
}

#if DEBUG
extension DessertItemModel {
    static let desertItemMock = DessertItemModel(
        strMeal: "Apple & Blackberry Crumble",
        strMealThumb: URL(string: "www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        idMeal: "52893"
    )
}
#endif
