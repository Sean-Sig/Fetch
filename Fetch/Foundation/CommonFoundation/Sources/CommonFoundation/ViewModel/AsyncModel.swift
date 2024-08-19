import Foundation

/// Useful to create AsyncData where UI only care of loading and error
/// Example: login success  response data is not useful to for the UI. In this case the next view is pushed
public struct Empty: Equatable {}

public struct AsyncModel<Value: Equatable>: Equatable {
    public var value: Value
    public var error: EquatableError?
    public var isLoading: Bool

    public init(value: Value, error: EquatableError? = nil, isLoading: Bool = false) {
        self.value = value
        self.error = error
        self.isLoading = isLoading
    }
}

public extension AsyncModel where Value: ExpressibleByNilLiteral {
    init(value: Value = nil, error: EquatableError? = nil, isLoading: Bool = false) {
        self.value = value
        self.error = error
        self.isLoading = isLoading
    }
}
