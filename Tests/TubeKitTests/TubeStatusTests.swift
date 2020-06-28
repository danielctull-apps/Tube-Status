import XCTest
@testable import TubeStatus

final class TubeStatusTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TubeStatus().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
