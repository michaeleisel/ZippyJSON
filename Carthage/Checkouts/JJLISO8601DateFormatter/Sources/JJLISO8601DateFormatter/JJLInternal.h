//Copyright (c) 2018 Michael Eisel. All rights reserved.

#import <time.h>
#import "Vendor/tzdb/tzfile__.h"

// This C file does the heavy lifting for the libraries. This is to allow maximum portability in the future, in case we want to make a Swift version, a version that can run on Linux, etc.

static const int32_t kJJLMaxDateLength = 50; // Extra to be safe

void JJLFillBufferForDate(char *buffer, double timeInSeconds, CFISO8601DateFormatOptions options, timezone_t timeZone, double fallbackOffset);
double JJLTimeIntervalForString(const char *string, int32_t length, CFISO8601DateFormatOptions options, timezone_t timeZone, bool *errorOccurred);
void JJLPerformInitialSetup(void);
