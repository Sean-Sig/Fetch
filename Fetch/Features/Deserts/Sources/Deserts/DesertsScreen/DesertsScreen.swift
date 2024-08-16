import SwiftUI

public struct DesertsScreen: View {
    @StateObject var viewModel = DesertsScreenViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            if viewModel.model.isLoading {
                Text("loading...")
            } else if viewModel.model.error != nil {
                Text("Error")
            } else {
                DesertsListView(desertsListModel: viewModel.model.value)
            }
        }
        .onAppear {
            Task {
                await viewModel.send(action: .fetch)
            }
        }
    }
}

#if DEBUG
#Preview {
    DesertsScreen()
}
#endif
