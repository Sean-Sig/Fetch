import Foundation

enum RootTabItem: Int {
    case desserts
}

extension RootTabItem: Identifiable {
    var id: Int {
        rawValue
    }
}
