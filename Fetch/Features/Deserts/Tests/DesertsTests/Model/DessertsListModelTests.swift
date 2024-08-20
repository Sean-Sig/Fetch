import XCTest
@testable import Deserts

final class DessertsListModelTests: XCTestCase {

    func testDessertsListModelDecoding() throws {
        let json = """
        {
            "meals": [
                {
                  "strMeal": "Apam balik",
                  "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                  "idMeal": "53049"
                },
                {
                  "strMeal": "Apple & Blackberry Crumble",
                  "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                  "idMeal": "52893"
                },
            ]
        }
        """
        guard let jsonData = json.data(using: .utf8) else {
            XCTFail("Failed to convert string to data.")
            return
        }

        let decoder = JSONDecoder()
        let dessertsList = try decoder.decode(DessertsListModel.self, from: jsonData)

        XCTAssertEqual(dessertsList.meals.count, 2)
        XCTAssertEqual(dessertsList.meals[0].strMeal, "Apam balik")
        XCTAssertEqual(dessertsList.meals[0].idMeal, "53049")
        XCTAssertEqual(dessertsList.meals[1].strMeal, "Apple & Blackberry Crumble")
        XCTAssertEqual(dessertsList.meals[1].idMeal, "52893")
    }

    func testDessertsListModelEquatable() throws {
        let dessert1 = DessertItemModel(
            strMeal: "Apam balik",
            strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
            idMeal: "53049"
        )
        let dessert2 = DessertItemModel(
            strMeal: "Apple & Blackberry Crumble",
            strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
            idMeal: "52893"
        )

        let dessertsList1 = DessertsListModel(meals: [dessert1, dessert2])
        let dessertsList2 = DessertsListModel(meals: [dessert1, dessert2])
        let dessertsList3 = DessertsListModel(meals: [dessert2])

        XCTAssertEqual(dessertsList1, dessertsList2)
        XCTAssertNotEqual(dessertsList1, dessertsList3)
    }
}
