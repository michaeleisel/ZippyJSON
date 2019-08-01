//Copyright (c) 2018 Michael Eisel. All rights reserved.

import Foundation
import ZippyJSONCFamily

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
fileprivate var _iso8601Formatter: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    return formatter
}()

private final class DocumentHolder {
    let value: UnsafeRawPointer

    init(value: UnsafeRawPointer) {
        self.value = value
    }

    deinit {
        JNTReleaseDocument(value)
    }
}

public final class ZippyJSONDecoder {
    public func decode<T : Decodable>(_ type: T.Type, from data: /*todo: inout*/ Data) throws -> T {
        let lockAcquired = JNTAcquireThreadLock()
        guard lockAcquired else {
            return try decodeWithAppleDecoder(type, from: data)
        }
        defer {
            JNTReleaseThreadLock()
        }
        return try data.withUnsafeBytes { (bytes) -> T in
            let value: UnsafeRawPointer = JNTDocumentFromJSON(bytes.baseAddress!, data.count)
            defer {
                JNTReleaseDocument(value)
            }
            let decoder = __JSONDecoder(value: value, keyDecodingStrategy: keyDecodingStrategy, dataDecodingStrategy: dataDecodingStrategy, dateDecodingStrategy: dateDecodingStrategy, nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy)
            let result = try decoder.unbox(value, as: type, nextPathComponent: nil)
            if let error = decoder.swiftError {
                throw error
            }
            return result
        }
    }

    func decodeWithAppleDecoder<T : Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let appleDecoder = Foundation.JSONDecoder()
        appleDecoder.dataDecodingStrategy = ZippyJSONDecoder.convertDataDecodingStrategy(dataDecodingStrategy)
        appleDecoder.dateDecodingStrategy = ZippyJSONDecoder.convertDateDecodingStrategy(dateDecodingStrategy)
        appleDecoder.keyDecodingStrategy = ZippyJSONDecoder.convertKeyDecodingStrategy(keyDecodingStrategy)
        appleDecoder.nonConformingFloatDecodingStrategy = ZippyJSONDecoder.convertNonConformingFloatDecodingStrategy(nonConformingFloatDecodingStrategy)
        appleDecoder.userInfo = userInfo
        return try appleDecoder.decode(type, from: data)
    }

    static func convertNonConformingFloatDecodingStrategy(_ strategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy) -> Foundation.JSONDecoder.NonConformingFloatDecodingStrategy {
        switch strategy {
        case .convertFromString(let positiveInfinity, let negativeInfinity, let nan):
            return .convertFromString(positiveInfinity: positiveInfinity, negativeInfinity: negativeInfinity, nan: nan)
        case .throw:
            return .throw
        }
    }

    static func convertDateDecodingStrategy(_ strategy: ZippyJSONDecoder.DateDecodingStrategy) -> Foundation.JSONDecoder.DateDecodingStrategy {
        switch strategy {
        case .custom(let converter):
            return Foundation.JSONDecoder.DateDecodingStrategy.custom(converter)
        case .deferredToDate:
            return Foundation.JSONDecoder.DateDecodingStrategy.deferredToDate
        case .iso8601:
            if #available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *) {
                return Foundation.JSONDecoder.DateDecodingStrategy.iso8601
            } else {
                fatalError("ISO8601DateFormatter is unavailable on this platform.")
            }
        case .millisecondsSince1970:
            return Foundation.JSONDecoder.DateDecodingStrategy.millisecondsSince1970
        case .secondsSince1970:
            return Foundation.JSONDecoder.DateDecodingStrategy.secondsSince1970
        case .formatted(let formatter):
            return Foundation.JSONDecoder.DateDecodingStrategy.formatted(formatter)
        }
    }

    static func convertDataDecodingStrategy(_ strategy: ZippyJSONDecoder.DataDecodingStrategy) -> Foundation.JSONDecoder.DataDecodingStrategy {
        switch strategy {
        case .base64:
            return Foundation.JSONDecoder.DataDecodingStrategy.base64
        case .custom(let converter):
            return Foundation.JSONDecoder.DataDecodingStrategy.custom(converter)
        case .deferredToData:
            return Foundation.JSONDecoder.DataDecodingStrategy.deferredToData
        }
    }

    static func convertKeyDecodingStrategy(_ strategy: ZippyJSONDecoder.KeyDecodingStrategy) -> Foundation.JSONDecoder.KeyDecodingStrategy {
        switch strategy {
        case .convertFromSnakeCase:
            return Foundation.JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
        case .useDefaultKeys:
            return Foundation.JSONDecoder.KeyDecodingStrategy.useDefaultKeys
        case .custom(let converter):
            return Foundation.JSONDecoder.KeyDecodingStrategy.custom(converter)
        }
    }


    public var userInfo: [CodingUserInfoKey : Any] = [:]

    public var nonConformingFloatDecodingStrategy: NonConformingFloatDecodingStrategy

    public enum NonConformingFloatDecodingStrategy {
        case `throw`
        case convertFromString(positiveInfinity: String, negativeInfinity: String, nan: String)
    }

    public var dataDecodingStrategy: DataDecodingStrategy

    public enum DataDecodingStrategy {
        case deferredToData
        case base64
        case custom((Decoder) throws -> Data)
    }

    public enum KeyDecodingStrategy {
        case useDefaultKeys
        case convertFromSnakeCase
        case custom(([CodingKey]) -> CodingKey)
    }

    public var keyDecodingStrategy: KeyDecodingStrategy

    public enum DateDecodingStrategy {
        case deferredToDate
        case secondsSince1970
        case millisecondsSince1970
        @available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
        case iso8601
        case formatted(DateFormatter)
        case custom((Decoder) throws -> Date)
    }

    public var dateDecodingStrategy: DateDecodingStrategy

    public init() {
        keyDecodingStrategy = .useDefaultKeys
        dataDecodingStrategy = .base64
        dateDecodingStrategy = .deferredToDate
        nonConformingFloatDecodingStrategy = .throw
    }
}

