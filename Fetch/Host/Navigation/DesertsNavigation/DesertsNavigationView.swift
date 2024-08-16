import SwiftUI
import Deserts

struct DesertsNavigationView: View {
    var body: some View {
        NavigationView {
            DesertsScreen()
        }
    }
}

#if DEBUG
#Preview {
    DesertsNavigationView()
}
#endif
