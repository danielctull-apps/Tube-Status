
import Tagged

public struct Status {
    public typealias ID = Tagged<Self, Int>
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

        self.init(id: ID(rawValue: id),
                  line: Line.ID(rawValue: lineId),
                  severity: Severity(rawValue: statusSeverityDescriprion),
                  reason: reason)
    }
}
