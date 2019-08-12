//Copyright (c) 2018 Michael Eisel. All rights reserved.

import Foundation
import ZippyJSONCFamily

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
fileprivate var _iso8601Formatter: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    return formatter
}()

internal protocol JSONStringDictionaryEncodableMarker { }

extension Dictionary : JSONStringDictionaryEncodableMarker where Key == String, Value: Encodable { }

internal protocol DictionaryWithoutKeyConversion {
    static var elementType: Decodable.Type { get }
}

extension Dictionary : DictionaryWithoutKeyConversion where Key == String, Value: Decodable {
    static var elementType: Decodable.Type { return Value.self }
}

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

    private static var _ZJDSuppressWarnings: Bool = false
    public static var ZJDSuppressWarnings: Bool {
        get {
            return _ZJDSuppressWarnings
        }
        set {
            objc_sync_enter(self)
            defer { objc_sync_exit(self) }
            _ZJDSuppressWarnings = newValue
        }
    }

    public func decode<T : Decodable>(_ type: T.Type, from data: /*todo: inout*/ Data) throws -> T {
        if case .custom(_) = keyDecodingStrategy {
            return try decodeWithAppleDecoder(type, from: data, reason: "Custom key decoding is not supported, because it is uncommon and makes efficient parsing difficult")
        }
        guard JNTAcquireThreadLock() else {
            return try decodeWithAppleDecoder(type, from: data, reason: "A custom decoder was passed in that runs its own JSON decoding. This is not supported due to additional complexity")
        }
        defer {
            JNTReleaseThreadLock()
        }
        return try data.withUnsafeBytes { (bytes) -> T in
            var retryReason: UnsafePointer<CChar>? = nil
            let value: UnsafeRawPointer? = JNTDocumentFromJSON(bytes.baseAddress!, data.count, convertCase, &retryReason)
            defer {
                JNTReleaseDocument(value)
            }
            let error = JNTError()!
            if let value = value {
                let decoder = __JSONDecoder(value: value, keyDecodingStrategy: keyDecodingStrategy, dataDecodingStrategy: dataDecodingStrategy, dateDecodingStrategy: dateDecodingStrategy, nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy)
                let result = try decoder.unbox(value, as: type)
                
                if let error = decoder.swiftError {
                    throw error
                } else {
                    if error.pointee.type != .none {
                        throw swiftErrorFromError(error.pointee)
                    }
                }
                return result
            } else {
                if error.pointee.type == .none {
                    // The JSON is OK but it should be redone by apple
                    var retryReasonString: String? = nil
                    if let retryReason = retryReason {
                        retryReasonString = String(utf8String: retryReason)!
                    }
                    return try decodeWithAppleDecoder(type, from: data, reason: retryReasonString)
                } else {
                    throw swiftErrorFromError(error.pointee)
                }
            }
        }
    }

    func decodeWithAppleDecoder<T : Decodable>(_ type: T.Type, from data: Data, reason: String?) throws -> T {
        let appleDecoder = Foundation.JSONDecoder()
        appleDecoder.dataDecodingStrategy = ZippyJSONDecoder.convertDataDecodingStrategy(dataDecodingStrategy)
        appleDecoder.dateDecodingStrategy = ZippyJSONDecoder.convertDateDecodingStrategy(dateDecodingStrategy)
        appleDecoder.keyDecodingStrategy = ZippyJSONDecoder.convertKeyDecodingStrategy(keyDecodingStrategy)
        appleDecoder.nonConformingFloatDecodingStrategy = ZippyJSONDecoder.convertNonConformingFloatDecodingStrategy(nonConformingFloatDecodingStrategy)
        appleDecoder.userInfo = userInfo
        if !ZippyJSONDecoder.ZJDSuppressWarnings {
            print("[ZippyJSONDecoder] Warning: fell back to using Apple's JSONDecoder. Reason: \(reason ?? ""). This message will only be printed the first time this happens. To suppress this message entirely, for all reasons, use `ZippyJSONDecoder.ZJDSuppressWarnings = true")
            ZippyJSONDecoder.ZJDSuppressWarnings = true
        }
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

    var convertCase: Bool {
        get {
            switch keyDecodingStrategy {
            case .convertFromSnakeCase:
                return true
            default:
                return false
            }
        }
    }

    public init() {
        keyDecodingStrategy = .useDefaultKeys
        dataDecodingStrategy = .base64
        dateDecodingStrategy = .deferredToDate
        nonConformingFloatDecodingStrategy = .throw
    }
}

