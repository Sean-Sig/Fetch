import XCTest
@testable import Deserts

final class DessertDetailItemModelTests: XCTestCase {

    func testDessertDetailItemModelDecoding() throws {
        let json = """
        {
            "idMeal": "53049",
            "strMeal": "Apam balik",
            "strArea": "Malaysian",
            "strInstructions": "Mix milk, oil and egg together. Sift flour",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
            "strYoutube": "https://www.youtube.com/watch?v=6R8ffRRJcrg",
            "strIngredient1": "Milk",
            "strIngredient2": "Oil",
            "strIngredient3": "Eggs",
            "strIngredient4": "Flour",
            "strIngredient5": "Baking Powder",
            "strIngredient6": "Salt",
            "strIngredient7": "Unsalted Butter",
            "strIngredient8": "Sugar",
            "strIngredient9": "Peanut Butter",
            "strIngredient10": "",
            "strMeasure1": "200ml",
            "strMeasure2": "60ml",
            "strMeasure3": "2",
            "strMeasure4": "1600g",
            "strMeasure5": "3 tsp",
            "strMeasure6": "1/2 tsp",
            "strMeasure7": "25g",
            "strMeasure8": "45g",
            "strMeasure9": "3 tbs",
            "strMeasure10": " ",
            "strMeasure11": " ",
            "strMeasure12": " ",
            "strMeasure13": " ",
            "strMeasure14": "     ",
            "strMeasure15": " "
        }
        """
        guard let jsonData = json.data(using: .utf8) else {
            XCTFail("Failed to convert string to data.")
            return
        }

        let decoder = JSONDecoder()
        let dessertDetailItem = try decoder.decode(DessertDetailItemModel.self, from: jsonData)

        XCTAssertEqual(dessertDetailItem.strMeal, "Apam balik")
        XCTAssertEqual(dessertDetailItem.idMeal, "53049")
        XCTAssertEqual(
            dessertDetailItem.strMealThumb,
            URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        )
        XCTAssertEqual(dessertDetailItem.id, "53049")
        XCTAssertEqual(dessertDetailItem.ingredients.count, 9)
        XCTAssertEqual(dessertDetailItem.measurements.count, 9)
    }

    func testDessertDetailItemModelEquatable() throws {
        let dessert1 = DessertDetailItemModel(
            strMeal: "Apam balik",
            idMeal: "53049",
            strArea: "Malaysian",
            strInstructions: "Mix milk, oil and egg together. Sift flour"
        )
        let dessert2 = DessertDetailItemModel(
            strMeal: "Apam balik",
            idMeal: "53049",
            strArea: "Malaysian",
            strInstructions: "Mix milk, oil and egg together. Sift flour"
        )
        let dessert3 = DessertDetailItemModel(
            strMeal: "Apple Frangipan Tart",
            idMeal: "53049",
            strArea: "British",
            strInstructions: "Preheat the oven to 200C/180C Fan/Gas 6."
        )

        XCTAssertEqual(dessert1, dessert2)
        XCTAssertNotEqual(dessert1, dessert3)
    }
}
