import SwiftUI

struct DessertDetailsScreen: View {
    @State var title = ""
    @StateObject var viewModel = DesertDetailsScreenViewModel("")
    
    var body: some View {
        VStack {
            if viewModel.model.isLoading {
                Text("loading...")
            } else if viewModel.model.error != nil {
                Text("Error")
            } else {
                DessertDetailsListView(desertsListModel: viewModel.model.value)
            }
        }
        .onAppear {
            Task {
                await viewModel.send(action: .fetch)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#if DEBUG
#Preview {
    DessertDetailsScreen(title: "Apple & Blackberry Crumble")
}
#endif
