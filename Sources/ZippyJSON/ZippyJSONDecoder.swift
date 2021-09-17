//Copyright (c) 2018 Michael Eisel. All rights reserved.

import Foundation
import ZippyJSONCFamily
import JJLISO8601DateFormatter

#if canImport(Combine)
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension ZippyJSONDecoder: TopLevelDecoder {
    public typealias Input = Data
}
#endif

typealias Value = JNTDecoderStorage

fileprivate var _iso8601Formatter: JJLISO8601DateFormatter = {
    let formatter = JJLISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    return formatter
}()

internal protocol DictionaryWithoutKeyConversion {
    static var elementType: Decodable.Type { get }
}

extension Dictionary : DictionaryWithoutKeyConversion where Key == String, Value: Decodable {
    static var elementType: Decodable.Type { return Value.self }
}

func isOnSimulator() -> Bool {
  #if targetEnvironment(simulator)
  return true
  #else
  return false
  #endif
}

private final class Weak<T: AnyObject> {
    weak var value: T?
    init(value: T) {
        self.value = value
    }
}

public final class ZippyJSONDecoder {
    @available(*, deprecated, message: "This flag is deprecated because full-precision parsing speed is now on par with imprecise, so it will just always use full-precision")
    public var zjd_fullPrecisionFloatParsing = true
    private static var _zjd_suppressWarnings: Bool = false
    public static var zjd_suppressWarnings: Bool {
        get {
            return _zjd_suppressWarnings
        }
        set {
            objc_sync_enter(self)
            defer { objc_sync_exit(self) }
            _zjd_suppressWarnings = newValue
        }
    }

    private func createContext(string: UnsafePointer<Int8>, length: Int) -> ContextPointer {
        switch nonConformingFloatDecodingStrategy {
        case .convertFromString(let pI, let nI, let nan):
            return pI.withCString { pIP in
                nI.withCString { nIP in
                    nan.withCString { nanP in
                        return JNTCreateContext(string, UInt32(length), nIP, pIP, nanP, true)
                    }
                }
            }
        case .throw:
            return JNTCreateContext(string, UInt32(length), "", "", "", false)
        }
    }

