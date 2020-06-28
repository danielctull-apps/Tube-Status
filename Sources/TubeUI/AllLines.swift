
import PublisherView
import Resourceful
import SwiftUI
import TubeKit

public struct AllLines: View {

    public init() {}

    @Environment(\.urlSession) var urlSession

    public var body: some View {
        PublisherView(publisher: urlSession.publisher(for: .statuses),
                      initial: EmptyView.init,
                      output: LinesView.init,
                      failure: { Text(String(describing: $0)) })
    }
}
