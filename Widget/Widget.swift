
import Intents
import Resourceful
import SwiftUI
import TubeKit
import TubeUI
import WidgetKit

struct LinesEntry: TimelineEntry {
    let date: Date
    let lines: [Line]
}

struct LinesProvider: TimelineProvider {

    func snapshot(with context: Context, completion: @escaping (LinesEntry) -> ()) {

        URLSession.shared.fetch(.statuses) { result in
            switch result {
            case .success(let lines):
                completion(LinesEntry(date: Date(), lines: lines))
            case .failure:
                return
            }
        }
    }

    func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        let expiry = Date(timeIntervalSinceNow: 300)
        URLSession.shared.fetch(.statuses) { result in
            switch result {
            case .success(let lines):
                let entry = LinesEntry(date: Date(), lines: lines)
                completion(Timeline(entries: [entry], policy: .after(expiry)))
            case .failure:
                completion(Timeline(entries: [], policy: .after(expiry)))
            }
        }
    }
}

struct LinesView: View {
    var entry: LinesProvider.Entry

    var body: some View {
        GeometryReader { proxy in
            VStack {
                ForEach(entry.lines) { line in

                    HStack {
                        Text(line.name)
                        Spacer()
                        Text(line.statuses.first?.severity.description ?? "")
                    }
                    .padding(.horizontal)
                    .frame(height: proxy.size.height / CGFloat(entry.lines.count))
                    .frame(maxWidth: .infinity)
                    .background(line.color)
                    .foregroundColor(line.foregroundColor)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

@main
struct TubeWidget: Widget {
    private let kind: String = "Widget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: "Lines",
                            provider: LinesProvider(),
                            placeholder: EmptyView(),
                            content: LinesView.init)
            .configurationDisplayName("Lines")
            .description("This is an example widget.")
            .supportedFamilies([.systemLarge])
    }
}
