import Foundation
import CommonFoundation

enum DessertsDetailsAction: AsyncActions {
    case fetch
    case refresh
    case setError(EquatableError?)
}

class DesertDetailsScreenViewModel: ObservableObject {
    private var mealId: String = ""
    @Published private(set) var model = AsyncModel(
            value: DesertDetailsListModel(
                meals: []
        ), isLoading: true
    )

    init(_ mealId: String) {
        self.mealId = mealId
    }

    func send(action: DessertsDetailsAction) async {
        switch action {
        case .fetch, .refresh:
            await getDesertDetails(mealId: mealId)
        case .setError(let error):
            model.error = error
        }
    }

    @MainActor
    private func getDesertDetails(mealId: String) async {
        do {
            guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
                throw APIError.invalidURL
            }

            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.requestFailed
            }

            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(DesertDetailsListModel.self, from: data)

            DispatchQueue.main.async {
                self.model = AsyncModel(value: apiResponse)
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