final private class JSONDecodingStorage {
    private(set) fileprivate var containers: [UnsafeRawPointer] = []
    var codingKeys: [CodingKey] = []

    fileprivate init() {}

    fileprivate var count: Int {
        return self.containers.count
    }

    fileprivate var topContainer: UnsafeRawPointer! {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        return self.containers.last!
    }

    fileprivate func push(container: __owned UnsafeRawPointer!, key: CodingKey?) {
        self.containers.append(container)
        if let key = key {
            codingKeys.append(key)
        }
    }

    fileprivate func popContainer() {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        self.containers.removeLast()
        let _ = codingKeys.popLast()
    }
}

final private class __JSONDecoder: Decoder {
    var userInfo: [CodingUserInfoKey : Any] = [:]
    var codingPath: [CodingKey] {
        return containers.codingKeys
    }
    let value: UnsafeRawPointer
    let keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy
    let caseConversion: Bool
    let dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy
    let dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy
    var error: UnsafeMutablePointer<JNTDecodingError>
    var swiftError: Error?
    var stringsForFloats: Bool

    fileprivate var containers: JSONDecodingStorage

    init(value: UnsafeRawPointer, keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy, dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy, dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy, nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy) {
        self.value = value
        self.containers = JSONDecodingStorage()
        self.error = JNTFetchAndResetError()!
        self.keyDecodingStrategy = keyDecodingStrategy
        self.dataDecodingStrategy = dataDecodingStrategy
        self.dateDecodingStrategy = dateDecodingStrategy
        switch nonConformingFloatDecodingStrategy {
        case .convertFromString(let pI, let nI, let nan):
            pI.withCString { pIP in
                nI.withCString { nIP in
                    nan.withCString { nanP in
                        JNTUpdateFloatingPointStrings(pI, nI, nan)
                    }
                }
            }
            stringsForFloats = true
        case .throw:
            stringsForFloats = false
        }
        switch keyDecodingStrategy {
        case .convertFromSnakeCase:
            caseConversion = true
        default:
            caseConversion = false
        }
    }

    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        return KeyedDecodingContainer(JSONKeyedDecoder(decoder: self, value: containers.topContainer))
    }

    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return JSONUnkeyedDecoder(decoder: self, startingValue: containers.topContainer)
    }

    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        return self
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Date.Type, nextPathComponent: CodingKey?) throws -> Date {
        switch dateDecodingStrategy {
        case .deferredToDate:
            containers.push(container: value, key: nextPathComponent)
            defer { containers.popContainer() }
            return try Date(from: self)

        case .secondsSince1970:
            let double = try unbox(value, as: Double.self, nextPathComponent: nextPathComponent)
            return Date(timeIntervalSince1970: double)

        case .millisecondsSince1970:
            let double = try unbox(value, as: Double.self, nextPathComponent: nextPathComponent)
            return Date(timeIntervalSince1970: double / 1000.0)

        case .iso8601:
            if #available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *) {
                let string = self.unbox(value, as: String.self)
                guard let date = _iso8601Formatter.date(from: string) else {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Expected date string to be ISO8601-formatted."))
                }

                return date
            } else {
                fatalError("ISO8601DateFormatter is unavailable on this platform.")
            }

        case .formatted(let formatter):
            let string = self.unbox(value, as: String.self)
            guard let date = formatter.date(from: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Date string does not match format expected by formatter."))
            }

            return date

        case .custom(let closure):
            containers.push(container: value, key: nextPathComponent)
            defer { containers.popContainer() }
            return try closure(self)
        }
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Decimal.Type, nextPathComponent: CodingKey?) -> Decimal {
        return JNTDocumentDecode__Decimal(value)! as Decimal
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Data.Type) throws -> Data {
        var length: Int32 = 0
        switch dataDecodingStrategy {
        case .base64:
            let string = unbox(value, as: String.self)
            guard let data = Data(base64Encoded: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Encountered Data is not valid Base64."))
            }
            return data
            /*let bytes = JNTDocumentDecode__Data(value, &length)!
            return Data(bytesNoCopy: bytes, count: Int(length), deallocator: .free)*/
        case .deferredToData:
            return try Data(from: self)
        case .custom(let closure):
            containers.push(container: value, key: nil)
            defer { containers.popContainer() }
            return try closure(self)
        }
    }

    fileprivate func unbox<T : Decodable>(_ value: UnsafeRawPointer!, as type: T.Type, nextPathComponent: CodingKey?) throws -> T {
        return (try unbox_(value, as: type, nextPathComponent: nextPathComponent)) as! T
    }

    fileprivate func unbox_(_ value: UnsafeRawPointer!, as type: Decodable.Type, nextPathComponent: CodingKey?) throws -> Any {
        if type == Date.self || type == NSDate.self {
            return try unbox(value, as: Date.self, nextPathComponent: nextPathComponent)
        } else if type == Data.self || type == NSData.self {
            return try unbox(value, as: Data.self)
        } else if type == URL.self || type == NSURL.self {
            let urlString = unbox(value, as: String.self)
            /*guard let urlString = try unbox(value, as: String.self, nextPathComponent: nextPathComponent) else {
                return nil
            }*/
            guard let url = URL(string: urlString) else {
                let path: [CodingKey]
                if let nextPathComponent = nextPathComponent {
                    path = codingPath + [nextPathComponent]
                } else {
                    path = codingPath
                }
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: path,
                                                                        debugDescription: "Invalid URL string."))
             }
            return url
         } else if type == Decimal.self || type == NSDecimalNumber.self {
            return unbox(value, as: Decimal.self, nextPathComponent: nextPathComponent)
         //} else if let stringKeyedDictType = type as? _JSONStringDictionaryDecodableMarker.Type {
             //return try self.unbox(value, as: stringKeyedDictType)
         } else {
            //todo: handle string case separately to reduce container pushing and popping?
            containers.push(container: value, key: nextPathComponent)
            defer { containers.popContainer() }
            return try type.init(from: self)
        }
    }

    fileprivate func swiftErrorFromError<K : CodingKey>(_ error: JNTDecodingError, expectedType: Any.Type, key: K?, nextPathComponent: CodingKey?) -> Error {
        let path: [CodingKey]
        if let nextPathComponent = nextPathComponent {
            path = codingPath + [nextPathComponent]
        } else {
            path = codingPath
        }
        let debugDescription = String(utf8String: error.description)!
        switch error.type {
        case .wrongType:
            return DecodingError.typeMismatch(expectedType, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
        case .numberDoesNotFit:
            return DecodingError.dataCorrupted(DecodingError.Context(codingPath: path, debugDescription:debugDescription))
        case .keyDoesNotExist:
            return DecodingError.keyNotFound(key!, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
        case .valueDoesNotExist:
            return DecodingError.valueNotFound(expectedType, DecodingError.Context(codingPath: path, debugDescription: debugDescription))

        case .none:
            return NSError(domain: "", code: 0, userInfo: [:])
        @unknown default:
            return NSError(domain: "", code: 0, userInfo: [:])
        }
    }

    func handleSwiftError(_ error: Error) {
        self.swiftError = self.swiftError ?? error
    }
}

extension __JSONDecoder {
    // UnboxBegin
    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: UInt8.Type) -> UInt8 {
        let result = JNTDocumentDecode__uint8_t(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: UInt16.Type) -> UInt16 {
        let result = JNTDocumentDecode__uint16_t(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: UInt32.Type) -> UInt32 {
        let result = JNTDocumentDecode__uint32_t(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: UInt64.Type) -> UInt64 {
        let result = JNTDocumentDecode__uint64_t(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Int8.Type) -> Int8 {
        let result = JNTDocumentDecode__int8_t(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Int16.Type) -> Int16 {
        let result = JNTDocumentDecode__int16_t(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Int32.Type) -> Int32 {
        let result = JNTDocumentDecode__int32_t(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Int64.Type) -> Int64 {
        let result = JNTDocumentDecode__int64_t(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Bool.Type) -> Bool {
        let result = JNTDocumentDecode__Bool(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: String.Type) -> String {
        let result = JNTDocumentDecode__String(value)
        if result == nil {
            return ""
        }
        return String(utf8String: result!)!
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Double.Type) -> Double {
        let result = JNTDocumentDecode__Double(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Float.Type) -> Float {
        let result = JNTDocumentDecode__Float(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Int.Type) -> Int {
        let result = JNTDocumentDecode__Int(value)
        return result
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: UInt.Type) -> UInt {
        let result = JNTDocumentDecode__UInt(value)
        return result
    }

    // End
}

fileprivate struct JSONKey : CodingKey {
    public var stringValue: String
    public var intValue: Int?

    public init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    public init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }

    public init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }

    fileprivate init(index: Int) {
        self.stringValue = "Index \(index)"
        self.intValue = index
    }

    fileprivate static let `super` = JSONKey(stringValue: "super")!
}

fileprivate let keyPlaceholder: JSONKey = JSONKey(index: 0)

private final class JSONUnkeyedDecoder : UnkeyedDecodingContainer {
    var currentValue: UnsafeRawPointer
    var count: Int?
    private unowned(unsafe) let decoder: __JSONDecoder
    var currentIndex: Int
    var isAtEnd: Bool

    var codingPath: [CodingKey] {
        return decoder.codingPath
    }

    fileprivate init(decoder: __JSONDecoder, startingValue: UnsafeRawPointer) {
        self.currentValue = startingValue
        self.isAtEnd = JNTIsAtEnd(startingValue)
        self.currentIndex = 0
        self.decoder = decoder
        self.count = nil // todo: slow?
    }

    func decodeNil() throws -> Bool {
        fatalError()
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        guard !isAtEnd else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: codingPath + [JSONKey(index: currentIndex)], debugDescription: "Unkeyed container is at end."))
        }

        let decoded = try decoder.unbox(JNTDocumentEnterDictionary(currentValue), as: T.self, nextPathComponent: JSONKey(index: currentIndex))

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        fatalError()
    }

    func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        fatalError()
    }

    func superDecoder() throws -> Decoder {
        fatalError()
    }

    // UnkeyedBegin
    public func decode(_ type: UInt8.Type) -> UInt8 {
        let decoded = decoder.unbox(currentValue, as: UInt8.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: UInt16.Type) -> UInt16 {
        let decoded = decoder.unbox(currentValue, as: UInt16.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: UInt32.Type) -> UInt32 {
        let decoded = decoder.unbox(currentValue, as: UInt32.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: UInt64.Type) -> UInt64 {
        let decoded = decoder.unbox(currentValue, as: UInt64.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: Int8.Type) -> Int8 {
        let decoded = decoder.unbox(currentValue, as: Int8.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: Int16.Type) -> Int16 {
        let decoded = decoder.unbox(currentValue, as: Int16.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: Int32.Type) -> Int32 {
        let decoded = decoder.unbox(currentValue, as: Int32.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: Int64.Type) -> Int64 {
        let decoded = decoder.unbox(currentValue, as: Int64.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: Bool.Type) -> Bool {
        let decoded = decoder.unbox(currentValue, as: Bool.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: String.Type) -> String {
        let decoded = decoder.unbox(currentValue, as: String.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: Double.Type) -> Double {
        let decoded = decoder.unbox(currentValue, as: Double.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: Float.Type) -> Float {
        let decoded = decoder.unbox(currentValue, as: Float.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: Int.Type) -> Int {
        let decoded = decoder.unbox(currentValue, as: Int.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    public func decode(_ type: UInt.Type) -> UInt {
        let decoded = decoder.unbox(currentValue, as: UInt.self)

        currentValue = JNTDocumentNextArrayElement(currentValue, &isAtEnd)

        currentIndex += 1
        return decoded
    }

    // End
}

private final class JSONKeyedDecoder<K : CodingKey> : KeyedDecodingContainerProtocol {
    var codingPath: [CodingKey] {
        return decoder.codingPath
    }

    unowned(unsafe) private let decoder: __JSONDecoder

    var currentIndex: Int = 0

    typealias Key = K

    var value: UnsafeRawPointer

    fileprivate init(decoder: __JSONDecoder, value: UnsafeRawPointer) {
        self.value = value
        self.decoder = decoder
    }

    var allKeys: [Key] {
        return []//todo: self.container.keys.compactMap { Key(stringValue: $0) }
    }

    func contains(_ key: K) -> Bool {
        let adjustedKey: String
        switch decoder.keyDecodingStrategy {
        case .convertFromSnakeCase:
            fallthrough
        case .useDefaultKeys:
            adjustedKey = key.stringValue
        case .custom(let closure):
            adjustedKey = closure(decoder.containers.codingKeys).stringValue
        }
        return adjustedKey.withCString { pointer in
            return JNTDocumentContains(value, pointer, decoder.caseConversion)
        }
    }

    private func fetchValue(keyPointer: UnsafePointer<Int8>) -> UnsafeRawPointer {
        return JNTDocumentFetchValue(value, keyPointer, decoder.caseConversion)
    }

    func decodeNil(forKey key: K) throws -> Bool {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return JNTDocumentDecodeNil(subValue)
    }

    // KeyedBegin
    fileprivate func decode(_ type: UInt8.Type, forKey key: K) -> UInt8 {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt8.self)
    }

    fileprivate func decode(_ type: UInt16.Type, forKey key: K) -> UInt16 {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt16.self)
    }

    fileprivate func decode(_ type: UInt32.Type, forKey key: K) -> UInt32 {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt32.self)
    }

    fileprivate func decode(_ type: UInt64.Type, forKey key: K) -> UInt64 {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt64.self)
    }

    fileprivate func decode(_ type: Int8.Type, forKey key: K) -> Int8 {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int8.self)
    }

    fileprivate func decode(_ type: Int16.Type, forKey key: K) -> Int16 {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int16.self)
    }

    fileprivate func decode(_ type: Int32.Type, forKey key: K) -> Int32 {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int32.self)
    }

    fileprivate func decode(_ type: Int64.Type, forKey key: K) -> Int64 {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int64.self)
    }

    fileprivate func decode(_ type: Bool.Type, forKey key: K) -> Bool {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Bool.self)
    }

    fileprivate func decode(_ type: String.Type, forKey key: K) -> String {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: String.self)
    }

    fileprivate func decode(_ type: Double.Type, forKey key: K) -> Double {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Double.self)
    }

    fileprivate func decode(_ type: Float.Type, forKey key: K) -> Float {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Float.self)
    }

    fileprivate func decode(_ type: Int.Type, forKey key: K) -> Int {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int.self)
    }

    fileprivate func decode(_ type: UInt.Type, forKey key: K) -> UInt {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt.self)
    }

    fileprivate func decode<T : Decodable>(_ type: T.Type, forKey key: K) throws -> T {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: T.self, nextPathComponent: key)
    }
    // End

    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        fatalError()
    }

    func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        fatalError()
    }

    func superDecoder() throws -> Decoder {
        fatalError()
    }

    func superDecoder(forKey key: K) throws -> Decoder {
        fatalError()
    }
}

extension __JSONDecoder : SingleValueDecodingContainer {
    func decodeNil() -> Bool {
        return JNTDocumentDecodeNil(containers.topContainer)
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        return try unbox(containers.topContainer, as: T.self, nextPathComponent: nil)
    }

    // SingleValueBegin
    public func decode(_ type: UInt8.Type) -> UInt8 {
        return unbox(value, as: UInt8.self)
    }

    public func decode(_ type: UInt16.Type) -> UInt16 {
        return unbox(value, as: UInt16.self)
    }

    public func decode(_ type: UInt32.Type) -> UInt32 {
        return unbox(value, as: UInt32.self)
    }

    public func decode(_ type: UInt64.Type) -> UInt64 {
        return unbox(value, as: UInt64.self)
    }

    public func decode(_ type: Int8.Type) -> Int8 {
        return unbox(value, as: Int8.self)
    }

    public func decode(_ type: Int16.Type) -> Int16 {
        return unbox(value, as: Int16.self)
    }

    public func decode(_ type: Int32.Type) -> Int32 {
        return unbox(value, as: Int32.self)
    }

    public func decode(_ type: Int64.Type) -> Int64 {
        return unbox(value, as: Int64.self)
    }

    public func decode(_ type: Bool.Type) -> Bool {
        return unbox(value, as: Bool.self)
    }

    public func decode(_ type: String.Type) -> String {
        return unbox(value, as: String.self)
    }

    public func decode(_ type: Double.Type) -> Double {
        return unbox(value, as: Double.self)
    }

    public func decode(_ type: Float.Type) -> Float {
        return unbox(value, as: Float.self)
    }

    public func decode(_ type: Int.Type) -> Int {
        return unbox(value, as: Int.self)
    }

    public func decode(_ type: UInt.Type) -> UInt {
        return unbox(value, as: UInt.self)
    }

    // End
}

private func _newConvertToSnakeCase(_ stringKey: inout String) -> String {
    return stringKey.withCString { ptr in
        return String(cString: JNTSnakeCaseFromCamel(ptr))
    }
}

private func _convertToSnakeCase(_ stringKey: String) -> String {
    guard !stringKey.isEmpty else { return stringKey }

    var words : [Range<String.Index>] = []
    // The general idea of this algorithm is to split words on transition from lower to upper case, then on transition of >1 upper case characters to lowercase
    //
    // myProperty -> my_property
    // myURLProperty -> my_url_property
    //
    // We assume, per Swift naming conventions, that the first character of the key is lowercase.
    var wordStart = stringKey.startIndex
    var searchRange = stringKey.index(after: wordStart)..<stringKey.endIndex

    // Find next uppercase character
    while let upperCaseRange = stringKey.rangeOfCharacter(from: CharacterSet.uppercaseLetters, options: [], range: searchRange) {
        let untilUpperCase = wordStart..<upperCaseRange.lowerBound
        words.append(untilUpperCase)

        // Find next lowercase character
        searchRange = upperCaseRange.lowerBound..<searchRange.upperBound
        guard let lowerCaseRange = stringKey.rangeOfCharacter(from: CharacterSet.lowercaseLetters, options: [], range: searchRange) else {
            // There are no more lower case letters. Just end here.
            wordStart = searchRange.lowerBound
            break
        }

        // Is the next lowercase letter more than 1 after the uppercase? If so, we encountered a group of uppercase letters that we should treat as its own word
        let nextCharacterAfterCapital = stringKey.index(after: upperCaseRange.lowerBound)
        if lowerCaseRange.lowerBound == nextCharacterAfterCapital {
            // The next character after capital is a lower case character and therefore not a word boundary.
            // Continue searching for the next upper case for the boundary.
            wordStart = upperCaseRange.lowerBound
        } else {
            // There was a range of >1 capital letters. Turn those into a word, stopping at the capital before the lower case character.
            let beforeLowerIndex = stringKey.index(before: lowerCaseRange.lowerBound)
            words.append(upperCaseRange.lowerBound..<beforeLowerIndex)

            // Next word starts at the capital before the lowercase we just found
            wordStart = beforeLowerIndex
        }
        searchRange = lowerCaseRange.upperBound..<searchRange.upperBound
    }
    words.append(wordStart..<searchRange.upperBound)
    let result = words.map({ (range) in
        return stringKey[range].lowercased()
    }).joined(separator: "_")
    return result
}

// todo: SwiftPM Swift 5.1? runs on mac?
