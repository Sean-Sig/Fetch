import Foundation

struct DessertDetailItemModel: Equatable, Decodable {
    var id: String {idMeal}
    var strMeal: String
    var strMealThumb: URL?
    var idMeal: String
    var strArea: String
    var strInstructions: String
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
}

#if DEBUG
extension DessertDetailItemModel {
    static let desertDetailItemMock = DessertDetailItemModel(
        strMeal: "Apple & Blackberry Crumble",
        strMealThumb: URL(string: "www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        idMeal: "52893",
        strArea: "American",
        strInstructions: "In a bowl, mash the banana with a fork until it resembles a thick purée. Stir in the eggs, baking powder and vanilla.\r\nHeat a large non-stick frying pan or pancake pan over a medium heat and brush with half the oil. Using half the batter, spoon two pancakes into the pan, cook for 1-2 mins each side, then tip onto a plate. Repeat the process with the remaining oil and batter. Top the pancakes with the pecans and raspberries.",
        strIngredient1: "Banana",
        strIngredient2: "Eggs",
        strMeasure1: "1 large",
        strMeasure2: "2 medium"
    )
}
#endif
