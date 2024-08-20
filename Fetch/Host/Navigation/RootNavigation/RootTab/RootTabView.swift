import SwiftUI

struct RootTabView: View {

    let rootTabItems: [RootTabItem] = [.desserts]

    var body: some View {
        TabView {
            ForEach(rootTabItems, id: \.self) { tabItem in
                switch tabItem {
                case .desserts:
                    dessertsRootTabView
                        .tag(tabItem)
                }
            }
        }
    }
}

private extension RootTabView {
    var dessertsRootTabView: some View {
        DessertsNavigationView()
            .tabItem {
                Label {
                    Text("Desserts")
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
