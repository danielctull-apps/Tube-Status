
extension API {

    struct LineStatus: Decodable {
        let id: Int?
        let lineId: String?
        let statusSeverity: Int?
        let statusSeverityDescription: String?
        let reason: String?
        let validityPeriods: [ValidityPeriod]?
    }
}
