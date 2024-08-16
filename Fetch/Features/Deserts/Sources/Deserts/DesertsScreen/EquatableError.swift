import Foundation

/// From https://twittemb.github.io/posts/2021-12-10-EquatableError/
public struct EquatableError: LocalizedError, Error, Equatable, CustomStringConvertible {
    public let base: Error
    private let equals: (Error) -> Bool

    init<Base: Error>(_ base: Base) {
        self.base = base
        self.equals = { String(reflecting: $0) == String(reflecting: base) }
    }

    init<Base: Error & Equatable>(_ base: Base) {
        self.base = base
        self.equals = { ($0 as? Base) == base }
    }

    public var errorDescription: String? {
        self.description
    }

    public static func == (lhs: EquatableError, rhs: EquatableError) -> Bool {
        lhs.equals(rhs.base)
    }

    public var description: String {
        "\(self.base)"
    }

    func asError<Base: Error>(type: Base.Type) -> Base? {
        self.base as? Base
    }

    var localizedDescription: String {
        self.base.localizedDescription
    }
}

public extension Error where Self: Equatable {
    func toEquatableError() -> EquatableError {
        EquatableError(self)
    }
}

public extension Error {
    func toEquatableError() -> EquatableError {
        EquatableError(self)
    }
}
