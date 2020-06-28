
import Foundation
import Resourceful

extension URL {
    fileprivate static let tfl = URL(string: "https://api.tfl.gov.uk")!
}

extension Resource where Value == [Line] {

    public static var statuses: Resource<[Line]> {

        let url = URL.tfl
            .appendingPathComponent("line")
            .appendingPathComponent("mode")
            .appendingPathComponent("tube,dlr")
            .appendingPathComponent("status")

        return Resource(request: URLRequest(url: url)) {

            try JSONDecoder()
                .decode([API.Line].self, from: $0.data)
                .compactMap(Line.init)
        }
    }
}
