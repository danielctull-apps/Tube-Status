
import Tagged

public struct Line: Identifiable {
    public typealias ID = Tagged<Self, String>
    public let id: ID
    public let name: String
    public let statuses: [Status]
}

extension Line {

    init?(_ api: API.Line) {

        guard let id = api.id,
              let name = api.name,
              let statuses = api.lineStatuses
        else {
            return nil
        }

        self.init(id: ID(rawValue: id),
                  name: name,
                  statuses: statuses.compactMap(Status.init))
    }
}
