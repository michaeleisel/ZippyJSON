//Copyright (c) 2018 Michael Eisel. All rights reserved.

import XCTest
@testable import ZippyJSON

struct TestCodingKey: CodingKey {
    var stringValue: String

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    var intValue: Int? {
        return nil
    }

    init?(intValue: Int) {
        return nil
    }
}

func dataFromFile(_ file: String) -> Data {
    let path = Bundle(identifier: "com.eisel.ZippyJSON")!.path(forResource: file, ofType: "")!
    let string = try! String(contentsOfFile: path)
    return string.data(using: .utf8)!
}

class ZippyJSONTests: XCTestCase {
    let decoder = ZippyJSONDecoder()
    let base64Data = dataFromFile("base64.json")
    let twitterData = dataFromFile("twitter.json")

    func testRecursiveDecoding() {
        decoder.keyDecodingStrategy = .custom({ (keys) -> CodingKey in
            let recursiveDecoder = ZippyJSONDecoder()
            let data: Data = keys.last!.stringValue.data(using: .utf8)!
            return TestCodingKey(stringValue: try! recursiveDecoder.decode(String.self, from: data))!
        })
    }

    func testCamelCase() {
        let keyDecodingStrategies: [ZippyJSONDecoder.KeyDecodingStrategy] = [.useDefaultKeys, .convertFromSnakeCase]
        for keyDecodingStrategy in keyDecodingStrategies {
            let appleDecoder = Foundation.JSONDecoder()
            let foundationKeyDecodingStrategy: Foundation.JSONDecoder.KeyDecodingStrategy = ZippyJSONDecoder.convertKeyDecodingStrategy(keyDecodingStrategy)
            appleDecoder.keyDecodingStrategy = foundationKeyDecodingStrategy
            let testDecoder = ZippyJSONDecoder()
            testDecoder.keyDecodingStrategy = keyDecodingStrategy
            switch keyDecodingStrategy {
            case .useDefaultKeys:
                let appleObject = try! appleDecoder.decode(TwitterPayload.self, from: twitterData)
                let testObject = try! testDecoder.decode(TwitterPayload.self, from: twitterData)
                XCTAssertEqual(appleObject, testObject)
            case .convertFromSnakeCase:
                let appleObject = try! appleDecoder.decode(TwitterPayloadC.self, from: twitterData)
                let testObject = try! testDecoder.decode(TwitterPayloadC.self, from: twitterData)
                XCTAssertEqual(appleObject, testObject)
            default:
                fatalError()
            }
        }
    }

    func testBase64() {
        let dataDecodingStrategies: [ZippyJSONDecoder.DataDecodingStrategy] = [.base64]
        for dataDecodingStrategy in dataDecodingStrategies {
            let appleDecoder = Foundation.JSONDecoder()
            let foundationDataDecodingStrategy = ZippyJSONDecoder.convertDataDecodingStrategy(dataDecodingStrategy)
            appleDecoder.dataDecodingStrategy = foundationDataDecodingStrategy
            let testDecoder = ZippyJSONDecoder()
            testDecoder.dataDecodingStrategy = dataDecodingStrategy
            switch dataDecodingStrategy {
            case .base64:
                let appleObject = try! appleDecoder.decode(DataPayload.self, from: base64Data)
                // let iObject = try! iDecoder.decode(TwitterPayload.self, from: data)
                let testObject = try! testDecoder.decode(DataPayload.self, from: base64Data)
                XCTAssertEqual(appleObject, testObject)
            default:
                fatalError()
            }
        }
    }

    func testMatchingErrors() {
    }
}
