import XCTest
@testable import CLITools

final class swift_cli_toolsTests: XCTestCase {
    func testExample() {
        let file = File(name: "name", content: "Content")
        XCTAssertEqual(file.name, "name")
        XCTAssertEqual(file.content, "Content")
    }

    func testFileWriterPrinter() {
        let str = FileReaderAndWriter.prettierLogForFile(success: [true, false, true])
        let toCompare = "You just created 2 arquives."
        XCTAssertEqual(str, toCompare)
    }

    static var allTests = [
        ("testExample", testExample),
        ("testFileWriterPrinter", testFileWriterPrinter)
    ]
}
