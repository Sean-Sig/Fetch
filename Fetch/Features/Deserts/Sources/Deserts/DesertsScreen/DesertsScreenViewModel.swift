import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}

enum PaymentsListAction: AsyncActions {
    case fetch
    case refresh
    case setError(EquatableError?)
}

class DesertsScreenViewModel: ObservableObject {
    @Published private(set) var model = AsyncModel(
            value: DesertsListModel(
                meals: []
        )
    )
        
    func send(action: PaymentsListAction) async {
        switch action {
        case .fetch, .refresh:
            do {
                guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
                    throw EquatableError(APIError.invalidURL)
                }
                
                let (data, response) = try await URLSession.shared.data(from: url)
                
                print(data)
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw APIError.requestFailed
                }
                
                let decoder = JSONDecoder()
                let apiResponse = try decoder.decode(DesertsListModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.model = AsyncModel(value: apiResponse)
                }
            } catch {
                print("Error fetching data: \(error)")
            }
            
        case .setError(let error):
            model.error = error
        }
    }
}
