
import Foundation

extension API {

    struct ValidityPeriod: Decodable {

        /// Gets the start date.
        let fromDate: String?

        /// Gets the end date.
        let toDate: String?

        /// If true is a realtime status rather than planned or info
        let isNow: Bool?
    }
}
