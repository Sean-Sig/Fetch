import Foundation
import CommonFoundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}

enum DessertsListAction: AsyncActions {
    case fetch
    case refresh
    case setError(EquatableError?)
}

final class DessertsScreenViewModel: ObservableObject {
    @Published private(set) var model = AsyncModel(
        value: DessertsListModel(meals: []), isLoading: true
    )

    func send(action: DessertsListAction) async {
        switch action {
        case .fetch, .refresh:
            await fetchDesserts()
        case .setError(let error):
            model.error = error
        }
    }

    @MainActor
    private func fetchDesserts() async {
        do {
            guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
                throw APIError.invalidURL
            }

            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.requestFailed
            }

            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(DessertsListModel.self, from: data)

            self.model = AsyncModel(value: apiResponse)
        } catch {
            self.model.error = error.toEquatableError()
        }
    }
}
