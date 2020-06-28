
public struct Severity: CustomStringConvertible, Equatable, Hashable, RawRepresentable {

    public let rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    public var description: String { rawValue }
}

extension Severity {
    public static let goodService = Severity(rawValue: "Good Service")
    public static let noIssues = Severity(rawValue: "No Issues")
    public static let information = Severity(rawValue: "Information")
}
