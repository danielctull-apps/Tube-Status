
import SwiftUI
import TubeKit

extension Severity {

    public var icon: Image {
        switch self {
        case .goodService: return Image(systemName: "checkmark.square.fill")
        case .noIssues: return Image(systemName: "checkmark.square.fill")
        case .information: return Image(systemName: "info.circle.fill")
        default: return Image(systemName: "exclamationmark.triangle.fill")
        }
    }
}
