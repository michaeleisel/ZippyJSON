//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
import Darwin
#elseif os(Linux) || os(FreeBSD) || os(PS4) || os(Android) || os(Cygwin) || os(Haiku)
import Glibc
#elseif os(Windows)
import MSVCRT
import WinSDK
#endif

#if _runtime(_ObjC)
import ObjectiveC
#endif

extension String {
  /// Returns the lines in `self`.
  public var _lines : [String] {
    return _split(separator: "\n")
  }

  /// Splits `self` at occurrences of `separator`.
  public func _split(separator: Unicode.Scalar) -> [String] {
    let scalarSlices = unicodeScalars.split { $0 == separator }
    return scalarSlices.map { String(String.UnicodeScalarView($0)) }
  }
}

public struct SourceLoc {
  public let file: String
  public let line: UInt
  public let comment: String?

  public init(_ file: String, _ line: UInt, comment: String? = nil) {
    self.file = file
    self.line = line
    self.comment = comment
  }

  public func withCurrentLoc(
    _ file: String = #file, line: UInt = #line
  ) -> SourceLocStack {
    return SourceLocStack(self).with(SourceLoc(file, line))
  }
}

public struct SourceLocStack {
  let locs: [SourceLoc]

  public init() {
    locs = []
  }

  public init(_ loc: SourceLoc) {
    locs = [loc]
  }

  init(_locs: [SourceLoc]) {
    locs = _locs
  }

  var isEmpty: Bool {
    return locs.isEmpty
  }

  public func with(_ loc: SourceLoc) -> SourceLocStack {
    var locs = self.locs
    locs.append(loc)
    return SourceLocStack(_locs: locs)
  }

  public func pushIf(
    _ showFrame: Bool, file: String, line: UInt
  ) -> SourceLocStack {
    return showFrame ? self.with(SourceLoc(file, line)) : self
  }

  public func withCurrentLoc(
    file: String = #file, line: UInt = #line
  ) -> SourceLocStack {
    return with(SourceLoc(file, line))
  }

  public func print() {
    let top = locs.first!
    Swift.print("check failed at \(top.file), line \(top.line)")
    _printStackTrace(SourceLocStack(_locs: Array(locs.dropFirst())))
  }
}

fileprivate struct AtomicBool {
    
    private var _value: Bool
    
    init(_ b: Bool) { self._value = b }
    
    func store(_ b: Bool) { b }
    
    func load() -> Bool { return _value }
    
    @discardableResult
    func orAndFetch(_ b: Bool) -> Bool {
        let oldValue = _value
        store(_value || b)
        return oldValue
    }
}

func _printStackTrace(_ stackTrace: SourceLocStack?) {
  guard let s = stackTrace, !s.locs.isEmpty else { return }
  print("stacktrace:")
  for (i, loc) in s.locs.reversed().enumerated() {
    let comment = (loc.comment != nil) ? " ; \(loc.comment!)" : ""
    print("  #\(i): \(loc.file):\(loc.line)\(comment)")
  }
}

fileprivate var _anyExpectFailed = AtomicBool(false)
fileprivate var _seenExpectCrash = AtomicBool(false)

/// Run `body` and expect a failure to happen.
///
/// The check passes iff `body` triggers one or more failures.
public func expectFailure(
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line, invoking body: () -> Void) {
  let startAnyExpectFailed = _anyExpectFailed.load()
  _anyExpectFailed.store(false)
  body()
  let endAnyExpectFailed = _anyExpectFailed.load()
  _anyExpectFailed.store(false)
  expectTrue(
    endAnyExpectFailed, "running `body` should produce an expected failure",
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)
  )
  _anyExpectFailed.orAndFetch(startAnyExpectFailed)
}

