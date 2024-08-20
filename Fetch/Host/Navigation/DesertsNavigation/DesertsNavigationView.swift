import SwiftUI
import Desserts

struct DessertsNavigationView: View {
    var body: some View {
        NavigationView {
            DessertsScreen()
        }
    }
}

#if DEBUG
#Preview {
    DessertsNavigationView()
}
#endif
