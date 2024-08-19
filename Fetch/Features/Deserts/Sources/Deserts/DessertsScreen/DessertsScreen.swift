import SwiftUI

public struct DessertsScreen: View {
    @StateObject var viewModel = DessertsScreenViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            if viewModel.model.isLoading {
                Text("loading...")
            } else if viewModel.model.error != nil {
                Text("Error")
            } else {
                DessertsListView(desertsListModel: viewModel.model.value)
            }
        }
        .onAppear {
            Task {
                await viewModel.send(action: .fetch)
            }
        }
        .refreshable {
            await viewModel.send(action: .refresh)
        }
        .navigationTitle("Desserts")
    }
}

#if DEBUG
#Preview {
    DessertsScreen()
}
#endif