    public func decode<T : Decodable>(_ type: T.Type, from data: Data) throws -> T {
        if isOnSimulator() && !JNTHasVectorExtensions() {
          return try decodeWithAppleDecoder(type, from: data, reason: "This library was not compiled with the necessary vector extensions (this is likely because you're using SwiftPM + the simulator, and is due to limitations with SwiftPM. This does not apply to real devices.)")
        }
        if case .custom(_) = keyDecodingStrategy {
            return try decodeWithAppleDecoder(type, from: data, reason: "Custom key decoding is not supported, because it is uncommon and makes efficient parsing difficult")
        }
        return try data.withUnsafeBytes { (bytes) -> T in
            var retryReason: UnsafePointer<CChar>? = nil
            let string = bytes.baseAddress?.assumingMemoryBound(to: Int8.self)
            let context = createContext(string: string!, length: data.count)
            defer {
                JNTReleaseContext(context)
            }
            var success = false
            let value = JNTDocumentFromJSON(context, bytes.baseAddress!, data.count, convertCase, &retryReason, &success)
            if success {
                let decoder = __JSONDecoder(value: value, containers: JSONDecodingStorage(), keyDecodingStrategy: keyDecodingStrategy, dataDecodingStrategy: dataDecodingStrategy, dateDecodingStrategy: dateDecodingStrategy, nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy, userInfo: userInfo)
                defer {
                    for weakManager in decoder.managers {
                        guard let value = weakManager.value else { continue }
                        value.computeActualKeysIfNecessary()
                    }
                }
                if JNTErrorDidOccur(context) {
                    throw swiftErrorFromError(context, decoder: decoder)
                }
                let result = try decoder.unbox(value, as: type)
                
                if JNTErrorDidOccur(context) {
                    throw swiftErrorFromError(context, decoder: decoder)
                }
                return result
            } else {
                // Either the JSON is malformed, or the JSON is OK but it should be redone by apple.
                // If it's malformed, we could return early here, but it simplifies things to have everything do retry.
                // It will also throw Apple's version of the exception if the JSON is malformed, which looks a little
                // nicer.
                let retryReasonString = retryReason.map { String(utf8String: $0)! } ?? ""
                return try decodeWithAppleDecoder(type, from: data, reason: retryReasonString)
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
        if !ZippyJSONDecoder.zjd_suppressWarnings {
            print("[ZippyJSONDecoder] Warning: fell back to using Apple's JSONDecoder. Reason: \(reason ?? ""). This message will only be printed the first time this happens. To suppress this message entirely, for all reasons, use `ZippyJSONDecoder.zjd_suppressWarnings = true")
            ZippyJSONDecoder.zjd_suppressWarnings = true
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
            return Foundation.JSONDecoder.DateDecodingStrategy.iso8601
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

fileprivate func swiftErrorFromError(_ context: ContextPointer, decoder: __JSONDecoder) -> Error {
    var error: Error? = nil
    JNTProcessError(context) { (description, type, value, key) in
        let debugDescription = String(utf8String: description!)!
        let path = computeCodingPath(value: value, decoder: decoder)
        let keyString = key.map { String(utf8String: $0) ?? "" } ?? ""
        let key = JSONKey(stringValue: keyString)!
        let instanceType = Any.self
        switch type {
        case .wrongType:
            error = DecodingError.typeMismatch(instanceType, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
        case .numberDoesNotFit:
            error = DecodingError.dataCorrupted(DecodingError.Context(codingPath: path, debugDescription:debugDescription))
        case .keyDoesNotExist:
            error = DecodingError.keyNotFound(key, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
        case .valueDoesNotExist:
            error = DecodingError.valueNotFound(instanceType, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
        case .jsonParsingFailed:
            error = DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: debugDescription))
        case .none:
            fallthrough
        @unknown default:
            break
        }
    }
    return error ?? NSError(domain: "", code: 0, userInfo: [:])
}

final private class JSONDecodingStorage {
    private(set) fileprivate var containers: [Value] = []

    fileprivate init() {
    }
    
    fileprivate func createCopy() -> JSONDecodingStorage {
        let copy = JSONDecodingStorage()
        copy.containers = containers
        return copy
    }

    fileprivate var topContainer: Value {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        return self.containers.last!
    }

    fileprivate func push(container: Value) {
        self.containers.append(container)
    }

    fileprivate func popContainer() {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        self.containers.removeLast()
    }
}

@inline(__always) private func computeCodingPath(value: Value, decoder: __JSONDecoder) -> [LazyJSONKey] {
    let size = JNTGetDepth(value)
    let manager = LazyJSONKeyManager.createManager(value: value, decoder: decoder, estimatedSize: size)
    var codingPath: [LazyJSONKey] = []
    codingPath.reserveCapacity(size)
    for i in 0..<size {
        let jsonKey = LazyJSONKey(index: i, manager: manager)
        codingPath.append(jsonKey)
    }
    return codingPath
}

private func computeCodingPathInternal(value: Value) -> [JSONKey] {
    return JNTDocumentCodingPath(value).compactMap { element -> JSONKey? in
        if let index = element as? NSNumber {
            return JSONKey(index: index.intValue)
        } else if let key = element as? NSString {
            return JSONKey(stringValue: String(key))
        }
        return nil // Wouldn't happen
    }
}

// Wrapper and AnyWrapper allow for isKnownUniquelyReferenced to work
private protocol AnyWrapper: AnyObject {
}

extension Wrapper: AnyWrapper {
}

final private class Wrapper<K: CodingKey> {
    var decoder: JSONKeyedDecoder<K>
    init(decoder: JSONKeyedDecoder<K>) {
        self.decoder = decoder
    }
}

final private class __JSONDecoder: Decoder {
    var errorType: Any.Type? = nil
    var userInfo: [CodingUserInfoKey : Any]
    fileprivate var managers: [Weak<LazyJSONKeyManager>] = []
    var codingPath: [CodingKey] {
        return computeCodingPath(value: containers.topContainer, decoder: self)
    }
    let value: Value
    let keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy
    let convertToCamel: Bool
    let dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy
    let dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy
    let nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy
    var swiftError: Error?
    let arrayTypeCache = ArrayTypeCache()

    fileprivate var containers: JSONDecodingStorage

    init(value: Value, containers: JSONDecodingStorage, keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy, dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy, dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy, nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy, userInfo: [CodingUserInfoKey : Any]) {
        self.value = value
        self.containers = containers
        self.keyDecodingStrategy = keyDecodingStrategy
        self.userInfo = userInfo
        if case .convertFromSnakeCase = keyDecodingStrategy {
            self.convertToCamel = true
        } else {
            self.convertToCamel = false
        }
        self.dataDecodingStrategy = dataDecodingStrategy
        self.dateDecodingStrategy = dateDecodingStrategy
        self.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
    }

    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
		// Disable caching for now
		return KeyedDecodingContainer(try JSONKeyedDecoder<Key>(decoder: self, value: containers.topContainer, convertToCamel: convertToCamel))
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return try JSONUnkeyedDecoder(decoder: self, value: containers.topContainer)
    }

    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        return self
    }

    fileprivate func unboxDecimal(_ value: Value) throws -> Decimal? {
        if JNTDocumentValueIsDouble(value) {
            var length: Int32 = 0
            guard let cString = JNTDocumentDecode__DecimalString(value, &length) else { return nil }
            // Although it's mutable, in practice it won't be mutated
            let mutableCString = UnsafeMutableRawPointer(mutating: cString)
            guard let string = String(bytesNoCopy: mutableCString, length: Int(length),
                                      encoding: .utf8, freeWhenDone: false) else {
                return nil
            }
            return Decimal(string: string)
        } else if JNTDocumentValueIsInteger(value) {
            let number = try unbox(value, as: Int64.self)
            return Decimal(number)
        } else {
            throw DecodingError.typeMismatch(Any.self, DecodingError.Context(codingPath: codingPath, debugDescription: "Expected to decode Decimal but found incorrect type instead"))
        }
    }

    fileprivate func unbox(_ value: Value, as type: Decimal.Type) throws -> Decimal {
        guard let decimal = try unboxDecimal(value) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Invalid Decimal"))
        }
        return decimal
    }

    fileprivate func unbox(_ value: Value, as type: Date.Type) throws -> Date {
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
            let string = try self.unbox(value, as: String.self)
            guard let date = _iso8601Formatter.date(from: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Expected date string to be ISO8601-formatted."))
            }
            return date
        case .formatted(let formatter):
            let string = try self.unbox(value, as: String.self)
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

    fileprivate func unbox(_ value: Value, as type: Data.Type) throws -> Data {
        switch dataDecodingStrategy {
        case .base64:
            let string = try unbox(value, as: String.self)
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

    fileprivate func unbox<T>(_ value: Value, as type: DictionaryWithoutKeyConversion.Type) throws -> T {
        var result = [String : Any]()
        var innerError: Error?
        JNTDocumentForAllKeyValuePairs(value, { key, subValue in
            let keyString = String(cString: key!)
            do {
                result[keyString] = try self.unbox_(subValue, as: type.elementType)
            } catch {
                innerError = error
            }
        })
        try throwErrorIfNecessary(value, decoder: self)
        if let innerError = innerError {
            throw innerError
        }
        if let resultCasted = result as? T {
            return resultCasted
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Bad dictionary"))
        }
    }

    fileprivate func unbox<T : Decodable>(_ value: Value, as type: T.Type) throws -> T {
        return (try unbox_(value, as: type)) as! T
    }

    fileprivate func unbox_(_ value: Value, as type: Decodable.Type) throws -> Any {
        containers.push(container: value)
        defer { containers.popContainer() }
        
        if type == Date.self || type == NSDate.self {
            return try unbox(value, as: Date.self)
        } else if type == Data.self || type == NSData.self {
            return try unbox(value, as: Data.self)
        } else if type == Decimal.self || type == NSDecimalNumber.self {
            return try unbox(value, as: Decimal.self)
        } else if type == URL.self || type == NSURL.self {
            let urlString = try unbox(value, as: String.self)
            guard let url = URL(string: urlString) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath,
                                                                        debugDescription: "Invalid URL string."))
             }
            return url
        } else if let stringKeyedDictType = type as? DictionaryWithoutKeyConversion.Type {
            return try unbox(value, as: stringKeyedDictType)
        } else if let dummy = arrayTypeCache.dummyForType(type) {
            return try dummy.create(value: value, decoder: self)
        } else {
            return try type.init(from: self)
        }
    }
}

extension __JSONDecoder {
    // UnboxBegin
    fileprivate func unbox(_ value: Value, as type: UInt8.Type) throws -> UInt8 {
        let result = JNTDocumentDecode__uint8_t(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: UInt16.Type) throws -> UInt16 {
        let result = JNTDocumentDecode__uint16_t(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: UInt32.Type) throws -> UInt32 {
        let result = JNTDocumentDecode__uint32_t(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: UInt64.Type) throws -> UInt64 {
        let result = JNTDocumentDecode__uint64_t(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int8.Type) throws -> Int8 {
        let result = JNTDocumentDecode__int8_t(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int16.Type) throws -> Int16 {
        let result = JNTDocumentDecode__int16_t(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int32.Type) throws -> Int32 {
        let result = JNTDocumentDecode__int32_t(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int64.Type) throws -> Int64 {
        let result = JNTDocumentDecode__int64_t(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Bool.Type) throws -> Bool {
        let result = JNTDocumentDecode__Bool(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: String.Type) throws -> String {
        let result = JNTDocumentDecode__String(value)
        try throwErrorIfNecessary(value, decoder: self)
        return String(utf8String: result!)!
    }

    fileprivate func unbox(_ value: Value, as type: Double.Type) throws -> Double {
        let result = JNTDocumentDecode__Double(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Float.Type) throws -> Float {
        let result = JNTDocumentDecode__Float(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int.Type) throws -> Int {
        let result = JNTDocumentDecode__Int(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: UInt.Type) throws -> UInt {
        let result = JNTDocumentDecode__UInt(value)
        try throwErrorIfNecessary(value, decoder: self)
        return result
    }

    // End

    fileprivate func unboxNestedUnkeyedContainer(value: Value) throws -> UnkeyedDecodingContainer {
        containers.push(container: value)
        defer {
            containers.popContainer()
        }
        return try JSONUnkeyedDecoder(decoder: self, value: value)
    }

    fileprivate func unboxSuper(_ value: Value) -> Decoder {
        containers.push(container: value)
        defer {
            containers.popContainer()
        }
        return __JSONDecoder(value: value, containers: containers.createCopy(), keyDecodingStrategy: keyDecodingStrategy, dataDecodingStrategy: dataDecodingStrategy, dateDecodingStrategy: dateDecodingStrategy, nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy, userInfo: userInfo)
    }

    fileprivate func unboxNestedContainer<NestedKey>(value: Value, keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        containers.push(container: value)
        defer {
            containers.popContainer()
        }
		return KeyedDecodingContainer(try JSONKeyedDecoder<NestedKey>(decoder: self, value: containers.topContainer, convertToCamel: convertToCamel))
    }
}

private final class LazyJSONKeyManager {
    var actualKeys: [JSONKey]?
    var mutex: pthread_mutex_t = pthread_mutex_t()
    var value: Value
    let estimatedSize: Int
    static let placeholder = JSONKey(stringValue: "", intValue: nil)
    static func createManager(value: Value, decoder: __JSONDecoder, estimatedSize: Int) -> LazyJSONKeyManager {
        let manager = LazyJSONKeyManager(value: value, estimatedSize: estimatedSize)
        decoder.managers.append(Weak(value: manager))
        return manager
    }
    private init(value: Value, estimatedSize: Int) {
        self.value = value
        self.estimatedSize = estimatedSize
        pthread_mutex_init(&mutex, nil)
    }
    deinit {
        pthread_mutex_destroy(&mutex)
    }
    func computeActualKeysIfNecessary() {
        // In theory, the keys with a reference to this manager could've ended up on another thread, so use a lock
        pthread_mutex_lock(&mutex)
        defer {
            pthread_mutex_unlock(&mutex)
        }
        if let _ = actualKeys {
            return
        }
        actualKeys = computeCodingPathInternal(value: value)
    }
    func key(index: Int) -> JSONKey {
        computeActualKeysIfNecessary()
        guard let actualKeys = actualKeys else { return Self.placeholder }
        let computedIndex = index + actualKeys.count - estimatedSize
        guard 0 <= computedIndex && computedIndex < actualKeys.count else { return Self.placeholder }
        return actualKeys[computedIndex]
    }
}

extension LazyJSONKey: CustomStringConvertible {
    var debugDescription: String {
        if stringValue == "" && intValue == nil {
            return ""
        }
        let key = JSONKey(stringValue: stringValue, intValue: intValue)
        return "Lazy" + key.debugDescription
    }
}

private struct LazyJSONKey : CodingKey {
    private let index: Int
    private let manager: LazyJSONKeyManager

    init(index: Int, manager: LazyJSONKeyManager) {
        self.index = index
        self.manager = manager
    }

    public var stringValue: String {
        return manager.key(index: index).stringValue
    }

    public var intValue: Int? {
        return manager.key(index: index).intValue
    }

    init?(stringValue: String) {
        fatalError()
    }

    init?(intValue: Int) {
        fatalError()
    }

    init(stringValue: String, intValue: Int?) {
        fatalError()
    }
}

internal struct JSONKey : CodingKey {
    public var stringValue: String
    public var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }

    init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }

    init(index: Int) {
        self.stringValue = "Index \(index)"
        self.intValue = index
    }

    static let `super` = JSONKey(stringValue: "super")!
}

private struct JSONUnkeyedDecoder : UnkeyedDecodingContainer {
    var currentValue: JNTDecoder
    let root: JNTDecoder
    var count: Int?
    var iterator: JNTArrayIterator
    private let decoder: __JSONDecoder
    var currentIndex: Int
    var isAtEnd: Bool {
        // count is never nil in practice, so the fallback value will never be hit
        currentIndex >= (count ?? 0)
    }

    var codingPath: [CodingKey] {
        return computeCodingPath(value: currentValue, decoder: decoder)
    }

    fileprivate init(decoder: __JSONDecoder, value: Value) throws {
        try JSONUnkeyedDecoder.ensureValueIsArray(value: value, decoder: decoder)
        self.root = value
        self.decoder = decoder
        let count = JNTDocumentGetArrayCount(value)
        self.count = count
        self.iterator = JNTDocumentGetIterator(value)
        self.currentIndex = 0
        self.currentValue = root
    }

    mutating func decodeNil() throws -> Bool {
        currentValue = try valueFromIterator()
        let isNil = JNTDocumentDecodeNil(currentValue)
        if isNil {
            advanceArray()
        }
        return isNil
    }

    mutating func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: type)
        advanceArray()
        return decoded
    }

    mutating func advanceArray() {
        JNTAdvanceIterator(&iterator, root)
        currentIndex += 1
    }

    mutating func valueFromIterator() throws -> JNTDecoder {
        if !isAtEnd {
            return JNTDecoderFromIterator(&iterator, root)
        }
        var path = codingPath
        if let count = count, count > 0 {
            let _ = path.popLast()
        }
        path.append(JSONKey(index: currentIndex))
        throw DecodingError.valueNotFound(Any.self,
                                          DecodingError.Context(codingPath: path,
                                                                debugDescription: "Cannot get next value -- unkeyed container is at end."))
    }

    static func ensureValueIsArray(value: Value, decoder: __JSONDecoder) throws {
        guard JNTDocumentValueIsArray(value) else {
            throw DecodingError.typeMismatch([Any].self, DecodingError.Context(codingPath: computeCodingPath(value: value, decoder: decoder), debugDescription: "Tried to unbox array, but it wasn't an array"))
        }
    }

    mutating public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> {
        currentValue = try valueFromIterator()
        let container = try decoder.unboxNestedContainer(value: currentValue, keyedBy: type)
        advanceArray()
        return container
    }

    mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        currentValue = try valueFromIterator()
        let container = try decoder.unboxNestedUnkeyedContainer(value: currentValue)
        advanceArray()
        return container
    }

    mutating func superDecoder() throws -> Decoder {
        currentValue = try valueFromIterator()
        let container = decoder.unboxSuper(currentValue)
        advanceArray()
        return container
    }

    // UnkeyedBegin
    public mutating func decode(_ type: UInt8.Type) throws -> UInt8 {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: UInt8.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: UInt16.Type) throws -> UInt16 {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: UInt16.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: UInt32.Type) throws -> UInt32 {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: UInt32.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: UInt64.Type) throws -> UInt64 {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: UInt64.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: Int8.Type) throws -> Int8 {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: Int8.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: Int16.Type) throws -> Int16 {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: Int16.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: Int32.Type) throws -> Int32 {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: Int32.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: Int64.Type) throws -> Int64 {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: Int64.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: Bool.Type) throws -> Bool {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: Bool.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: String.Type) throws -> String {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: String.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: Double.Type) throws -> Double {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: Double.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: Float.Type) throws -> Float {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: Float.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: Int.Type) throws -> Int {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: Int.self)
        advanceArray()
        return decoded
    }

    public mutating func decode(_ type: UInt.Type) throws -> UInt {
        currentValue = try valueFromIterator()
        let decoded = try decoder.unbox(currentValue, as: UInt.self)
        advanceArray()
        return decoded
    }

    // End
}

@inline(__always)
private func throwErrorIfNecessary(_ value: Value, decoder: __JSONDecoder) throws {
    guard !JNTDocumentErrorDidOccur(value) else {
        let error = swiftErrorFromError(JNTGetContext(value), decoder: decoder)
        JNTClearError(JNTGetContext(value))
        throw error
    }
}

private final class JSONKeyedDecoder<K : CodingKey> : KeyedDecodingContainerProtocol {
    var codingPath: [CodingKey] {
        return computeCodingPath(value: value, decoder: decoder)
    }

    private let decoder: __JSONDecoder

    typealias Key = K

    var value: Value

    var iterator: JNTDictionaryIterator

    static func ensureValueIsDictionary(value: Value) throws {
        guard JNTDocumentValueIsDictionary(value) else {
            throw DecodingError.typeMismatch([Any].self, DecodingError.Context(codingPath: [], debugDescription: "Tried to unbox dictionary, but it wasn't a dictionary"))
        }
    }

    fileprivate static func setupValue(_ value: Value, decoder: __JSONDecoder, convertToCamel: Bool) throws -> Value {
        try ensureValueIsDictionary(value: value)
        // todo: fix bug where the keys get converted and then used to create a dictionary later
        if (convertToCamel) {
            JNTConvertSnakeToCamel(value)
        }
        return value
    }

    fileprivate init(decoder: __JSONDecoder, value: Value, convertToCamel: Bool) throws {
        try self.value = JSONKeyedDecoder<K>.setupValue(value, decoder: decoder, convertToCamel: convertToCamel)
        self.decoder = decoder
        self.iterator = JNTDocumentGetDictionaryIterator(value)
    }

    var allKeys: [Key] {
        return JNTDocumentAllKeys(value).compactMap { Key(stringValue: $0) }
    }

    func contains(_ key: K) -> Bool {
        return key.stringValue.withCString { pointer in
            return JNTDocumentContains(value, pointer, &iterator)
        }
    }

    private func fetchValue(keyPointer: UnsafePointer<Int8>) throws -> Value {
        let result = JNTDocumentFetchValue(value, keyPointer, &iterator)
        try throwErrorIfNecessary(value, decoder: decoder)
        return result
    }

    func decodeNil(forKey key: K) throws -> Bool {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        let bool = JNTDocumentDecodeNil(subValue)
        try throwErrorIfNecessary(subValue, decoder: decoder)
        return bool
    }

    // KeyedBegin
    fileprivate func decode(_ type: UInt8.Type, forKey key: K) throws -> UInt8 {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: UInt8.self)
    }

    fileprivate func decode(_ type: UInt16.Type, forKey key: K) throws -> UInt16 {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: UInt16.self)
    }

    fileprivate func decode(_ type: UInt32.Type, forKey key: K) throws -> UInt32 {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: UInt32.self)
    }

    fileprivate func decode(_ type: UInt64.Type, forKey key: K) throws -> UInt64 {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: UInt64.self)
    }

    fileprivate func decode(_ type: Int8.Type, forKey key: K) throws -> Int8 {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: Int8.self)
    }

    fileprivate func decode(_ type: Int16.Type, forKey key: K) throws -> Int16 {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: Int16.self)
    }

    fileprivate func decode(_ type: Int32.Type, forKey key: K) throws -> Int32 {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: Int32.self)
    }

    fileprivate func decode(_ type: Int64.Type, forKey key: K) throws -> Int64 {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: Int64.self)
    }

    fileprivate func decode(_ type: Bool.Type, forKey key: K) throws -> Bool {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: Bool.self)
    }