fileprivate func swiftErrorFromError(_ error: JNTDecodingError) -> Error {
    let debugDescription = String(utf8String: error.description)!
    let path = error.value.map { computeCodingPath(value: $0) } ?? []
    let keyString = error.key.map { String(utf8String: $0) ?? "" } ?? ""
    let key = JSONKey(stringValue: keyString)!
    let type = Any.self
    switch error.type {
    case .wrongType:
        return DecodingError.typeMismatch(type, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
    case .numberDoesNotFit:
        return DecodingError.dataCorrupted(DecodingError.Context(codingPath: path, debugDescription:debugDescription))
    case .keyDoesNotExist:
        return DecodingError.keyNotFound(key, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
    case .valueDoesNotExist:
        return DecodingError.valueNotFound(type, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
    case .jsonParsingFailed:
        return DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: debugDescription))
    case .none:
        return NSError(domain: "", code: 0, userInfo: [:])
    @unknown default:
        return NSError(domain: "", code: 0, userInfo: [:])
    }
}

final private class JSONDecodingStorage {
    private(set) fileprivate var containers: [UnsafeRawPointer] = []

    fileprivate init() {}

    fileprivate var count: Int {
        return self.containers.count
    }

    fileprivate var topContainer: UnsafeRawPointer! {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        return self.containers.last!
    }

    fileprivate func push(container: UnsafeRawPointer!) {
        self.containers.append(container)
    }

    fileprivate func popContainer() {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        self.containers.removeLast()
    }
}

private func computeCodingPath(value: UnsafeRawPointer!) -> [JSONKey] {
    return JNTDocumentCodingPath(value).compactMap {
        if let index = $0 as? NSNumber {
            return JSONKey(index: index.intValue)
        } else if let key = $0 as? NSString {
            return JSONKey(stringValue: String(key))
        }
        return nil // Wouldn't happen
    }
}

final private class __JSONDecoder: Decoder {
    var errorType: Any.Type? = nil
    var userInfo: [CodingUserInfoKey : Any] = [:]
    var codingPath: [CodingKey] {
        return computeCodingPath(value: containers.topContainer)
    }
    let value: UnsafeRawPointer
    let keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy
    let convertToCamel: Bool
    let dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy
    let dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy
    let nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy
    var swiftError: Error?
    var stringsForFloats: Bool

    fileprivate var containers: JSONDecodingStorage

    init(value: UnsafeRawPointer, keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy, dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy, dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy, nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy) {
        self.value = value
        self.containers = JSONDecodingStorage()
        self.keyDecodingStrategy = keyDecodingStrategy
        if case .convertFromSnakeCase = keyDecodingStrategy {
            self.convertToCamel = true
        } else {
            self.convertToCamel = false
        }
        self.dataDecodingStrategy = dataDecodingStrategy
        self.dateDecodingStrategy = dateDecodingStrategy
        self.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
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
    }

    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        /*guard JNTDocumentValueIsDictionary(containers.topContainer) else {
            fatalError()//todo: a
        }*/
        return KeyedDecodingContainer(JSONKeyedDecoder(decoder: self, value: containers.topContainer, convertToCamel: convertToCamel))
    }

    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return JSONUnkeyedDecoder(decoder: self, startingValue: containers.topContainer)
    }

    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        return self
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Date.Type) throws -> Date {
        switch dateDecodingStrategy {
        case .deferredToDate:
            containers.push(container: value)
            defer { containers.popContainer() }
            return try Date(from: self)

        case .secondsSince1970:
            let double = try unbox(value, as: Double.self)
            return Date(timeIntervalSince1970: double)

        case .millisecondsSince1970:
            let double = try unbox(value, as: Double.self)
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
            containers.push(container: value)
            defer { containers.popContainer() }
            return try closure(self)
        }
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Decimal.Type) -> Decimal {
        return JNTDocumentDecode__Decimal(value)! as Decimal
    }

    fileprivate func unbox(_ value: UnsafeRawPointer!, as type: Data.Type) throws -> Data {
        switch dataDecodingStrategy {
        case .base64:
            let string = unbox(value, as: String.self)
            guard let data = Data(base64Encoded: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Encountered Data is not valid Base64."))
            }
            return data
        case .deferredToData:
            return try Data(from: self)
        case .custom(let closure):
            containers.push(container: value)
            defer { containers.popContainer() }
            return try closure(self)
        }
    }

    fileprivate func error(description: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: description])
    }

    fileprivate func unbox<T>(_ value: UnsafeRawPointer!, as type: DictionaryWithoutKeyConversion.Type) throws -> T {
        // todo: unit test for empty dict
        var result = [String : Any]()
        JNTDocumentForAllKeyValuePairs(value, { key, subValue in
            let keyString = String(cString: key!)
            result[keyString] = try! self.unbox_(subValue!, as: type.elementType)// todo: throw exception instead of crash
        })
        if let resultCasted = result as? T {
            return resultCasted
        } else {
            throw error(description: "Dictionary cast failed") // Cannot happen
        }
    }

    fileprivate func unbox<T : Decodable>(_ value: UnsafeRawPointer!, as type: T.Type) throws -> T {
        return (try unbox_(value, as: type)) as! T
    }

    fileprivate func unbox_(_ value: UnsafeRawPointer!, as type: Decodable.Type) throws -> Any {
        //todo: handle string case separately to reduce container pushing and popping?
        containers.push(container: value)
        defer { containers.popContainer() }
        
        if type == Date.self || type == NSDate.self {
            return try unbox(value, as: Date.self)
        } else if type == Data.self || type == NSData.self {
            return try unbox(value, as: Data.self)
        } else if type == URL.self || type == NSURL.self {
            let urlString = unbox(value, as: String.self)
            guard let url = URL(string: urlString) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath,
                                                                        debugDescription: "Invalid URL string."))
             }
            return url
         } else if type == Decimal.self || type == NSDecimalNumber.self {
            return unbox(value, as: Decimal.self)
         } else if let stringKeyedDictType = type as? DictionaryWithoutKeyConversion.Type {
             return try unbox(value, as: stringKeyedDictType)
         } else {
            return try type.init(from: self)
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

    fileprivate func unboxNestedUnkeyedContainer(value originalValue: UnsafeRawPointer!) -> UnkeyedDecodingContainer {
        containers.push(container: originalValue)
        defer {
            containers.popContainer()
        }
        return JSONUnkeyedDecoder(decoder: self, startingValue: value)
    }

    fileprivate func unboxSuper(_ originalValue: UnsafeRawPointer) -> Decoder {
        containers.push(container: originalValue)
        defer {
            containers.popContainer()
        }
        return __JSONDecoder(value: value, keyDecodingStrategy: keyDecodingStrategy, dataDecodingStrategy: dataDecodingStrategy, dateDecodingStrategy: dateDecodingStrategy, nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy)
    }

    fileprivate func unboxNestedContainer<NestedKey>(value: UnsafeRawPointer, keyedBy type: NestedKey.Type) -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        containers.push(container: value)
        defer {
            containers.popContainer()
        }
        return KeyedDecodingContainer(JSONKeyedDecoder<NestedKey>(decoder: self, value: value, convertToCamel: convertToCamel))
    }
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
        self.decoder = decoder
        self.currentIndex = 0
        if let currentValue = JNTDocumentEnterStructureAndReturnCopy(startingValue) {
            self.currentValue = currentValue
            self.isAtEnd = false
            self.count = nil // todo: slow?
        } else {
            self.currentValue = startingValue
            self.isAtEnd = true
            self.count = 0
        }
    }

    func decodeNil() throws -> Bool {
        let isNil = JNTDocumentDecodeNil(currentValue)
        advanceArray()
        return isNil
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        guard !isAtEnd else {
            throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: codingPath + [JSONKey(index: currentIndex)], debugDescription: "Unkeyed container is at end."))
        }

        let decoded = try decoder.unbox(currentValue, as: T.self)
        advanceArray()
        return decoded
    }

    func advanceArray() {
        JNTDocumentNextArrayElement(currentValue, &isAtEnd)
        currentIndex += 1
    }

    func ensureArrayIsNotAtEnd() throws {
        guard !isAtEnd else {
            throw DecodingError.valueNotFound(Decoder.self,
                                              DecodingError.Context(codingPath: codingPath,
                                                                    debugDescription: "Cannot get next value -- unkeyed container is at end."))
        }
    }

    func ensureCurrentValueIsArray() throws {
        guard JNTDocumentValueIsArray(currentValue) else {
            throw DecodingError.typeMismatch([Any].self, DecodingError.Context(codingPath: codingPath, debugDescription: "Tried to unbox array, but it wasn't an array"))
        }
    }

    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> {
        try ensureArrayIsNotAtEnd()
        try ensureCurrentValueIsArray()
        let container = decoder.unboxNestedContainer(value: currentValue, keyedBy: type)
        advanceArray()
        return container
    }

    func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        try ensureArrayIsNotAtEnd()
        try ensureCurrentValueIsArray()
        let container = decoder.unboxNestedUnkeyedContainer(value: currentValue)
        advanceArray()
        return container
    }

    func superDecoder() throws -> Decoder {
        try ensureArrayIsNotAtEnd()
        try ensureCurrentValueIsArray()
        let container = decoder.unboxSuper(currentValue)
        advanceArray()
        return container
    }

    // UnkeyedBegin
    public func decode(_ type: UInt8.Type) -> UInt8 {
        let decoded = decoder.unbox(currentValue, as: UInt8.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: UInt16.Type) -> UInt16 {
        let decoded = decoder.unbox(currentValue, as: UInt16.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: UInt32.Type) -> UInt32 {
        let decoded = decoder.unbox(currentValue, as: UInt32.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: UInt64.Type) -> UInt64 {
        let decoded = decoder.unbox(currentValue, as: UInt64.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int8.Type) -> Int8 {
        let decoded = decoder.unbox(currentValue, as: Int8.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int16.Type) -> Int16 {
        let decoded = decoder.unbox(currentValue, as: Int16.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int32.Type) -> Int32 {
        let decoded = decoder.unbox(currentValue, as: Int32.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int64.Type) -> Int64 {
        let decoded = decoder.unbox(currentValue, as: Int64.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Bool.Type) -> Bool {
        let decoded = decoder.unbox(currentValue, as: Bool.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: String.Type) -> String {
        let decoded = decoder.unbox(currentValue, as: String.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Double.Type) -> Double {
        let decoded = decoder.unbox(currentValue, as: Double.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Float.Type) -> Float {
        let decoded = decoder.unbox(currentValue, as: Float.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int.Type) -> Int {
        let decoded = decoder.unbox(currentValue, as: Int.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: UInt.Type) -> UInt {
        let decoded = decoder.unbox(currentValue, as: UInt.self)
        advanceArray()
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

    fileprivate init(decoder: __JSONDecoder, value: UnsafeRawPointer, convertToCamel: Bool) {
        if let innerValue = JNTDocumentEnterStructureAndReturnCopy(value) {
            self.value = innerValue
        } else {
            self.value = JNTEmptyDictionaryIterator()
        }
        self.decoder = decoder
        // todo: fix bug where the keys get converted and then used to create a dictionary later
        if (convertToCamel) {
            JNTConvertSnakeToCamel(self.value)
        }
    }

    var allKeys: [Key] {
        return JNTDocumentAllKeys(value).compactMap { Key(stringValue: $0) }
    }

    func contains(_ key: K) -> Bool {
        key.stringValue.withCString { pointer in
            return JNTDocumentContains(value, pointer)
        }
    }

    private func fetchValue(keyPointer: UnsafePointer<Int8>) -> UnsafeRawPointer {
        return JNTDocumentFetchValue(value, keyPointer)
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
        return try decoder.unbox(subValue, as: T.self)
    }
    // End
    // todo: when it tries to create an int it uses the generic decode func for T, and not this one
    // todo:  utf-8 and add tests back in

    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unboxNestedContainer(value: subValue, keyedBy: type)
    }

    func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        return decoder.unboxNestedUnkeyedContainer(value: subValue)
    }

    private func _superDecoder(forKey key: CodingKey) throws -> Decoder {
        let subValue: UnsafeRawPointer! = key.stringValue.withCString(fetchValue)
        // todo: throw exceptions here
        return decoder.unboxSuper(subValue)
    }

    func superDecoder() throws -> Decoder {
        try _superDecoder(forKey: JSONKey.super)
    }

    func superDecoder(forKey key: Key) throws -> Decoder {
        try _superDecoder(forKey: key)
    }
}

extension __JSONDecoder : SingleValueDecodingContainer {
    func decodeNil() -> Bool {
        return JNTDocumentDecodeNil(containers.topContainer)
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        return try unbox(containers.topContainer, as: T.self)
    }

    // SingleValueBegin
    public func decode(_ type: UInt8.Type) -> UInt8 {
        return unbox(containers.topContainer, as: UInt8.self)
    }

    public func decode(_ type: UInt16.Type) -> UInt16 {
        return unbox(containers.topContainer, as: UInt16.self)
    }

    public func decode(_ type: UInt32.Type) -> UInt32 {
        return unbox(containers.topContainer, as: UInt32.self)
    }

    public func decode(_ type: UInt64.Type) -> UInt64 {
        return unbox(containers.topContainer, as: UInt64.self)
    }

    public func decode(_ type: Int8.Type) -> Int8 {
        return unbox(containers.topContainer, as: Int8.self)
    }

    public func decode(_ type: Int16.Type) -> Int16 {
        return unbox(containers.topContainer, as: Int16.self)
    }

    public func decode(_ type: Int32.Type) -> Int32 {
        return unbox(containers.topContainer, as: Int32.self)
    }

    public func decode(_ type: Int64.Type) -> Int64 {
        return unbox(containers.topContainer, as: Int64.self)
    }

    public func decode(_ type: Bool.Type) -> Bool {
        return unbox(containers.topContainer, as: Bool.self)
    }

    public func decode(_ type: String.Type) -> String {
        return unbox(containers.topContainer, as: String.self)
    }

    public func decode(_ type: Double.Type) -> Double {
        return unbox(containers.topContainer, as: Double.self)
    }

    public func decode(_ type: Float.Type) -> Float {
        return unbox(containers.topContainer, as: Float.self)
    }

    public func decode(_ type: Int.Type) -> Int {
        return unbox(containers.topContainer, as: Int.self)
    }

    public func decode(_ type: UInt.Type) -> UInt {
        return unbox(containers.topContainer, as: UInt.self)
    }

    // End
}

public func _convertFromSnakeCase(_ stringKey: String) -> String {
    guard !stringKey.isEmpty else { return stringKey }

    // Find the first non-underscore character
    guard let firstNonUnderscore = stringKey.firstIndex(where: { $0 != "_" }) else {
        // Reached the end without finding an _
        return stringKey
    }

    // Find the last non-underscore character
    var lastNonUnderscore = stringKey.index(before: stringKey.endIndex)
    while lastNonUnderscore > firstNonUnderscore && stringKey[lastNonUnderscore] == "_" {
        stringKey.formIndex(before: &lastNonUnderscore)
    }

    let keyRange = firstNonUnderscore...lastNonUnderscore
    let leadingUnderscoreRange = stringKey.startIndex..<firstNonUnderscore
    let trailingUnderscoreRange = stringKey.index(after: lastNonUnderscore)..<stringKey.endIndex

    var components = stringKey[keyRange].split(separator: "_")
    let joinedString : String
    if components.count == 1 {
        // No underscores in key, leave the word as is - maybe already camel cased
        joinedString = String(stringKey[keyRange])
    } else {
        joinedString = ([components[0].lowercased()] + components[1...].map { $0.capitalized }).joined()
    }

    // Do a cheap isEmpty check before creating and appending potentially empty strings
    let result : String
    if (leadingUnderscoreRange.isEmpty && trailingUnderscoreRange.isEmpty) {
        result = joinedString
    } else if (!leadingUnderscoreRange.isEmpty && !trailingUnderscoreRange.isEmpty) {
        // Both leading and trailing underscores
        result = String(stringKey[leadingUnderscoreRange]) + joinedString + String(stringKey[trailingUnderscoreRange])
    } else if (!leadingUnderscoreRange.isEmpty) {
        // Just leading
        result = String(stringKey[leadingUnderscoreRange]) + joinedString
    } else {
        // Just trailing
        result = joinedString + String(stringKey[trailingUnderscoreRange])
    }
    return result
}


// todo: take ikiga tests
