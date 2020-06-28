
import SwiftUI
import TubeKit

extension Line {

    public var color: Color { Color(id.rawValue, bundle: .module) }

    public var foregroundColor: Color {
        Color(id.rawValue + "-foreground", bundle: .module)
    }
}