    fileprivate func decode(_ type: String.Type, forKey key: K) throws -> String {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: String.self)
    }

    fileprivate func decode(_ type: Double.Type, forKey key: K) throws -> Double {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: Double.self)
    }

    fileprivate func decode(_ type: Float.Type, forKey key: K) throws -> Float {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: Float.self)
    }

    fileprivate func decode(_ type: Int.Type, forKey key: K) throws -> Int {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: Int.self)
    }

    fileprivate func decode(_ type: UInt.Type, forKey key: K) throws -> UInt {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: UInt.self)
    }

    fileprivate func decode<T : Decodable>(_ type: T.Type, forKey key: K) throws -> T {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: type)
    }
    // End

    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unboxNestedContainer(value: subValue, keyedBy: type)
    }

    func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return try decoder.unboxNestedUnkeyedContainer(value: subValue)
    }

    private func _superDecoder(forKey key: CodingKey) throws -> Decoder {
        let subValue: Value = try key.stringValue.withCString(fetchValue)
        return decoder.unboxSuper(subValue)
    }

    func superDecoder() throws -> Decoder {
        return try _superDecoder(forKey: JSONKey.super)
    }

    func superDecoder(forKey key: Key) throws -> Decoder {
        return try _superDecoder(forKey: key)
    }
}

