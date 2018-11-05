import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(swift_cli_toolsTests.allTests),
        testCase(URLBuilderTests.allTests),
    ]
}
#endif
