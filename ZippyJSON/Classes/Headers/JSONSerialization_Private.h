//Copyright (c) 2018 Michael Eisel. All rights reserved.

//#import "rapidjson/document.h"

#import <Foundation/Foundation.h>
#import "JSONSerialization.h"

CF_EXTERN_C_BEGIN

typedef CF_ENUM(size_t, JNTDecodingErrorType) {
    JNTDecodingErrorTypeNone,
    JNTDecodingErrorTypeKeyDoesNotExist,
    JNTDecodingErrorTypeValueDoesNotExist,
    JNTDecodingErrorTypeNumberDoesNotFit,
    JNTDecodingErrorTypeWrongType,
};

typedef struct {
    const char *description;
    JNTDecodingErrorType type;
} JNTDecodingError;

BOOL JNTDocumentContains(const void *valueAsVoid, const char *key, bool convertCase);
bool JNTIsString(const void *valueAsVoid);
BOOL JNTDocumentDecodeNil(const void *documentPtr);
void JNTReleaseDocument(const void *document);
const void *JNTDocumentFromJSON(const void *data, NSInteger length);
const void *JNTDocumentDecodeArrayStart(const void *value);
const void *JNTDocumentNextArrayElement(const void *iterator);
void JNTUpdateFloatingPointStrings(const char *posInfString, const char *negInfString, const char *nanString);
bool JNTAcquireThreadLock();
void JNTReleaseThreadLock();
bool JNTIsAtEnd(const void *valueAsVoid);

const void *JNTDocumentFetchValue(const void *value, const char *key, bool convertCase);

double JNTDocumentDecode__Double(const void *value);
float JNTDocumentDecode__Float(const void *value);
NSDate *JNTDocumentDecode__Date(const void *value);
void *JNTDocumentDecode__Data(const void *value, int32_t *outLength);
void JNTRunTests();
NSDecimalNumber *JNTDocumentDecode__Decimal(const void *value);

NSInteger JNTDocumentGetArrayCount(const void *value);

@interface JNTCodingPath : NSObject

- (instancetype)initWithStringValue:(NSString *)stringValue intValue:(NSInteger)intValue;

@property (strong, nonatomic) NSString *stringValue;
@property (nonatomic) NSInteger intValue;

@end

JNTDecodingError *JNTFetchAndResetError();

NSArray <JNTCodingPath *> *JNTComputeCodingPath(const void * const *containers, NSInteger count);

#define DECODE_KEYED_HEADER(A, B, C, D) DECODE_KEYED_HEADER_NAMED(A, B, C, D, A)

#define DECODE_KEYED_HEADER_NAMED(A, B, C, D, E) \
A JNTDocumentDecodeKeyed__##E(const void *value, const char *key);

#define DECODE_HEADER(A, B, C, D) DECODE_HEADER_NAMED(A, B, C, D, A)

#define DECODE_HEADER_NAMED(A, B, C, D, E) \
A JNTDocumentDecode__##E(const void *value);

#define ENUMERATE(F) \
F##_NAMED(bool, bool, Bool, Bool, Bool); \
F(int8_t, int64_t, Int64, Int64); \
F(uint8_t, int64_t, Int64, Int64); \
F(int16_t, int64_t, Int64, Int64); \
F(uint16_t, int64_t, Int64, Int64); \
F(int32_t, int64_t, Int64, Int64); \
F(uint32_t, int64_t, Int64, Int64); \
F(int64_t, int64_t, Int64, Int64); \
F(uint64_t, uint64_t, Uint64, Uint64); \
F##_NAMED(const char *, const char *, String, String, String); \
F##_NAMED(NSInteger, NSInteger, Size, Size, Int); \
F##_NAMED(NSUInteger, NSUInteger, USize, USize, UInt);

ENUMERATE(DECODE_HEADER);
// ENUMERATE(DECODE_KEYED_HEADER);
//BOOL JNTDocumentContains(Document document, const char *key);
//BOOL JNTDocumentContains(void * document, const char *key);

CF_EXTERN_C_END