extension __JSONDecoder : SingleValueDecodingContainer {
    func decodeNil() -> Bool {
        return JNTDocumentDecodeNil(containers.topContainer)
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        return try unbox(containers.topContainer, as: type)
    }

    // SingleValueBegin
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        return try unbox(containers.topContainer, as: UInt8.self)
    }

    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        return try unbox(containers.topContainer, as: UInt16.self)
    }

    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        return try unbox(containers.topContainer, as: UInt32.self)
    }

    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        return try unbox(containers.topContainer, as: UInt64.self)
    }

    public func decode(_ type: Int8.Type) throws -> Int8 {
        return try unbox(containers.topContainer, as: Int8.self)
    }

    public func decode(_ type: Int16.Type) throws -> Int16 {
        return try unbox(containers.topContainer, as: Int16.self)
    }

    public func decode(_ type: Int32.Type) throws -> Int32 {
        return try unbox(containers.topContainer, as: Int32.self)
    }

    public func decode(_ type: Int64.Type) throws -> Int64 {
        return try unbox(containers.topContainer, as: Int64.self)
    }

    public func decode(_ type: Bool.Type) throws -> Bool {
        return try unbox(containers.topContainer, as: Bool.self)
    }

    public func decode(_ type: String.Type) throws -> String {
        return try unbox(containers.topContainer, as: String.self)
    }

    public func decode(_ type: Double.Type) throws -> Double {
        return try unbox(containers.topContainer, as: Double.self)
    }

    public func decode(_ type: Float.Type) throws -> Float {
        return try unbox(containers.topContainer, as: Float.self)
    }

    public func decode(_ type: Int.Type) throws -> Int {
        return try unbox(containers.topContainer, as: Int.self)
    }

    public func decode(_ type: UInt.Type) throws -> UInt {
        return try unbox(containers.topContainer, as: UInt.self)
    }

    // End
}

