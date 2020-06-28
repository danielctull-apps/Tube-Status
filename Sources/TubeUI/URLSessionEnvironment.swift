
import SwiftUI

extension EnvironmentValues {

    private struct URLSessionKey: EnvironmentKey {
        static let defaultValue = URLSession.shared
    }

    public var urlSession: URLSession {
        get { self[URLSessionKey.self] }
        set { self[URLSessionKey.self] = newValue }
    }
}
