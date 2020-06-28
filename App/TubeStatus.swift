
import SwiftUI
import TubeUI

@main
struct TubeStatus: App {
    var body: some Scene {
        WindowGroup {
            AllLines()
                .environment(\.urlSession, URLSession.shared)
        }
    }
}
