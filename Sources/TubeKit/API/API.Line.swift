
extension API {

    struct Line: Decodable {
        let id: String?
        let name: String?
        let lineStatuses: [LineStatus]?
    }
}
