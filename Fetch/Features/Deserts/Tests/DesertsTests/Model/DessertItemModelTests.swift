import XCTest
@testable import Deserts

final class DessertItemModelTests: XCTestCase {

    func testDessertItemModelDecoding() throws {
        let json = """
        {
            "strMeal": "Apam balik",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
            "idMeal": "53049"
        }
        """
        guard let jsonData = json.data(using: .utf8) else {
            XCTFail("Failed to convert string to data.")
            return
        }

        let decoder = JSONDecoder()
        let dessertItem = try decoder.decode(DessertItemModel.self, from: jsonData)

        XCTAssertEqual(dessertItem.strMeal, "Apam balik")
        XCTAssertEqual(dessertItem.idMeal, "53049")
        XCTAssertEqual(
            dessertItem.strMealThumb,
            URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        )
        XCTAssertEqual(dessertItem.id, "53049")
    }

    func testDessertItemModelEquatable() throws {
        let dessert1 = DessertItemModel(
            strMeal: "Apam balik",
            strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
            idMeal: "53049"
        )
        let dessert2 = DessertItemModel(
            strMeal: "Apam balik",
            strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
            idMeal: "53049"
        )
        let dessert3 = DessertItemModel(
            strMeal: "Apple & Blackberry Crumble",
            strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
            idMeal: "52893"
        )

        XCTAssertEqual(dessert1, dessert2)
        XCTAssertNotEqual(dessert1, dessert3)
    }
}