public func expectEqual<T : Equatable>(_ expected: T, _ actual: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  expectEqualTest(expected, actual, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
}

public func expectEqual<T : Equatable, U : Equatable>(
  _ expected: (T, U), _ actual: (T, U),
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  expectEqualTest(expected.0, actual.0, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
  expectEqualTest(expected.1, actual.1, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
}

public func expectEqual<T : Equatable, U : Equatable, V : Equatable>(
  _ expected: (T, U, V), _ actual: (T, U, V),
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  expectEqualTest(expected.0, actual.0, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
  expectEqualTest(expected.1, actual.1, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
  expectEqualTest(expected.2, actual.2, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
}

public func expectEqual<T : Equatable, U : Equatable, V : Equatable, W : Equatable>(
  _ expected: (T, U, V, W), _ actual: (T, U, V, W),
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  expectEqualTest(expected.0, actual.0, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
  expectEqualTest(expected.1, actual.1, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
  expectEqualTest(expected.2, actual.2, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
  expectEqualTest(expected.3, actual.3, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 == $1}
}

public func expectEqual(_ expected: String, _ actual: Substring,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !(expected == actual) {
    expectationFailure(
      "expected: \(String(reflecting: expected)) (of type \(String(reflecting: type(of: expected))))\n"
      + "actual: \(String(reflecting: actual)) (of type \(String(reflecting: type(of: actual))))",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)
    )
  }
}
public func expectEqual(_ expected: Substring, _ actual: String,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !(expected == actual) {
    expectationFailure(
      "expected: \(String(reflecting: expected)) (of type \(String(reflecting: type(of: expected))))\n"
      + "actual: \(String(reflecting: actual)) (of type \(String(reflecting: type(of: actual))))",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)
    )
  }
}
public func expectEqual(_ expected: String, _ actual: String,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !(expected == actual) {
    expectationFailure(
      "expected: \(String(reflecting: expected)) (of type \(String(reflecting: type(of: expected))))\n"
      + "actual: \(String(reflecting: actual)) (of type \(String(reflecting: type(of: actual))))",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)
    )
  }
}

public func expectEqualReference(_ expected: AnyObject?, _ actual: AnyObject?,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  expectEqualTest(expected, actual, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) {$0 === $1}
}

public func expectationFailure(
  _ reason: String,
  trace message: String,
  stackTrace: SourceLocStack) {
  _anyExpectFailed.store(true)
  stackTrace.print()
  print(reason, terminator: reason == "" ? "" : "\n")
  print(message, terminator: message == "" ? "" : "\n")
  fatalError() // todo: why is this necessary
}

// Renamed to avoid collision with expectEqual(_, _, TRACE).
// See <rdar://26058520> Generic type constraints incorrectly applied to
// functions with the same name
public func expectEqualTest<T>(
  _ expected: T, _ actual: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line, sameValue equal: (T, T) -> Bool
) {
  if !equal(expected, actual) {
    expectationFailure(
      "expected: \(String(reflecting: expected)) (of type \(String(reflecting: type(of: expected))))\n"
      + "actual: \(String(reflecting: actual)) (of type \(String(reflecting: type(of: actual))))",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)
    )
  }
}

public func expectNotEqual<T : Equatable>(_ expected: T, _ actual: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if expected == actual {
    expectationFailure(
      "unexpected value: \"\(actual)\" (of type \(String(reflecting: type(of: actual))))",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)
    )
  }
}

public func expectOptionalEqual<T>(
  _ expected: T, _ actual: T?,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line, sameValue equal: (T, T) -> Bool
) {
  if (actual == nil) || !equal(expected, actual!) {
    expectationFailure(
      "expected: \"\(expected)\" (of type \(String(reflecting: type(of: expected))))\n"
      + "actual: \"\(actual.debugDescription)\" (of type \(String(reflecting: type(of: actual))))",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectEqual(
  _ expected: Any.Type, _ actual: Any.Type,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  expectEqualTest(expected, actual, message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), showFrame: false) { $0 == $1 }
}

public func expectLT<T : Comparable>(_ lhs: T, _ rhs: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !(lhs < rhs) {
    expectationFailure("\(lhs) < \(rhs)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  } else if !(rhs > lhs) {
    expectationFailure("\(lhs) < \(rhs) (flipped)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectLE<T : Comparable>(_ lhs: T, _ rhs: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !(lhs <= rhs) {
    expectationFailure("\(lhs) <= \(rhs)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  } else if !(rhs >= lhs) {
    expectationFailure("\(lhs) <= \(rhs) (flipped)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectGT<T : Comparable>(_ lhs: T, _ rhs: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !(lhs > rhs) {
    expectationFailure("\(lhs) > \(rhs)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  } else if !(rhs < lhs) {
    expectationFailure("\(lhs) > \(rhs) (flipped)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectGE<T : Comparable>(_ lhs: T, _ rhs: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !(lhs >= rhs) {
    expectationFailure("\(lhs) >= \(rhs)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  } else if !(rhs <= lhs) {
    expectationFailure("\(lhs) >= \(rhs) (flipped)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

extension Range {
  internal func _contains(_ other: Range<Bound>) -> Bool {
    if other.lowerBound < lowerBound { return false }
    if upperBound < other.upperBound { return false }
    return true
  }
}
extension Range {
  internal func _contains(_ other: ClosedRange<Bound>) -> Bool {
    if other.lowerBound < lowerBound { return false }
    if upperBound <= other.upperBound { return false }
    return true
  }
}

public func expectTrapping<Bound>(
  _ point: Bound, in range: Range<Bound>,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  if !range.contains(point) {
    expectationFailure("\(point) in \(range)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
    _trappingExpectationFailedCallback()
  }
}

public func expectTrapping<Bound>(
  _ subRange: Range<Bound>, in range: Range<Bound>,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  if !range._contains(subRange) {
    expectationFailure("\(subRange) in \(range)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
    _trappingExpectationFailedCallback()
  }
}
public func expectTrapping<Bound>(
  _ point: Bound, in range: ClosedRange<Bound>,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  if !range.contains(point) {
    expectationFailure("\(point) in \(range)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
    _trappingExpectationFailedCallback()
  }
}

public func expectTrapping<Bound>(
  _ subRange: ClosedRange<Bound>, in range: Range<Bound>,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  if !range._contains(subRange) {
    expectationFailure("\(subRange) in \(range)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
    _trappingExpectationFailedCallback()
  }
}

extension ClosedRange {
  internal func _contains(_ other: ClosedRange<Bound>) -> Bool {
    if other.lowerBound < lowerBound { return false }
    if upperBound < other.upperBound { return false }
    return true
  }
}

public func expectTrapping<Bound>(
  _ subRange: ClosedRange<Bound>, in range: ClosedRange<Bound>,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  if !range._contains(subRange) {
    expectationFailure("\(subRange) in \(range)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
    _trappingExpectationFailedCallback()
  }
}

public func expectType<T>(_: T.Type, _ x: inout T) {}
public func expectEqualType<T>(_: T.Type, _: T.Type) {}

public func expectSequenceType<X : Sequence>(_ x: X) -> X {
  return x
}

public func expectCollectionType<X : Collection>(
  _ x: X.Type
) {}
public func expectMutableCollectionType<X : MutableCollection>(
  _ x: X.Type
) {}

/// A slice is a `Collection` that when sliced returns an instance of
/// itself.
public func expectSliceType<X : Collection>(
  _ sliceType: X.Type
) where X.SubSequence == X {}

/// A mutable slice is a `MutableCollection` that when sliced returns an
/// instance of itself.
public func expectMutableSliceType<X : MutableCollection>(
  _ mutableSliceType: X.Type
) where X.SubSequence == X {}

/// Check that all associated types of a `Sequence` are what we expect them
/// to be.
public func expectSequenceAssociatedTypes<X : Sequence>(
  sequenceType: X.Type,
  iteratorType: X.Iterator.Type
) {}

/// Check that all associated types of a `Collection` are what we expect them
/// to be.
public func expectCollectionAssociatedTypes<X : Collection>(
  collectionType: X.Type,
  iteratorType: X.Iterator.Type,
  subSequenceType: X.SubSequence.Type,
  indexType: X.Index.Type,
  indicesType: X.Indices.Type
) {}

/// Check that all associated types of a `BidirectionalCollection` are what we
/// expect them to be.
public func expectBidirectionalCollectionAssociatedTypes<X : BidirectionalCollection>(
  collectionType: X.Type,
  iteratorType: X.Iterator.Type,
  subSequenceType: X.SubSequence.Type,
  indexType: X.Index.Type,
  indicesType: X.Indices.Type
) {}

/// Check that all associated types of a `RandomAccessCollection` are what we
/// expect them to be.
public func expectRandomAccessCollectionAssociatedTypes<X : RandomAccessCollection>(
  collectionType: X.Type,
  iteratorType: X.Iterator.Type,
  subSequenceType: X.SubSequence.Type,
  indexType: X.Index.Type,
  indicesType: X.Indices.Type
) {}

public struct AssertionResult : CustomStringConvertible {
  init(isPass: Bool) {
    self._isPass = isPass
  }

  public func withDescription(_ description: String) -> AssertionResult {
    var result = self
    result.description += description
    return result
  }

  let _isPass: Bool

  public var description: String = ""
}

public func assertionSuccess() -> AssertionResult {
  return AssertionResult(isPass: true)
}

public func assertionFailure() -> AssertionResult {
  return AssertionResult(isPass: false)
}

public func expectUnreachable(
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  expectationFailure("this code should not be executed", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
}

public func expectUnreachableCatch(_ error: Error,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  expectationFailure(
    "error should not be thrown: \"\(error)\"", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
}

public func expectTrue(_ actual: AssertionResult,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !actual._isPass {
    expectationFailure(
      "expected: passed assertion\n\(actual.description)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectFalse(_ actual: AssertionResult,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if actual._isPass {
    expectationFailure(
      "expected: failed assertion\n\(actual.description)", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectTrue(_ actual: Bool,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if !actual {
    expectationFailure("expected: true", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectFalse(_ actual: Bool,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if actual {
    expectationFailure("expected: false", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectThrows<ErrorType: Error & Equatable>(
  _ expectedError: ErrorType? = nil, _ test: () throws -> Void,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  do {
    try test()
  } catch let error as ErrorType {
    if let expectedError = expectedError {
      expectEqual(expectedError, error)
    }
  } catch {
    expectationFailure("unexpected error thrown: \"\(error)\"", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectDoesNotThrow(_ test: () throws -> Void,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  do {
    try test()
  } catch {
    expectationFailure("unexpected error thrown: \"\(error)\"", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectNil<T>(_ value: T?,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  if value != nil {
    expectationFailure(
      "expected optional to be nil\nactual: \"\(value!)\"", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

@discardableResult
public func expectNotNil<T>(_ value: T?,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) -> T? {
  if value == nil {
    expectationFailure("expected optional to be non-nil", trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
  return value
}

public func expectCrashLater(withMessage message: String = "") {
  //print("\(_stdlibUnittestStreamPrefix);expectCrash;\(_anyExpectFailed.load())")

  //var stderr = _Stderr()
  //print("\(_stdlibUnittestStreamPrefix);expectCrash;\(message)", to: &stderr)

  _seenExpectCrash.store(true)
}

public func expectCrash(withMessage message: String = "", executing: () -> Void) -> Never {
  expectCrashLater(withMessage: message)
  executing()
  expectUnreachable()
  fatalError()
}

func _defaultTestSuiteFailedCallback() {
  abort()
}

var _testSuiteFailedCallback: () -> Void = _defaultTestSuiteFailedCallback

public func _setTestSuiteFailedCallback(_ callback: @escaping () -> Void) {
  _testSuiteFailedCallback = callback
}

func _defaultTrappingExpectationFailedCallback() {
  abort()
}

var _trappingExpectationFailedCallback: () -> Void
  = _defaultTrappingExpectationFailedCallback

public func _setTrappingExpectationFailedCallback(callback: @escaping () -> Void) {
  _trappingExpectationFailedCallback = callback
}

#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
/*@_silgen_name("getSystemVersionPlistProperty")
func _getSystemVersionPlistPropertyImpl(
  _ propertyName: UnsafePointer<CChar>) -> UnsafePointer<CChar>?*/

func _getSystemVersionPlistProperty(_ propertyName: String) -> String? {
  //let cs = _getSystemVersionPlistPropertyImpl(propertyName)
  return "10.15.0"//cs.map(String.init(cString:))
}
#endif

public enum OSVersion : CustomStringConvertible {
  case osx(major: Int, minor: Int, bugFix: Int)
  case iOS(major: Int, minor: Int, bugFix: Int)
  case tvOS(major: Int, minor: Int, bugFix: Int)
  case watchOS(major: Int, minor: Int, bugFix: Int)
  case iOSSimulator
  case tvOSSimulator
  case watchOSSimulator
  case linux
  case freeBSD
  case android
  case ps4
  case windowsCygnus
  case windows
  case haiku

  public var description: String {
    switch self {
    case .osx(let major, let minor, let bugFix):
      return "OS X \(major).\(minor).\(bugFix)"
    case .iOS(let major, let minor, let bugFix):
      return "iOS \(major).\(minor).\(bugFix)"
    case .tvOS(let major, let minor, let bugFix):
      return "TVOS \(major).\(minor).\(bugFix)"
    case .watchOS(let major, let minor, let bugFix):
      return "watchOS \(major).\(minor).\(bugFix)"
    case .iOSSimulator:
      return "iOSSimulator"
    case .tvOSSimulator:
      return "TVOSSimulator"
    case .watchOSSimulator:
      return "watchOSSimulator"
    case .linux:
      return "Linux"
    case .freeBSD:
      return "FreeBSD"
    case .ps4:
      return "PS4"
    case .android:
      return "Android"
    case .windowsCygnus:
      return "Cygwin"
    case .windows:
      return "Windows"
    case .haiku:
      return "Haiku"
    }
  }
}

func _parseDottedVersion(_ s: String) -> [Int] {
  return Array(s._split(separator: ".").lazy.map { Int($0)! })
}

public func _parseDottedVersionTriple(_ s: String) -> (Int, Int, Int) {
  var array = _parseDottedVersion(s)
  if array.count >= 4 {
    fatalError("unexpected version")
  }
  return (
    array.count >= 1 ? array[0] : 0,
    array.count >= 2 ? array[1] : 0,
    array.count >= 3 ? array[2] : 0)
}

func _getOSVersion() -> OSVersion {
#if os(iOS) && targetEnvironment(simulator)
  // On simulator, the plist file that we try to read turns out to be host's
  // plist file, which indicates OS X.
  //
  // FIXME: how to get the simulator version *without* UIKit?
  return .iOSSimulator
#elseif os(tvOS) && targetEnvironment(simulator)
  return .tvOSSimulator
#elseif os(watchOS) && targetEnvironment(simulator)
  return .watchOSSimulator
#elseif os(Linux)
  return .linux
#elseif os(FreeBSD)
  return .freeBSD
#elseif os(PS4)
  return .ps4
#elseif os(Android)
  return .android
#elseif os(Cygwin)
  return .windowsCygnus
#elseif os(Windows)
  return .windows
#elseif os(Haiku)
  return .haiku
#else
  let productVersion = _getSystemVersionPlistProperty("ProductVersion")!
  let (major, minor, bugFix) = _parseDottedVersionTriple(productVersion)
  #if os(macOS)
  return .osx(major: major, minor: minor, bugFix: bugFix)
  #elseif os(iOS)
  return .iOS(major: major, minor: minor, bugFix: bugFix)
  #elseif os(tvOS)
  return .tvOS(major: major, minor: minor, bugFix: bugFix)
  #elseif os(watchOS)
  return .watchOS(major: major, minor: minor, bugFix: bugFix)
  #else
  fatalError("could not determine OS version")
  #endif
#endif
}

var _runningOSVersion: OSVersion = _getOSVersion()
var _overrideOSVersion: OSVersion?

/// Override the OS version for testing.
public func _setOverrideOSVersion(_ v: OSVersion) {
  _overrideOSVersion = v
}

func _getRunningOSVersion() -> OSVersion {
  // Allow overriding the OS version for testing.
  return _overrideOSVersion ?? _runningOSVersion
}

public enum TestRunPredicate : CustomStringConvertible {
  case custom(() -> Bool, reason: String)

  case always(/*reason:*/ String)
  case never

  case osxAny(/*reason:*/ String)
  case osxMajor(Int, reason: String)
  case osxMinor(Int, Int, reason: String)
  case osxMinorRange(Int, ClosedRange<Int>, reason: String)
  case osxBugFix(Int, Int, Int, reason: String)
  case osxBugFixRange(Int, Int, ClosedRange<Int>, reason: String)

  case iOSAny(/*reason:*/ String)
  case iOSMajor(Int, reason: String)
  case iOSMinor(Int, Int, reason: String)
  case iOSMinorRange(Int, ClosedRange<Int>, reason: String)
  case iOSBugFix(Int, Int, Int, reason: String)
  case iOSBugFixRange(Int, Int, ClosedRange<Int>, reason: String)

  case iOSSimulatorAny(/*reason:*/ String)

  case tvOSAny(/*reason:*/ String)
  case tvOSMajor(Int, reason: String)
  case tvOSMinor(Int, Int, reason: String)
  case tvOSMinorRange(Int, ClosedRange<Int>, reason: String)
  case tvOSBugFix(Int, Int, Int, reason: String)
  case tvOSBugFixRange(Int, Int, ClosedRange<Int>, reason: String)

  case tvOSSimulatorAny(/*reason:*/ String)

  case watchOSAny(/*reason:*/ String)
  case watchOSMajor(Int, reason: String)
  case watchOSMinor(Int, Int, reason: String)
  case watchOSMinorRange(Int, ClosedRange<Int>, reason: String)
  case watchOSBugFix(Int, Int, Int, reason: String)
  case watchOSBugFixRange(Int, Int, ClosedRange<Int>, reason: String)

  case watchOSSimulatorAny(/*reason:*/ String)

  case linuxAny(reason: String)

  case freeBSDAny(reason: String)

  case ps4Any(reason: String)

  case androidAny(reason: String)

  case windowsAny(reason: String)

  case windowsCygnusAny(reason: String)

  case haikuAny(reason: String)

  case objCRuntime(/*reason:*/ String)
  case nativeRuntime(/*reason:*/ String)

  public var description: String {
    switch self {
    case .custom(_, let reason):
      return "Custom(reason: \(reason))"

    case .always(let reason):
      return "Always(reason: \(reason))"
    case .never:
      return ""

    case .osxAny(let reason):
      return "osx(*, reason: \(reason))"
    case .osxMajor(let major, let reason):
      return "osx(\(major).*, reason: \(reason))"
    case .osxMinor(let major, let minor, let reason):
      return "osx(\(major).\(minor), reason: \(reason))"
    case .osxMinorRange(let major, let minorRange, let reason):
      return "osx(\(major).[\(minorRange)], reason: \(reason))"
    case .osxBugFix(let major, let minor, let bugFix, let reason):
      return "osx(\(major).\(minor).\(bugFix), reason: \(reason))"
    case .osxBugFixRange(let major, let minor, let bugFixRange, let reason):
      return "osx(\(major).\(minor).[\(bugFixRange)], reason: \(reason))"

    case .iOSAny(let reason):
      return "iOS(*, reason: \(reason))"
    case .iOSMajor(let major, let reason):
      return "iOS(\(major).*, reason: \(reason))"
    case .iOSMinor(let major, let minor, let reason):
      return "iOS(\(major).\(minor), reason: \(reason))"
    case .iOSMinorRange(let major, let minorRange, let reason):
      return "iOS(\(major).[\(minorRange)], reason: \(reason))"
    case .iOSBugFix(let major, let minor, let bugFix, let reason):
      return "iOS(\(major).\(minor).\(bugFix), reason: \(reason))"
    case .iOSBugFixRange(let major, let minor, let bugFixRange, let reason):
      return "iOS(\(major).\(minor).[\(bugFixRange)], reason: \(reason))"

    case .iOSSimulatorAny(let reason):
      return "iOSSimulatorAny(*, reason: \(reason))"

    case .tvOSAny(let reason):
      return "tvOS(*, reason: \(reason))"
    case .tvOSMajor(let major, let reason):
      return "tvOS(\(major).*, reason: \(reason))"
    case .tvOSMinor(let major, let minor, let reason):
      return "tvOS(\(major).\(minor), reason: \(reason))"
    case .tvOSMinorRange(let major, let minorRange, let reason):
      return "tvOS(\(major).[\(minorRange)], reason: \(reason))"
    case .tvOSBugFix(let major, let minor, let bugFix, let reason):
      return "tvOS(\(major).\(minor).\(bugFix), reason: \(reason))"
    case .tvOSBugFixRange(let major, let minor, let bugFixRange, let reason):
      return "tvOS(\(major).\(minor).[\(bugFixRange)], reason: \(reason))"

    case .tvOSSimulatorAny(let reason):
      return "tvOSSimulatorAny(*, reason: \(reason))"

    case .watchOSAny(let reason):
      return "watchOS(*, reason: \(reason))"
    case .watchOSMajor(let major, let reason):
      return "watchOS(\(major).*, reason: \(reason))"
    case .watchOSMinor(let major, let minor, let reason):
      return "watchOS(\(major).\(minor), reason: \(reason))"
    case .watchOSMinorRange(let major, let minorRange, let reason):
      return "watchOS(\(major).[\(minorRange)], reason: \(reason))"
    case .watchOSBugFix(let major, let minor, let bugFix, let reason):
      return "watchOS(\(major).\(minor).\(bugFix), reason: \(reason))"
    case .watchOSBugFixRange(let major, let minor, let bugFixRange, let reason):
      return "watchOS(\(major).\(minor).[\(bugFixRange)], reason: \(reason))"

    case .watchOSSimulatorAny(let reason):
      return "watchOSSimulatorAny(*, reason: \(reason))"

    case .linuxAny(reason: let reason):
      return "linuxAny(*, reason: \(reason))"

    case .androidAny(reason: let reason):
      return "androidAny(*, reason: \(reason))"

    case .freeBSDAny(reason: let reason):
      return "freeBSDAny(*, reason: \(reason))"

    case .ps4Any(reason: let reason):
      return "ps4Any(*, reason: \(reason))"

    case .windowsAny(reason: let reason):
      return "windowsAny(*, reason: \(reason))"

    case .windowsCygnusAny(reason: let reason):
      return "windowsCygnusAny(*, reason: \(reason))"

    case .haikuAny(reason: let reason):
      return "haikuAny(*, reason: \(reason))"

    case .objCRuntime(let reason):
      return "Objective-C runtime, reason: \(reason))"
    case .nativeRuntime(let reason):
      return "Native runtime (no ObjC), reason: \(reason))"
    }
  }

  public func evaluate() -> Bool {
    switch self {
    case .custom(let predicate, _):
      return predicate()

    case .always:
      return true
    case .never:
      return false

    case .osxAny:
      switch _getRunningOSVersion() {
      case .osx:
        return true
      default:
        return false
      }

    case .osxMajor(let major, _):
      switch _getRunningOSVersion() {
      case .osx(major, _, _):
        return true
      default:
        return false
      }

    case .osxMinor(let major, let minor, _):
      switch _getRunningOSVersion() {
      case .osx(major, minor, _):
        return true
      default:
        return false
      }

    case .osxMinorRange(let major, let minorRange, _):
      switch _getRunningOSVersion() {
      case .osx(major, let runningMinor, _):
        return minorRange.contains(runningMinor)
      default:
        return false
      }

    case .osxBugFix(let major, let minor, let bugFix, _):
      switch _getRunningOSVersion() {
      case .osx(major, minor, bugFix):
        return true
      default:
        return false
      }

    case .osxBugFixRange(let major, let minor, let bugFixRange, _):
      switch _getRunningOSVersion() {
      case .osx(major, minor, let runningBugFix):
        return bugFixRange.contains(runningBugFix)
      default:
        return false
      }

    case .iOSAny:
      switch _getRunningOSVersion() {
      case .iOS:
        return true
      default:
        return false
      }

    case .iOSMajor(let major, _):
      switch _getRunningOSVersion() {
      case .iOS(major, _, _):
        return true
      default:
        return false
      }

    case .iOSMinor(let major, let minor, _):
      switch _getRunningOSVersion() {
      case .iOS(major, minor, _):
        return true
      default:
        return false
      }

    case .iOSMinorRange(let major, let minorRange, _):
      switch _getRunningOSVersion() {
      case .iOS(major, let runningMinor, _):
        return minorRange.contains(runningMinor)
      default:
        return false
      }

    case .iOSBugFix(let major, let minor, let bugFix, _):
      switch _getRunningOSVersion() {
      case .iOS(major, minor, bugFix):
        return true
      default:
        return false
      }

    case .iOSBugFixRange(let major, let minor, let bugFixRange, _):
      switch _getRunningOSVersion() {
      case .iOS(major, minor, let runningBugFix):
        return bugFixRange.contains(runningBugFix)
      default:
        return false
      }

    case .iOSSimulatorAny:
      switch _getRunningOSVersion() {
      case .iOSSimulator:
        return true
      default:
        return false
      }

    case .tvOSAny:
      switch _getRunningOSVersion() {
      case .tvOS:
        return true
      default:
        return false
      }

    case .tvOSMajor(let major, _):
      switch _getRunningOSVersion() {
      case .tvOS(major, _, _):
        return true
      default:
        return false
      }

    case .tvOSMinor(let major, let minor, _):
      switch _getRunningOSVersion() {
      case .tvOS(major, minor, _):
        return true
      default:
        return false
      }

    case .tvOSMinorRange(let major, let minorRange, _):
      switch _getRunningOSVersion() {
      case .tvOS(major, let runningMinor, _):
        return minorRange.contains(runningMinor)
      default:
        return false
      }

    case .tvOSBugFix(let major, let minor, let bugFix, _):
      switch _getRunningOSVersion() {
      case .tvOS(major, minor, bugFix):
        return true
      default:
        return false
      }

    case .tvOSBugFixRange(let major, let minor, let bugFixRange, _):
      switch _getRunningOSVersion() {
      case .tvOS(major, minor, let runningBugFix):
        return bugFixRange.contains(runningBugFix)
      default:
        return false
      }

    case .tvOSSimulatorAny:
      switch _getRunningOSVersion() {
      case .tvOSSimulator:
        return true
      default:
        return false
      }

    case .watchOSAny:
      switch _getRunningOSVersion() {
      case .watchOS:
        return true
      default:
        return false
      }

    case .watchOSMajor(let major, _):
      switch _getRunningOSVersion() {
      case .watchOS(major, _, _):
        return true
      default:
        return false
      }

    case .watchOSMinor(let major, let minor, _):
      switch _getRunningOSVersion() {
      case .watchOS(major, minor, _):
        return true
      default:
        return false
      }

    case .watchOSMinorRange(let major, let minorRange, _):
      switch _getRunningOSVersion() {
      case .watchOS(major, let runningMinor, _):
        return minorRange.contains(runningMinor)
      default:
        return false
      }

    case .watchOSBugFix(let major, let minor, let bugFix, _):
      switch _getRunningOSVersion() {
      case .watchOS(major, minor, bugFix):
        return true
      default:
        return false
      }

    case .watchOSBugFixRange(let major, let minor, let bugFixRange, _):
      switch _getRunningOSVersion() {
      case .watchOS(major, minor, let runningBugFix):
        return bugFixRange.contains(runningBugFix)
      default:
        return false
      }

    case .watchOSSimulatorAny:
      switch _getRunningOSVersion() {
      case .watchOSSimulator:
        return true
      default:
        return false
      }

    case .linuxAny:
      switch _getRunningOSVersion() {
      case .linux:
        return true
      default:
        return false
      }

    case .androidAny:
      switch _getRunningOSVersion() {
      case .android:
        return true
      default:
        return false
      }

    case .freeBSDAny:
      switch _getRunningOSVersion() {
      case .freeBSD:
        return true
      default:
        return false
      }

    case .ps4Any:
      switch _getRunningOSVersion() {
      case .ps4:
        return true
      default:
        return false
      }

    case .windowsAny:
      switch _getRunningOSVersion() {
      case .windowsCygnus:
        return true
      case .windows:
        return true
      default:
        return false
      }

    case .windowsCygnusAny:
      switch _getRunningOSVersion() {
      case .windowsCygnus:
        return true
      default:
        return false
      }

    case .haikuAny:
      switch _getRunningOSVersion() {
      case .haiku:
        return true
      default:
        return false
      }

    case .objCRuntime:
#if _runtime(_ObjC)
      return true
#else
      return false
#endif

    case .nativeRuntime:
#if _runtime(_ObjC)
      return false
#else
      return true
#endif
    }
  }
}

//
// Semantic tests for protocol conformance
//

/// Test that the elements of `instances` satisfy the semantic
/// requirements of `Equatable`, using `oracle` to generate equality
/// expectations from pairs of positions in `instances`.
///
/// - Note: `oracle` is also checked for conformance to the
///   laws.
public func checkEquatable<Instances : Collection>(
  _ instances: Instances,
  oracle: (Instances.Index, Instances.Index) -> Bool,
  allowBrokenTransitivity: Bool = false,

  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where
  Instances.Element : Equatable
{
  let indices = Array(instances.indices)
  _checkEquatableImpl(
    Array(instances),
    oracle: { oracle(indices[$0], indices[$1]) },
    allowBrokenTransitivity: allowBrokenTransitivity,
    message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
}

internal func _checkEquatableImpl<Instance : Equatable>(
  _ instances: [Instance],
  oracle: (Int, Int) -> Bool,
  allowBrokenTransitivity: Bool = false,

  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  // For each index (which corresponds to an instance being tested) track the
  // set of equal instances.
  /*var transitivityScoreboard: [Box<Set<Int>>] =
    instances.indices.map { _ in Box(Set()) }

  // TODO: swift-3-indexing-model: add tests for this function.
  for i in instances.indices {
    let x = instances[i]
    expectTrue(oracle(i, i), "bad oracle: broken reflexivity at index \(i)")

    for j in instances.indices {
      let y = instances[j]

      let predictedXY = oracle(i, j)
      expectEqual(
        predictedXY, oracle(j, i),
        "bad oracle: broken symmetry between indices \(i), \(j)",
        stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

      let isEqualXY = x == y
      expectEqual(
        predictedXY, isEqualXY,
        (predictedXY
           ? "expected equal, found not equal\n"
           : "expected not equal, found equal\n") +
        "lhs (at index \(i)): \(String(reflecting: x))\n" +
        "rhs (at index \(j)): \(String(reflecting: y))",
        stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

      // Not-equal is an inverse of equal.
      expectNotEqual(
        isEqualXY, x != y,
        "lhs (at index \(i)): \(String(reflecting: x))\nrhs (at index \(j)): \(String(reflecting: y))",
        stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

      if !allowBrokenTransitivity {
        // Check transitivity of the predicate represented by the oracle.
        // If we are adding the instance `j` into an equivalence set, check that
        // it is equal to every other instance in the set.
        if predictedXY && i < j && transitivityScoreboard[i].value.insert(j).inserted {
          if transitivityScoreboard[i].value.count == 1 {
            transitivityScoreboard[i].value.insert(i)
          }
          for k in transitivityScoreboard[i].value {
            expectTrue(
              oracle(j, k),
              "bad oracle: broken transitivity at indices \(i), \(j), \(k)",
              stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
              // No need to check equality between actual values, we will check
              // them with the checks above.
          }
          precondition(transitivityScoreboard[j].value.isEmpty)
          transitivityScoreboard[j] = transitivityScoreboard[i]
        }
      }
    }
  }*/
}


public func checkEquatable<T : Equatable>(
  _ expectedEqual: Bool, _ lhs: T, _ rhs: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  checkEquatable(
    [lhs, rhs],
    oracle: { expectedEqual || $0 == $1 }, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line),
    showFrame: false)
}

internal func hash<H: Hashable>(_ value: H, seed: Int? = nil) -> Int {
  var hasher = Hasher()
  if let seed = seed {
    hasher.combine(seed)
  }
  hasher.combine(value)
  return hasher.finalize()
}

/// Test that the elements of `groups` consist of instances that satisfy the
/// semantic requirements of `Hashable`, with each group defining a distinct
/// equivalence class under `==`.
public func checkHashableGroups<Groups: Collection>(
  _ groups: Groups,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where Groups.Element: Collection, Groups.Element.Element: Hashable {
  let instances = groups.flatMap { $0 }
  // groupIndices[i] is the index of the element in groups that contains
  // instances[i].
  let groupIndices =
    zip(0..., groups).flatMap { i, group in group.map { _ in i } }
  func equalityOracle(_ lhs: Int, _ rhs: Int) -> Bool {
    return groupIndices[lhs] == groupIndices[rhs]
  }
  checkHashable(
    instances,
    equalityOracle: equalityOracle,
    hashEqualityOracle: equalityOracle,
    allowBrokenTransitivity: false,
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line),
    showFrame: false)
}

/// Test that the elements of `instances` satisfy the semantic requirements of
/// `Hashable`, using `equalityOracle` to generate equality and hashing
/// expectations from pairs of positions in `instances`.
public func checkHashable<Instances: Collection>(
  _ instances: Instances,
  equalityOracle: (Instances.Index, Instances.Index) -> Bool,
  allowBrokenTransitivity: Bool = false,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where Instances.Element: Hashable {
  checkHashable(
    instances,
    equalityOracle: equalityOracle,
    hashEqualityOracle: equalityOracle,
    allowBrokenTransitivity: allowBrokenTransitivity,
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line),
    showFrame: false)
}

/// Test that the elements of `instances` satisfy the semantic
/// requirements of `Hashable`, using `equalityOracle` to generate
/// equality expectations from pairs of positions in `instances`,
/// and `hashEqualityOracle` to do the same for hashing.
public func checkHashable<Instances: Collection>(
  _ instances: Instances,
  equalityOracle: (Instances.Index, Instances.Index) -> Bool,
  hashEqualityOracle: (Instances.Index, Instances.Index) -> Bool,
  allowBrokenTransitivity: Bool = false,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where
  Instances.Element: Hashable {
  checkEquatable(
    instances,
    oracle: equalityOracle,
    allowBrokenTransitivity: allowBrokenTransitivity,
    message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

  for i in instances.indices {
    let x = instances[i]
    for j in instances.indices {
      let y = instances[j]
      let predicted = hashEqualityOracle(i, j)
      expectEqual(
        predicted, hashEqualityOracle(j, i),
        "bad hash oracle: broken symmetry between indices \(i), \(j)",
        stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
      if x == y {
        expectTrue(
          predicted,
          """
          bad hash oracle: equality must imply hash equality
          lhs (at index \(i)): \(x)
          rhs (at index \(j)): \(y)
          """,
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
      }
      if predicted {
        expectEqual(
          hash(x), hash(y),
          """
          hash(into:) expected to match, found to differ
          lhs (at index \(i)): \(x)
          rhs (at index \(j)): \(y)
          """,
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
        expectEqual(
          x.hashValue, y.hashValue,
          """
          hashValue expected to match, found to differ
          lhs (at index \(i)): \(x)
          rhs (at index \(j)): \(y)
          """,
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
        expectEqual(
          x._rawHashValue(seed: 0), y._rawHashValue(seed: 0),
          """
          _rawHashValue expected to match, found to differ
          lhs (at index \(i)): \(x)
          rhs (at index \(j)): \(y)
          """,
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
      } else {
        // Try a few different seeds; at least one of them should discriminate
        // between the hashes. It is extremely unlikely this check will fail
        // all ten attempts, unless the type's hash encoding is not unique,
        // or unless the hash equality oracle is wrong.
        expectTrue(
          (0..<10).contains { hash(x, seed: $0) != hash(y, seed: $0) },
          """
          hash(into:) expected to differ, found to match
          lhs (at index \(i)): \(x)
          rhs (at index \(j)): \(y)
          """,
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
        expectTrue(
          (0..<10).contains { i in
            x._rawHashValue(seed: i) != y._rawHashValue(seed: i)
          },
          """
          _rawHashValue(seed:) expected to differ, found to match
          lhs (at index \(i)): \(x)
          rhs (at index \(j)): \(y)
          """,
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
      }
    }
  }
}

public func checkHashable<T : Hashable>(
  expectedEqual: Bool, _ lhs: T, _ rhs: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  checkHashable(
    [lhs, rhs], equalityOracle: { expectedEqual || $0 == $1 }, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
}

public enum ExpectedComparisonResult {
  case lt, eq, gt

  public func isLT() -> Bool {
    return self == .lt
  }

  public func isEQ() -> Bool {
    return self == .eq
  }

  public func isGT() -> Bool {
    return self == .gt
  }

  public func isLE() -> Bool {
    return isLT() || isEQ()
  }

  public func isGE() -> Bool {
    return isGT() || isEQ()
  }

  public func isNE() -> Bool {
    return !isEQ()
  }

  public func flip() -> ExpectedComparisonResult {
    switch self {
    case .lt:
      return .gt
    case .eq:
      return .eq
    case .gt:
      return .lt
    }
  }
}

extension ExpectedComparisonResult : CustomStringConvertible {
  public var description: String {
    switch self {
    case .lt:
      return "<"
    case .eq:
      return "=="
    case .gt:
      return ">"
    }
  }
}

/// Test that the elements of `instances` satisfy the semantic
/// requirements of `Comparable`, using `oracle` to generate comparison
/// expectations from pairs of positions in `instances`.
///
/// - Note: `oracle` is also checked for conformance to the
///   laws.
public func checkComparable<Instances : Collection>(
  _ instances: Instances,
  oracle: (Instances.Index, Instances.Index) -> ExpectedComparisonResult,

  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where
  Instances.Element : Comparable {

  // Also checks that equality is consistent with comparison and that
  // the oracle obeys the equality laws
  checkEquatable(instances, oracle: { oracle($0, $1).isEQ() }, message(),
    stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

  for i in instances.indices {
    let x = instances[i]

    expectFalse(
      x < x,
      "found 'x < x'\n" +
      "at index \(i): \(String(reflecting: x))",
        stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

    expectFalse(
      x > x,
      "found 'x > x'\n" +
      "at index \(i): \(String(reflecting: x))",
        stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

    expectTrue(x <= x,
      "found 'x <= x' to be false\n" +
      "at index \(i): \(String(reflecting: x))",
        stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

    expectTrue(x >= x,
      "found 'x >= x' to be false\n" +
      "at index \(i): \(String(reflecting: x))",
        stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

    for j in instances.indices where i != j {
      let y = instances[j]

      let expected = oracle(i, j)

      expectEqual(
        expected.flip(), oracle(j, i),
        "bad oracle: missing antisymmetry: "
        + "(\(String(reflecting: i)), \(String(reflecting: j)))",
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

      expectEqual(expected.isLT(), x < y,
        "x < y\n" +
        "lhs (at index \(i)): \(String(reflecting: x))\n" +
        "rhs (at index \(j)): \(String(reflecting: y))",
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

      expectEqual(expected.isLE(), x <= y,
        "x <= y\n" +
        "lhs (at index \(i)): \(String(reflecting: x))\n" +
        "rhs (at index \(j)): \(String(reflecting: y))",
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

      expectEqual(expected.isGE(), x >= y,
        "x >= y\n" +
        "lhs (at index \(i)): \(String(reflecting: x))\n" +
        "rhs (at index \(j)): \(String(reflecting: y))",
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

      expectEqual(expected.isGT(), x > y,
        "x > y\n" +
        "lhs (at index \(i)): \(String(reflecting: x))\n" +
        "rhs (at index \(j)): \(String(reflecting: y))",
          stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

      for k in instances.indices {
        let expected2 = oracle(j, k)
        if expected == expected2 {
          expectEqual(
            expected, oracle(i, k),
            "bad oracle: missing transitivity "
            + "(\(String(reflecting: i)), \(String(reflecting: j)), "
            + "\(String(reflecting: k)))", stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
        }
      }
    }
  }
}

public func checkComparable<T : Comparable>(
  _ expected: ExpectedComparisonResult, _ lhs: T, _ rhs: T,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  checkComparable(
    [lhs, rhs],
    oracle: { [[ .eq, expected], [ expected.flip(), .eq]][$0][$1] },
    message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
}


/// Test that the elements of `instances` satisfy the semantic
/// requirements of `Strideable`, using `advanceOracle` and
/// 'distanceOracle' to generate expectations about the results of
/// `advanced(by:)` and `distance(to:)` from pairs of positions in
/// `instances` and `strides`.
///
/// - Note: `oracle` is also checked for conformance to the
///   laws.
public func checkStrideable<Instances : Collection, Strides : Collection>(
  _ instances: Instances, strides: Strides,
  distanceOracle:
    (Instances.Index, Instances.Index) -> Strides.Element,
  advanceOracle:
    (Instances.Index, Strides.Index) -> Instances.Element,

  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where
  Instances.Element : Strideable,
  Instances.Element.Stride == Strides.Element {

  checkComparable(
    instances,
    oracle: {
      let d = distanceOracle($1, $0);
      return d < 0 ? .lt : d == 0 ? .eq : .gt
    },
    message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))

  for i in instances.indices {
    let x = instances[i]
    expectEqual(x, x.advanced(by: 0))

    for j in strides.indices {
      let y = strides[j]
      expectEqual(advanceOracle(i, j), x.advanced(by: y))
    }

    for j in instances.indices {
      let y = instances[j]
      expectEqual(distanceOracle(i, j), x.distance(to: y))
    }
  }
}

public func checkLosslessStringConvertible<Instance>(
  _ instances: [Instance]
) where Instance : LosslessStringConvertible & Equatable {
  expectEqualFunctionsForDomain(instances, { $0 }, { Instance(String($0))! })
}

public func nthIndex<C: Collection>(_ x: C, _ n: Int) -> C.Index {
  return x.index(x.startIndex, offsetBy: numericCast(n))
}

public func nth<C: Collection>(_ x: C, _ n: Int) -> C.Element {
  return x[nthIndex(x, n)]
}

public func expectEqualSequence<
  Expected: Sequence,
  Actual: Sequence
>(
  _ expected: Expected, _ actual: Actual,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where
  Expected.Element == Actual.Element,
  Expected.Element : Equatable {

  expectEqualSequence(expected, actual, message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)) { $0 == $1 }
}

public func expectEqualSequence<
  Expected : Sequence,
  Actual : Sequence,
  T : Equatable,
  U : Equatable
>(
  _ expected: Expected, _ actual: Actual,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where
  Expected.Element == Actual.Element,
  Expected.Element == (T, U) {

  expectEqualSequence(
    expected, actual, message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)) {
    (lhs: (T, U), rhs: (T, U)) -> Bool in
    lhs.0 == rhs.0 && lhs.1 == rhs.1
  }
}

public func expectEqualSequence<
  Expected: Sequence,
  Actual: Sequence
>(
  _ expected: Expected, _ actual: Actual,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line,
  sameValue: (Expected.Element, Expected.Element) -> Bool
) where
  Expected.Element == Actual.Element {

  if !expected.elementsEqual(actual, by: sameValue) {
    expectationFailure("expected elements: \"\(expected)\"\n"
      + "actual: \"\(actual)\" (of type \(String(reflecting: type(of: actual))))",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}

public func expectEqualsUnordered<
  Expected : Sequence,
  Actual : Sequence
>(
  _ expected: Expected, _ actual: Actual,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line,
  compare: @escaping (Expected.Element, Expected.Element)
    -> ExpectedComparisonResult
) where
  Expected.Element == Actual.Element {

  let x: [Expected.Element] =
    expected.sorted { compare($0, $1).isLT() }
  let y: [Actual.Element] =
    actual.sorted { compare($0, $1).isLT() }
  expectEqualSequence(
    x, y, message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), sameValue: { compare($0, $1).isEQ() })
}

public func expectEqualsUnordered<
  Expected : Sequence,
  Actual : Sequence
>(
  _ expected: Expected, _ actual: Actual,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where
  Expected.Element == Actual.Element,
  Expected.Element : Comparable {

  expectEqualsUnordered(expected, actual, message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line)) {
    $0 < $1 ? .lt : $0 == $1 ? .eq : .gt
  }
}

public func expectEqualsUnordered<T : Comparable>(
  _ expected: [T], _ actual: [T],
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) {
  let x = expected.sorted()
  let y = actual.sorted()
  expectEqualSequence(x, y, message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
}

public func expectEqualsUnordered<T : Strideable>(
  _ expected: Range<T>, _ actual: [T],
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where T.Stride: SignedInteger {
  if expected.count != actual.count {
    expectationFailure("expected elements: \"\(expected)\"\n"
      + "actual: \"\(actual)\" (of type \(String(reflecting: type(of: actual))))",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
  for e in actual {
    if !expected.contains(e) {
      expectationFailure("expected elements: \"\(expected)\"\n"
        + "actual: \"\(actual)\" (of type \(String(reflecting: type(of: actual))))",
        trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
    }
  }
}

/// A nominal type that is equivalent to a tuple of two elements.
///
/// We need a nominal type because we can't add protocol conformances to
/// tuples.
struct Pair<T : Comparable> : Comparable {
  init(_ first: T, _ second: T) {
    self.first = first
    self.second = second
  }

  var first: T
  var second: T
}

func == <T>(lhs: Pair<T>, rhs: Pair<T>) -> Bool {
  return lhs.first == rhs.first && lhs.second == rhs.second
}

func < <T>(lhs: Pair<T>, rhs: Pair<T>) -> Bool {
  return [lhs.first, lhs.second].lexicographicallyPrecedes(
    [rhs.first, rhs.second])
}

public func expectEqualsUnordered<
  Expected : Sequence,
  Actual : Sequence,
  T : Comparable
>(
  _ expected: Expected, _ actual: Actual,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line
) where
  Actual.Element == (key: T, value: T),
  Expected.Element == (T, T) {

  func comparePairLess(_ lhs: (T, T), rhs: (T, T)) -> Bool {
    return [lhs.0, lhs.1].lexicographicallyPrecedes([rhs.0, rhs.1])
  }

  let x: [(T, T)] =
    expected.sorted(by: comparePairLess)
  let y: [(T, T)] =
    actual.map { ($0.0, $0.1) }
      .sorted(by: comparePairLess)

  func comparePairEquals(_ lhs: (T, T), rhs: (key: T, value: T)) -> Bool {
    return lhs.0 == rhs.0 && lhs.1 == rhs.1
  }

  expectEqualSequence(x, y, message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line), sameValue: comparePairEquals)
}

public func expectEqualFunctionsForDomain<ArgumentType, Result : Equatable>(
    _ arguments: [ArgumentType], _ function1: (ArgumentType) -> Result,
    _ function2: (ArgumentType) -> Result
) {
  for a in arguments {
    let expected = function1(a)
    let actual = function2(a)
    expectEqual(expected, actual, "where the argument is: \(a)")
  }
}

public func expectEqualMethodsForDomain<
  SelfType, ArgumentType, Result : Equatable
>(
  _ selfs: [SelfType], _ arguments: [ArgumentType],
  _ function1: (SelfType) -> (ArgumentType) -> Result,
  _ function2: (SelfType) -> (ArgumentType) -> Result
) {
  for s in selfs {
    for a in arguments {
      let expected = function1(s)(a)
      let actual = function2(s)(a)
      expectEqual(
        expected, actual,
        "where the first argument is: \(s)\nand the second argument is: \(a)"
      )
    }
  }
}

/*public func expectEqualUnicodeScalars<S: StringProtocol>(
  _ expected: [UInt32], _ actual: S,
  _ message: @autoclosure () -> String = "",
  stackTrace: SourceLocStack = SourceLocStack(),
  showFrame: Bool = true,
  file: String = #file, line: UInt = #line) {
  let actualUnicodeScalars = Array(
    actual.unicodeScalars.lazy.map { $0.value })

  if !expected.elementsEqual(actualUnicodeScalars) {
    expectationFailure(
      "expected elements: \"\(asHex(expected))\"\n"
      + "actual: \"\(asHex(actualUnicodeScalars))\"",
      trace: message(),
      stackTrace: stackTrace.pushIf(showFrame, file: file, line: line))
  }
}*/
