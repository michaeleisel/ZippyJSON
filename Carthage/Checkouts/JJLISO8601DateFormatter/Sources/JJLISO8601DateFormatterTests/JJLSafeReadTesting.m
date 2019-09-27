//Copyright (c) 2018 Michael Eisel. All rights reserved.

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@interface JJLSafeReadTesting : XCTestCase

@end

@implementation JJLSafeReadTesting

typedef ssize_t (*JJLReadFunction)(int fd, void *buffer, size_t nbytes);

static const char kJJLReadData[] = "12345";
static const char kJJLReadDataLength = sizeof(kJJLReadData);
static ssize_t sTotalAmountRead = 0;
static const int kJJLUnrecoverableError = EIO; // Some arbitrary error that isn't EINTR

static ssize_t JJLNormalRead(int fd, void *buffer, size_t nbytes) {
    if (nbytes + sTotalAmountRead > kJJLReadDataLength) {
        nbytes = kJJLReadDataLength - sTotalAmountRead;
    }
    memcpy(buffer, kJJLReadData + sTotalAmountRead, nbytes);
    sTotalAmountRead += nbytes;
    return nbytes;
}

static ssize_t JJLHalfRead(int fd, void *buffer, size_t nbytes) {
    NSCAssert(kJJLReadDataLength % 2 == 0, @"");
    return JJLNormalRead(fd, buffer, kJJLReadDataLength / 2);
}

static ssize_t JJLErrorRead(int fd, void *buffer, size_t nbytes) {
    errno = kJJLUnrecoverableError;
    return -1;
}

static ssize_t JJLInterruptedRead(int fd, void *buffer, size_t nbytes) {
    errno = EINTR;
    return -1;
}

static NSInteger sReadIndex = 0;
static JJLReadFunction *sReads = NULL;
static NSInteger sReadsLength = 0;

static ssize_t JJLNextRead(int fd, void *buffer, size_t nbytes) {
    NSCAssert(sReadIndex < sReadsLength, @"Went too far");
    ssize_t ret = sReads[sReadIndex](fd, buffer, nbytes);
    sReadIndex++;
    return ret;
}

ssize_t JJLSafeReadInjection(int fd, void *buffer, size_t nbytes, JJLReadFunction readPtr);

- (void)_testWithReads:(JJLReadFunction[])reads readsLength:(NSInteger)readsLength expectedErrno:(int)expectedErrno {
    sReads = reads;
    sReadIndex = 0;
    sReadsLength = readsLength;
    sTotalAmountRead = 0;
    char buffer[kJJLReadDataLength];
    memcpy(buffer, kJJLReadData, kJJLReadDataLength);
    JJLSafeReadInjection(0, buffer, kJJLReadDataLength, JJLNextRead);
    XCTAssert(sReadIndex == sReadsLength);
    if (expectedErrno == 0) {
        XCTAssert(strcmp(buffer, kJJLReadData) == 0);
    } else {
        XCTAssert(errno == expectedErrno);
    }
}

- (void)testSafeRead
{
    [self _testWithReads:(JJLReadFunction[]){JJLHalfRead, JJLHalfRead, JJLNormalRead} readsLength:3 expectedErrno:0];
    [self _testWithReads:(JJLReadFunction[]){JJLNormalRead, JJLNormalRead} readsLength:2 expectedErrno:0];
    [self _testWithReads:(JJLReadFunction[]){JJLHalfRead, JJLInterruptedRead, JJLHalfRead, JJLNormalRead} readsLength:4 expectedErrno:0];
    [self _testWithReads:(JJLReadFunction[]){JJLErrorRead} readsLength:1 expectedErrno:kJJLUnrecoverableError];
    [self _testWithReads:(JJLReadFunction[]){JJLHalfRead, JJLErrorRead} readsLength:2 expectedErrno:kJJLUnrecoverableError];
}

@end
