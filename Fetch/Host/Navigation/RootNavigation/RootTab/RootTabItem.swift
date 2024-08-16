import Foundation

enum RootTabItem: Int {
    case deserts
}

extension RootTabItem: Identifiable {
    var id: Int {
        rawValue
    }
}
