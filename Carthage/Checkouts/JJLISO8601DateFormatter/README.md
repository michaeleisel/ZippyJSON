# JJLISO8601DateFormatter

`JJLISO8601DateFormatter` is a thread-safe, feature complete, drop-in replacement for `NSISO8601DateFormatter` that is 10x or more faster for both conversion to and from dates.

- Date to string: **12x+** faster
- String to date: **10x** faster
- Object creation: **10x** faster

More info on how the benchmark was done is [here](https://github.com/michaeleisel/JJLISO8601DateFormatter#how-is-the-benchmarking-done).

## Usage

Because it is drop-in, you can simply replace the word `NSISO8601DateFormatter` with `JJLISO8601DateFormatter` and add the header include, `#import <JJLISODateFormatter/JJLISODateFormatter.h>`.

## Requirements

- iOS 10.0+
- MacOS 10.13+

## Installation

### Cocoapods
JJLISO8601DateFormatter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JJLISO8601DateFormatter'
```

## FAQ
##### How does this date formatting library stay up-to-date with new changes in time zones?

It uses the time zone files provided by the system, the same ones that POSIX functions like `localtime` use. If it can't find them, it will fall back to using Apple's date formatting libraries.

##### Why is it so much faster?

There's nothing special about the library. It is written in straight-forward C and tries to avoid unnecessary allocations, locking, etc. It uses versions of `mktime` and `localtime` from `tzdb`. A better question is, why is Apple's so much slower? Apple's date formatting classes are built on top of [ICU](http://site.icu-project.org/home), which although reliable, is a fairly slow library. It's hard from a glance to say exactly why, but it seems to have a lot of extra abstraction, needless copying, etc., and in general doesn't prioritize performance as much.

##### Date formatting is [hard](http://yourcalendricalfallacyis.com/). How does this library ensure correctness?

Although date formatting is difficult, this library has an extensive set of unit tests that cover edge cases like:
- All different format options
- All different time zones
- Leap seconds (neither us nor Apple actually handle them)
- Leap days
- Concurrent usage

Things are also easier because, for ISO 8601, we only need to support Gregorian calendar.

##### Is it literally the same for everything?

For nonsensical format options (week of year but no year) and malformed date strings, the behavior is slightly different. But for all intents and purposes, it is the exact same. Feel free to submit a ticket if you find otherwise.

##### Why is the prefix "JJL"?

Because it's easy to type with the left pinky on the shift key.

##### Are there other Apple libraries ripe for optimization?

Yes, there are a lot, the question is which ones are worth optimizing. Feel free to request optimizations for libraries that are causing performance issues for you.

### How is the benchmarking done?

It's done by timing many date to string and string to date conversions across two ranges (15 days before now to 15 days after, from 1970 to now), three time zones, and `NSISO8601DateFormatOptionsWithInternetDateTime | NSISO8601DateFormatWithFractionalSeconds` for the format options. The benchmark code is located in `-viewDidLoad` of the Example project's [view controller](https://github.com/michaeleisel/JJLISO8601DateFormatter/blob/master/Example/JJLISO8601DateFormatterApp/ViewController.m), and you can get nice benchmarking output yourself by running that project. I normally do testing on my iPhone 8, with the occasional double check on other devices. Obviously the numbers can vary.

## Future Improvements and Contribution

Contributors are always welcome. Here are some possible improvements:

- Swift version of the library with no Objective-C code
- Full rewrite of NSDateFormatter (doable but is it worth it?)
- Method that returns a `char *` instead of an `NSString` for going from date to string.
- watchOS and tvOS support

## Author

Michael Eisel, michael.eisel@gmail.com

## License

JJLISO8601DateFormatter is available under the MIT license. See the LICENSE file for more info.
