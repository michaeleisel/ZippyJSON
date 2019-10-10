// Copyright (c) 2018 Michael Eisel. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Note that this class is not thread-safe
@interface JJLISO8601DateFormatter : NSFormatter <NSCoding>

@property (null_resettable, copy) NSTimeZone *timeZone;  // The default time zone is GMT.

@property NSISO8601DateFormatOptions formatOptions;

/* This init method creates a formatter object set to the GMT time zone and preconfigured with the RFC 3339 standard format ("yyyy-MM-dd'T'HH:mm:ssXXXXX") using the following options:
 NSISO8601DateFormatWithInternetDateTime | NSISO8601DateFormatWithDashSeparatorInDate | NSISO8601DateFormatWithColonSeparatorInTime | NSISO8601DateFormatWithColonSeparatorInTimeZone
 */
- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (NSString *)stringFromDate:(NSDate *)date;
- (nullable NSDate *)dateFromString:(NSString *)string;

+ (NSString *)stringFromDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone formatOptions:(NSISO8601DateFormatOptions)formatOptions;

BOOL JJLIsValidFormatOptions(NSISO8601DateFormatOptions formatOptions);

@end

NS_ASSUME_NONNULL_END
