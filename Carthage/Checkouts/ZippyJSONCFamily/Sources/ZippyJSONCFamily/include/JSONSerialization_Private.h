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
    JNTDecodingErrorTypeJSONParsingFailed,
    JNTDecodingErrorTypeWentPastEndOfArray
};


#ifdef __cplusplus
struct JNTContext;
typedef JNTContext *ContextPointer;
#else
struct ContextDummy {
};
typedef struct ContextDummy *ContextPointer;
#endif

#ifdef __cplusplus
struct JNTDecoder;
typedef JNTDecoder *DecoderPointer;
#else
struct DecoderDummy {
};
typedef struct DecoderDummy *DecoderPointer;
#endif

ContextPointer JNTCreateContext(const char *negInfString, const char *posInfString, const char *nanString);
DecoderPointer JNTDocumentFromJSON(ContextPointer context, const void *data, NSInteger length, bool convertCase, const char * *retryReason, bool fullPrecisionFloatParsing);
BOOL JNTDocumentContains(DecoderPointer iterator, const char *key);
void JNTProcessError(ContextPointer context, void (^block)(const char *description, JNTDecodingErrorType type, DecoderPointer value, const char *key));
bool JNTErrorDidOccur(ContextPointer context);
BOOL JNTDocumentDecodeNil(DecoderPointer documentPtr);
void JNTReleaseContext(ContextPointer context);
DecoderPointer JNTDocumentFromJSON(ContextPointer context, const void *data, NSInteger length, bool convertCase, const char * *retryReason, bool fullPrecisionFloatParsing);
void JNTDocumentNextArrayElement(DecoderPointer iterator, bool *isAtEnd);
void JNTUpdateFloatingPointStrings(const char *posInfString, const char *negInfString, const char *nanString);
bool JNTDocumentValueIsArray(DecoderPointer iterator);
DecoderPointer JNTDocumentEnterStructureAndReturnCopy(DecoderPointer iterator);
bool JNTDocumentValueIsDictionary(DecoderPointer iterator);
NSArray <NSString *> *JNTDocumentAllKeys(DecoderPointer iterator);
NSArray <id> *JNTDocumentCodingPath(DecoderPointer iterator);
void JNTDocumentForAllKeyValuePairs(DecoderPointer iterator, void (^callback)(const char *key, DecoderPointer iterator));
void JNTConvertSnakeToCamel(DecoderPointer iterator);
DecoderPointer JNTEmptyDictionaryDecoder(DecoderPointer decoder);

DecoderPointer JNTDocumentFetchValue(DecoderPointer value, const char *key);

double JNTDocumentDecode__Double(DecoderPointer value);
float JNTDocumentDecode__Float(DecoderPointer value);
NSDate *JNTDocumentDecode__Date(DecoderPointer value);
void *JNTDocumentDecode__Data(DecoderPointer value, int32_t *outLength);
void JNTRunTests();
NSDecimalNumber *JNTDocumentDecode__Decimal(DecoderPointer value);

NSInteger JNTDocumentGetArrayCount(DecoderPointer value);

@interface JNTCodingPath : NSObject

- (instancetype)initWithStringValue:(NSString *)stringValue intValue:(NSInteger)intValue;

@property (strong, nonatomic) NSString *stringValue;
@property (nonatomic) NSInteger intValue;

@end

#define DECODE_KEYED_HEADER(A, B, C, D) DECODE_KEYED_HEADER_NAMED(A, B, C, D, A)

#define DECODE_KEYED_HEADER_NAMED(A, B, C, D, E) \
A JNTDocumentDecodeKeyed__##E(DecoderPointer value, const char *key);

#define DECODE_HEADER(A, B, C, D) DECODE_HEADER_NAMED(A, B, C, D, A)

#define DECODE_HEADER_NAMED(A, B, C, D, E) \
A JNTDocumentDecode__##E(DecoderPointer value);

#define ENUMERATE(F) \
F##_NAMED(bool, bool, Bool, Bool, Bool); \
F(int8_t, int64_t, Int64, Int64); \
F(uint8_t, int64_t, Int64, Int64); \
F(int16_t, int64_t, Int64, Int64); \
F(uint16_t, int64_t, Int64, Int64); \
F(int32_t, int64_t, Int64, Int64); \
F(uint32_t, int64_t, Int64, Int64); \
F(int64_t, int64_t, Int64, Int64); \
F(uint64_t, uint64_t, UInt64, UInt64); \
F##_NAMED(const char *, const char *, String, String, String); \
F##_NAMED(NSInteger, int64_t, Int64, Int64, Int); \
F##_NAMED(NSUInteger, uint64_t, UInt64, UInt64, UInt);

ENUMERATE(DECODE_HEADER);
// ENUMERATE(DECODE_KEYED_HEADER);
//BOOL JNTDocumentContains(Document document, const char *key);
//BOOL JNTDocumentContains(void * document, const char *key);

CF_EXTERN_C_END
