
import XCTest
import Resourceful
import TubeKit

final class TubeStatusTests: XCTestCase {

    func testLineStatus() throws {
        let json = try Bundle.module.response(named: "linestatus.json")
        let lines = try Resource.statuses.transform((json, HTTPURLResponse.ok))
        XCTAssertEqual(lines.count, 11)
        let line = try XCTUnwrap(lines.first)
        XCTAssertEqual(line.id, Line.ID(rawValue: "bakerloo"))
        XCTAssertEqual(line.name, "Bakerloo")
        let status = try XCTUnwrap(line.statuses.first)
        XCTAssertEqual(status.line, Line.ID(rawValue: "bakerloo"))
        XCTAssertEqual(status.severity, Severity(rawValue: "Special Service"))
        XCTAssertEqual(status.reason, "Bakerloo Line: A 4 minute service is operating due to operational restrictions. Public transport should only be used for essential journeys. ")
    }
}

extension Bundle {

    fileprivate func response(named name: String) throws -> Data {
        let responses = try XCTUnwrap(url(forResource: "Responses", withExtension: nil))
        let url = responses.appendingPathComponent("linestatus.json")
        return try Data(contentsOf: url)
    }
}

extension HTTPURLResponse {

    fileprivate static let ok = HTTPURLResponse(url: URL(string: "https://danieltull.co.uk")!,
                                                statusCode: 200,
                                                httpVersion: nil,
                                                headerFields: nil)!
}
