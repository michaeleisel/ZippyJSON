# ZippyJSON
## A much faster version of JSONDecoder
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods compatible](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)](https://cocoapods.com)

## Benchmarks

<img src="misc/chart.svg" width="75%">

These benchmarks were done on an iPhone 8. The results are very similar on MacOS.

## Usage

Because it is drop-in, simply add the library to your project and replace `JSONDecoder` with `ZippyJSONDecoder` anywhere you want to use it. The library is feature-complete, so it will support any use cases you have.

## Why is it so much faster?

- Apple's version first converts the JSON into an `NSDictionary` using `NSJSONSerialization` and then afterwards makes things Swifty. The creation of that intermediate dictionary is expensive.
- ZippyJSON is built largely in C++ (but still with a Swift interface wrapped around it). For the initial parsing (you might call it tokenizing), it uses [simdjson](https://github.com/lemire/simdjson), a very fast library that makes good use of vectorization. Apple, on the other hand, uses entirely [Swift](https://github.com/apple/swift/blob/master/stdlib/public/Darwin/Foundation/JSONEncoder.swift) (aside from the use of `NSJSONSerialization`) which is generally slower.
- There are many specific optimizations in there as well. For example, date parsing for ISO-8601 dates is 10x faster due to using JJLISO8601DateFormatter instead of Apple's date formatter.

So, it's largely due to Apple trying to be elegant and operate at a higher level.

## Stability

ZippyJSON uses all the same unit tests that Apple uses for their JSONDecoder, and then some, so it should generally work. However, it is a new release. Feel free to submit a ticket if you find any issues.

## Future improvements

There are still many places in the code that are ripe for optimization. Feel free to submit a ticket if you have a specific case where you need more performant JSON parsing, and where ZippyJSON is not already 4x faster than Apple's. JSONEncoder and NSJSONSerialization are also promising for optimzation, please chime in if you need one of these improved.

## Installation

### Cocoapods

ZippyJSON is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZippyJSON'
```

### Carthage

To install it, add the following to your Cartfile:
```
github "michaeleisel/ZippyJSON"
```

## Author

Michael Eisel, michael.eisel@gmail.com
