
import Tagged

public struct Status {

    public struct ID: Equatable, Hashable {
        // It turns out the id for the status is localised to that line, so a
        // truly unique ID needs to include the line ID.
        let value: Int
        let line: Line.ID
    }

    public let id: ID
    public let line: Line.ID
    public let severity: Severity
    public let reason: String
}

extension Status {

    init?(_ api: API.LineStatus) {

        guard let id = api.id,
              let lineId = api.lineId,
              let statusSeverityDescriprion = api.statusSeverityDescription,
              let reason = api.reason
        else {
            return nil
        }

        let line = Line.ID(rawValue: lineId)

        self.init(id: ID(value: id, line: line),
                  line: line,
                  severity: Severity(rawValue: statusSeverityDescriprion),
                  reason: reason)
    }
}
