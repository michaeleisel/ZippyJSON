import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ZippyJSONDecoderTests.allTests),
        testCase(AppleJSONDecoderTests.allTests),
    ]
}
#endif