fileprivate protocol AnyArray: DummyCreatable {
    func create(value: Value, decoder: __JSONDecoder) throws -> Self
}

extension Array: DummyCreatable where Element: Decodable {
    static func dummy() -> Self {
        return []
    }
}

extension Array: AnyArray where Element: Decodable {
    fileprivate func create(value: Value, decoder: __JSONDecoder) throws -> Self {
        let array = try ContiguousArray<Element>().create(value: value, decoder: decoder)
        return Array(array)
    }
}

extension ContiguousArray: DummyCreatable where Element: Decodable {
    static func dummy() -> Self {
        return []
    }
}

extension ContiguousArray: AnyArray where Element: Decodable {
    fileprivate func create(value: Value, decoder: __JSONDecoder) throws -> Self {
        try JSONUnkeyedDecoder.ensureValueIsArray(value: value, decoder: decoder)
        decoder.containers.push(container: value)
        defer { decoder.containers.popContainer() }
        let count = JNTDocumentGetArrayCount(value)

        let root = value
        var iterator = JNTDocumentGetIterator(value)
        var array: ContiguousArray<Element> = ContiguousArray()
        array.reserveCapacity(count)
        if let innerDummy = decoder.arrayTypeCache.dummyForType(Element.self) {
            for _ in 0..<count {
                let currentValue = JNTDecoderFromIterator(&iterator, root)
                let element = try innerDummy.create(value: currentValue, decoder: decoder) as! Element
                array.append(element)
                JNTAdvanceIterator(&iterator, root)
            }
        } else {
            for _ in 0..<count {
                let currentValue = JNTDecoderFromIterator(&iterator, root)
                let element = try decoder.unbox(currentValue, as: Element.self)
                array.append(element)
                JNTAdvanceIterator(&iterator, root)
            }
        }
        return array
    }
}

protocol DummyCreatable {
    static func dummy() -> Self
}

private class ArrayTypeCache {
    private var typeIdToDummy: [ObjectIdentifier: AnyArray] = [:]
    private var nonMatchingTypeIds = Set<ObjectIdentifier>()
    fileprivate func dummyForType(_ type: Decodable.Type) -> AnyArray? {
        let id = ObjectIdentifier(type)
        if nonMatchingTypeIds.contains(id) {
            return nil
        }
        if let dummy = typeIdToDummy[id] {
            return dummy
        }
        if let casted = type as? AnyArray.Type {
            //let dummyCreatable = casted as?
            let dummy = casted.dummy()
            typeIdToDummy[id] = dummy
            return dummy
        } else {
            nonMatchingTypeIds.insert(id)
            return nil
        }
    }
}
