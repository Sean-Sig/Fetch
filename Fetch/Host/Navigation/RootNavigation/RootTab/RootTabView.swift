import SwiftUI

struct RootTabView: View {

    let rootTabItems: [RootTabItem] = [.deserts]

    var body: some View {
        TabView {
            ForEach(rootTabItems, id: \.self) { tabItem in
                switch tabItem {
                case .deserts:
                    desertsRootTabView
                        .tag(tabItem)
                }
            }
        }
    }
}

private extension RootTabView {
    var desertsRootTabView: some View {
        DesertsNavigationView()
            .tabItem {
                Label {
                    Text("Deserts")
                } icon: {
                    Image(systemName: "house")
                }
            }
    }
}

#if DEBUG
#Preview {
    RootTabView()
}
#endif
