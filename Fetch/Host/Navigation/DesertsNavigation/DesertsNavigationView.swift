import SwiftUI
import Deserts

struct DesertsNavigationView: View {
    var body: some View {
        NavigationView {
            DessertsScreen()
        }
    }
}

#if DEBUG
#Preview {
    DesertsNavigationView()
}
#endif
