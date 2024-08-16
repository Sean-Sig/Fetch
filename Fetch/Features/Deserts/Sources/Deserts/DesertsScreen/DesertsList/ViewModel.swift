import Foundation
import SwiftUI
import Combine

public protocol FetchAction {
    static var fetch: Self { get }
}

public protocol RefreshAction {
    static var refresh: Self { get }
}

public typealias AsyncActions = RefreshAction & FetchAction

public protocol Actionable<Action> {
    associatedtype Action

    @discardableResult
    func send(action: Action) -> Future<Void, Never>
}

public protocol ViewModel<Model>: Actionable, ObservableObject {
    associatedtype Model

    var model: Model { get }
}

public extension ViewModel {
    func bind<Value>(_ valuePath: KeyPath<Model, Value>, action: @escaping (Value) -> Action) -> Binding<Value> {
        return Binding(
            get: { self.model[keyPath: valuePath] },
            set: { value in DispatchQueue.main.async {
                self.send(action: action(value))
            }
            }
        )
    }
}
