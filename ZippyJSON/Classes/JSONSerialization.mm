//Copyright (c) 2018 Michael Eisel. All rights reserved.

// NOTE: ARC is disabled for this file

#import "JSONSerialization_Private.h"
#import "JSONSerialization.h"
#import <CoreFoundation/CoreFoundation.h>
#import "reader.h"
#import "allocators.h"
#import "document.h"
#import "writer.h"
#import "simdjson.h"
#import <Foundation/Foundation.h>
#import <stdio.h>
#import <math.h>
#import "libbase64.h"

#define SIJ

#ifdef SIJ
using namespace simdjson;
#else
using namespace rapidjson;
#endif

typedef struct {
    char *string;
    size_t size;
} JNTString;

static __thread JNTDecodingError tError = {0};
static __thread JNTString tSnakeCaseBuffer = {0};

static const size_t kSnakeCaseBufferInitialSize = 100;

static void JNTStringGrow(JNTString *string, size_t newSize) {
    string->size = newSize;
    string->string = (char *)realloc((void *)string->string, newSize);
}

static inline bool JNTIsLower(char c) {
    return 'a' <= c && c <= 'z';
}

static inline bool JNTIsUpper(char c) {
    return 'A' <= c && c <= 'Z';
}

static inline char JNTToLower(char c) {
    return JNTIsUpper(c) ? c + ('a' - 'A') : c;
}

static void JNTUpdateBufferForSnakeCase(const char *key) {
    if (!tSnakeCaseBuffer.string) {
        JNTStringGrow(&tSnakeCaseBuffer, kSnakeCaseBufferInitialSize);
    }
    size_t maxLength = strlen(key) * 2 + 2;
    if (maxLength > tSnakeCaseBuffer.size) {
        JNTStringGrow(&tSnakeCaseBuffer, maxLength);
    }
    char *snakeCurrent = tSnakeCaseBuffer.string;
    char *debug = tSnakeCaseBuffer.string;
    if (key[0] == '\0') {
        *snakeCurrent = '\0';
        return;
    }

    *snakeCurrent = JNTToLower(key[0]);
    snakeCurrent++;
    const char *currentPointer = &(key[1]);
    const char *previousPointer = currentPointer;
    char current = *currentPointer;
    while (current != '\0') {
        while (!JNTIsUpper(current) && current != '\0') {
            *snakeCurrent = current;
            snakeCurrent++;
            currentPointer++;
            current = *currentPointer;
        }
        if (current != '\0') {
            *snakeCurrent = '_';
            snakeCurrent++;
        }
        previousPointer = currentPointer;
        while (!JNTIsLower(current) && current != '\0') {
            *snakeCurrent = JNTToLower(current);
            snakeCurrent++;

            currentPointer++;
            current = *currentPointer;
        }
        size_t distance = (size_t)(currentPointer - previousPointer);
        if (distance >= 2 && current != '\0') {
            char temp = snakeCurrent[-1];
            snakeCurrent[-1] = '_';
            *snakeCurrent = temp;
            snakeCurrent++;
        }
        previousPointer = currentPointer;
    }
    *snakeCurrent = '\0';
}

JNTDecodingError *JNTFetchAndResetError() {
    tError = {0};
    return &tError;
}

__thread ParsedJson *doc = NULL;
__thread const char *tLastKey = NULL;

const void *JNTDocumentFromJSON(const void *data, NSInteger length) {
#ifdef SIJ
    char *bytes = (char *)data;
    simdjson::ParsedJson *pj = new simdjson::ParsedJson;
    pj->allocateCapacity(length); // todo: why warning?
    const int res = simdjson::json_parse((const char *)data, length, *pj); // todo: handle error code
    assert(!res);
    return new ParsedJson::iterator(*pj);
#else
    Document *d = new Document; // needs freeing later via JNTReleaseDocument
    d->Parse(bytes);
    // check for error
    // cout << d->GetInt() << "\n";
    return d;
#endif
}

void JNTReleaseDocument(const void *document) {
#ifdef SIJ
    delete (ParsedJson::iterator *)document;
    delete (ParsedJson *)doc;
#else
    delete (Document *)document;
#endif
}

// static const char *kNotFound = (const char *)0x1;


#ifdef SIJ
bool JNTMoveToKey(ParsedJson::iterator *iterator, const char *key) {
    bool found = iterator->move_to_key(key);
    tLastKey = found ? key : NULL;
    return found;
}

BOOL JNTDocumentContains(const void *valueAsVoid, const char *key, bool convertCase) {
    ParsedJson::iterator *iter = (ParsedJson::iterator *)valueAsVoid;
    bool found = false;
    if (convertCase) {
        JNTUpdateBufferForSnakeCase(key);
        return JNTMoveToKey(iter, key);
    } else {
        return JNTMoveToKey(iter, key);
    }
}

bool JNTIsAtEnd(const void *valueAsVoid) {
    ParsedJson::iterator *iter = (ParsedJson::iterator *)valueAsVoid;
    bool isAtEnd = !iter->next();
    iter->prev();
    return isAtEnd;
}

#else
BOOL JNTDocumentContains(const void *valueAsVoid, const char *key, bool convertCase) {
    Value *value = (Value *)valueAsVoid;
    if (convertCase) {
        JNTUpdateBufferForSnakeCase(key);
        return value->HasMember(tSnakeCaseBuffer.string);
    } else {
        return value->HasMember(key);
    }
}
#endif

#ifndef SIJ
static const char *JNTStringForType(Type type) {
    switch (type) {
        case kNullType:
            return "null";
        case kFalseType:
        case kTrueType:
            return "Bool";
        case kObjectType:
            return "Dictionary";
        case kArrayType:
            return "Array";
        case kStringType:
            return "String";
        case kNumberType:
            return "Number";
    }
    return "?";
}

static void JNTHandleWrongType(Type type, const char *expectedType) {
    JNTDecodingErrorType errorType = type == kNullType ? JNTDecodingErrorTypeValueDoesNotExist : JNTDecodingErrorTypeWrongType;
    char *description = nullptr;
    asprintf(&description, "Expected %s value but found %s instead.", JNTStringForType(type), expectedType);
    tError = {
        .description = description,
        .type = errorType,
    };
}

static void JNTHandleMemberDoesNotExist(const char *key) {
    NSString *message = [NSString stringWithFormat:@"No value associated with %s.", key];
    printf("member does not exist\n");
    char *description = nullptr;
    asprintf(&description, "No value associated with %s.", key);
    tError = {
        .description = description,
        .type = JNTDecodingErrorTypeKeyDoesNotExist,
    };
}

template <typename T>
static void JNTHandleNumberDoesNotFit(T number, const char *type) {
    printf("number does not fit\n");
    char *description = nullptr;
    NS_VALID_UNTIL_END_OF_SCOPE NSString *string = [@(number) description];
    asprintf(&description, "Parsed JSON number %s does not fit in %s.", string.UTF8String, type);
    tError = {
        .description = description,
        .type = JNTDecodingErrorTypeNumberDoesNotFit,
    };
}
#endif

@implementation JNTCodingPath

- (instancetype)initWithStringValue:(NSString *)stringValue intValue:(NSInteger)intValue
{
    self = [super init];
    _stringValue = stringValue;
    _intValue = intValue;
    return self;
}

- (NSString *)description
{
    return _stringValue ? [NSString stringWithFormat:@"\"%@\"", _stringValue] : [NSString stringWithFormat:@"%@", @(_intValue)];
}

@end

#ifndef SIJ
NSArray <JNTCodingPath *> *JNTComputeCodingPath(const void * const *containers, NSInteger count) {
    NSMutableArray *codingPath = [NSMutableArray array];
    for (int i = 0; i < count - 1; i++) {
        Value *previousValue = (Value *)(containers[i]);
        Value *nextValue = (Value *)(containers[i + 1]);
        JNTCodingPath *path = nil;
        if (previousValue->IsObject()) {
             for (auto iterator = previousValue->MemberBegin(); iterator != previousValue->MemberEnd(); iterator++) {
                 if (&iterator->value == nextValue) {
                     path = [[JNTCodingPath alloc] initWithStringValue:@(iterator->name.GetString()) intValue:-1];
                     break;
                 }
             }
        } else {
            int current = 0;
            auto a = previousValue->GetArray();
            for (auto iterator = a.Begin(); iterator != a.End(); iterator++) {
                if (iterator == nextValue) {
                    path = [[JNTCodingPath alloc] initWithStringValue:nil intValue:current];
                    break;
                }
                current++;
            }
        }
        [codingPath addObject:path];
    }
    return [codingPath copy];
}
#endif

#ifdef SIJ
namespace TypeChecker {
    bool Object(ParsedJson::iterator *value) {
        return value->is_object();
    }
    struct Double {
        bool operator() (ParsedJson::iterator *value) {
            return value->is_double();
        }
    };
    //struct Uint64 {
    bool Uint64(ParsedJson::iterator *value) {
        return value->is_integer();
    }
    //};
    //struct Int64 {
    bool Int64(ParsedJson::iterator *value) {
        return value->is_integer();
    }
    //};
    bool String(ParsedJson::iterator *value) {
        return value->is_string();
    }

    bool Size(ParsedJson::iterator *value) {
        return value->is_integer();
    }

    bool USize(ParsedJson::iterator *value) {
        return value->is_integer();
    }

    bool Bool(ParsedJson::iterator *value) {
        return value->is_true() || value->is_false();
    }

    bool Array(ParsedJson::iterator *value) {
        return value->is_array();
    }
}

#else

namespace TypeChecker {
    bool Object(Value *value) {
        return value->IsObject();
    }
    struct Double {
        bool operator() (Value *value) {
            return value->IsDouble();
        }
    };
    //struct Uint64 {
        bool Uint64(Value *value) {
            return value->IsUint64();
        }
    //};
    //struct Int64 {
        bool Int64(Value *value) {
            return value->IsInt64();
        }
    //};
    bool String(Value *value) {
        return value->IsString();
    }

    bool Size(Value *value) {
        return sizeof(NSInteger) == 8 ? value->IsInt64() : value->IsInt();
    }

    bool USize(Value *value) {
        return sizeof(NSUInteger) == 8 ? value->IsUint64() : value->IsUint();
    }

    bool Bool(Value *value) {
        return value->IsBool();
    }

    bool Array(Value *value) {
        return value->IsArray();
    }
}

#endif

#ifdef SIJ

namespace Converter {
    struct Double {
        double operator() (ParsedJson::iterator *value) {
            return value->get_double();
        }
    };
    //struct Uint64 {
    uint64_t Uint64(ParsedJson::iterator *value) {
        return value->get_integer();
    }
    //};
    //struct Int64 {
    int64_t Int64(ParsedJson::iterator *value) {
        return value->get_integer();
    }
    //};
    NSInteger Size(ParsedJson::iterator *value) {
        return (NSInteger)value->get_integer();
    }

    NSUInteger USize(ParsedJson::iterator *value) {
        return (NSUInteger)value->get_integer();
    }

    const char *String(ParsedJson::iterator *value) {
        return value->get_string();
    }

    bool Bool(ParsedJson::iterator *value) {
        return value->is_true();
    }

    void Object(ParsedJson::iterator *value) {
        value->down();
    }

    void Array(ParsedJson::iterator *value) {
        value->down();
    }
}

#else

namespace Converter {
    struct Double {
        double operator() (Value *value) {
            return value->GetDouble();
        }
    };
    //struct Uint64 {
        uint64_t Uint64(Value *value) {
            return value->GetUint64();
        }
    //};
    //struct Int64 {
        int64_t Int64(Value *value) {
            return value->GetInt64();
        }
    //};
    NSInteger Size(Value *value) {
        return (NSInteger)value->GetInt64();
    }

    NSUInteger USize(Value *value) {
        return (NSUInteger)value->GetUint64();
    }

    const char *String(Value *value) {
        return value->GetString();
    }

    bool Bool(Value *value) {
        return value->GetBool();
    }

    Value::Object Object(Value *value) {
        return value->GetObject();
    }

    Value::Array Array(Value *value) {
        return value->GetArray();
    }
}

#endif

#ifdef SIJ

template <typename T, typename U, bool (*TypeCheck)(ParsedJson::iterator *), U (*Convert)(ParsedJson::iterator *)>
T JNTDocumentDecode(ParsedJson::iterator *value) {
    U number = Convert(value);
    T result = (T)number;
    return result;
}

const void *JNTDocumentDecodeArrayStart(const void *valueAsVoid) {
    ParsedJson::iterator *value = (ParsedJson::iterator *)valueAsVoid;
    value->down();
    return value;
}

const void *JNTDocumentNextArrayElement(const void *iteratorAsVoid) {
    ParsedJson::iterator *iterator = (ParsedJson::iterator *)iteratorAsVoid;
    iterator->next();
    return iterator;
}

BOOL JNTDocumentDecodeNil(const void *valueAsVoid) {
    ParsedJson::iterator *value = (ParsedJson::iterator *)valueAsVoid;
    return value->is_null();
}

bool JNTIsString(const void *valueAsVoid) {
    ParsedJson::iterator *value = (ParsedJson::iterator *)valueAsVoid;
    return value->is_string();
}

#else

template <typename T, typename U, bool (*TypeCheck)(Value *), U (*Convert)(Value *)>
T JNTDocumentDecode(Value *value) {
    if (RAPIDJSON_UNLIKELY(!TypeCheck(value))) {
        // todo: handle error where it's too big for 64-bit int
        JNTHandleWrongType(value->GetType(), typeid(T).name());
        return 0;
    }
    U number = Convert(value);
    T result = (T)number;
    if (RAPIDJSON_UNLIKELY(number != result)) {
        JNTHandleNumberDoesNotFit(number, typeid(T).name());
        return 0;
    }
    return result;
}

const void *JNTDocumentDecodeArrayStart(const void *valueAsVoid) {
    Value *value = (Value *)valueAsVoid;
    auto array = value->GetArray();
    return (const void **)array.Begin();
}

const void *JNTDocumentNextArrayElement(const void *iteratorAsVoid) {
    const Value *iterator = (const Value *)iteratorAsVoid;
    return (const void *)(iterator + 1);
}

BOOL JNTDocumentDecodeNil(const void *valueAsVoid) {
    Value *value = (Value *)valueAsVoid;
    return value->IsNull();
}

bool JNTIsString(const void *valueAsVoid) {
    Value *value = (Value *)valueAsVoid;
    return value->IsString();
}

#endif

__thread bool tThreadLocked = false;

bool JNTAcquireThreadLock() {
    bool threadWasLocked = tThreadLocked;
    tThreadLocked = true;
    return !threadWasLocked;
}

void JNTReleaseThreadLock() {
    tThreadLocked = false;
}

__thread const char *tPosInfString;
__thread const char *tNegInfString;
__thread const char *tNanString;

void JNTUpdateFloatingPointStrings(const char *posInfString, const char *negInfString, const char *nanString) {
    tPosInfString = posInfString;
    tNegInfString = negInfString;
    tNanString = nanString;
}

#ifdef SIJ

double JNTDocumentDecode__Double(const void *valueAsVoid) {
    ParsedJson::iterator *value = (ParsedJson::iterator *)valueAsVoid;
    if (RAPIDJSON_UNLIKELY(!value->is_double())) {
        if (value->is_string()) {
            const char *string = value->get_string();
            if (strcmp(string, tPosInfString) == 0) {
                return INFINITY;
            } else if (strcmp(string, tNegInfString) == 0) {
                return -INFINITY;
            } else if (strcmp(string, tNanString) == 0) {
                return NAN;
            }
        }
        // JNTHandleWrongType(value->get_type(), "double/float"); // todo: fix this for floats
        return 0;
    }
    return value->get_double();
}

float JNTDocumentDecode__Float(const void *valueAsVoid) {
    ParsedJson::iterator *value = (ParsedJson::iterator *)valueAsVoid;
    double d = JNTDocumentDecode__Double(value);
    return (float)d;
}

#else

double JNTDocumentDecode__Double(const void *valueAsVoid) {
    Value *value = (Value *)valueAsVoid;
    if (RAPIDJSON_UNLIKELY(!value->IsDouble())) {
        if (value->IsString()) {
            const char *string = value->GetString();
            if (strcmp(string, tPosInfString) == 0) {
                return INFINITY;
            } else if (strcmp(string, tNegInfString) == 0) {
                return -INFINITY;
            } else if (strcmp(string, tNanString) == 0) {
                return NAN;
            }
        }
        JNTHandleWrongType(value->GetType(), "double/float"); // todo: fix this for floats
        return 0;
    }
    return value->GetDouble();
}

float JNTDocumentDecode__Float(const void *valueAsVoid) {
    Value *value = (Value *)valueAsVoid;
    double d = JNTDocumentDecode__Double(value);
    if (RAPIDJSON_UNLIKELY(tError.type != JNTDecodingErrorTypeNone)) {
        return 0;
    }

    // todo: make this faster if possible
    if (RAPIDJSON_UNLIKELY(d < FLT_MIN || d > FLT_MAX)) {
        JNTHandleNumberDoesNotFit(d, "double");
        return 0;
    } else if (RAPIDJSON_UNLIKELY(d == HUGE_VAL)) {
        return HUGE_VALF;
    } else if (RAPIDJSON_UNLIKELY(d == -HUGE_VAL)) {
        return -HUGE_VALF;
    }

    return (float)d;
}

#endif

NSDecimalNumber *JNTDocumentDecode__Decimal(const void *valueAsVoid) {
    // Value *value = (Value *)valueAsVoid;
    abort();
    return [[NSDecimalNumber alloc] initWithInt:0];
}

static int JNTDataFromBase64String(size_t inLength, int32_t *outLength, const char *str, char **outBuffer) {
    // *outBuffer = (char *)malloc(inLength * 3 / 4 + 4);
    // size_t outlen = 0;
    // int errorStatus = base64_decode(str, inLength, *outBuffer, &outlen, 0);
    // *outLength = (int32_t)outlen;
    // return errorStatus;
    return 0;
}

void *JNTDocumentDecode__Data(const void *valueAsVoid, int32_t *outLength) {
    abort();
    /*Value *value = (Value *)valueAsVoid;
    const char *str = JNTDocumentDecode__String(valueAsVoid);
    size_t inLength = value->GetStringLength();
    char *outBuffer = NULL;
    int errorStatus = JNTDataFromBase64String(inLength, outLength, str, &outBuffer);
    // todo: catch errors here
    // todo: compared to the default options of apples based sixty four decoder
    return outBuffer;*/
}

NSDate *JNTDocumentDecode__Date(const void *valueAsVoid) {
    // Value *value = (Value *)valueAsVoid;
    abort();
    return [NSDate date];
}

// Test helper
const char *JNTSnakeCaseFromCamel(const char *key) {
    JNTUpdateBufferForSnakeCase(key);
    return tSnakeCaseBuffer.string;
}

#ifdef SIJ

__attribute__((always_inline)) const void *JNTDocumentFetchValue(const void *valueAsVoid, const char *key, bool convertCase) {
    ParsedJson::iterator *value = (ParsedJson::iterator *)valueAsVoid;
    if (tLastKey != key) {
        if (convertCase) {
            JNTUpdateBufferForSnakeCase(key);
        }
        value->move_to_key(key);
    }
    return value;
}

NSInteger JNTDocumentGetArrayCount(const void *valueAsVoid) {
    ParsedJson::iterator *value = (ParsedJson::iterator *)valueAsVoid;
    return 0;
}

#else

__attribute__((always_inline)) const void *JNTDocumentFetchValue(const void *valueAsVoid, const char *key, bool convertCase) {
    Value *value = (Value *)valueAsVoid;
    
    Value::MemberIterator member;
    if (convertCase) {
        JNTUpdateBufferForSnakeCase(key);
        member = value->FindMember(tSnakeCaseBuffer.string);
    } else {
        member = value->FindMember(key);
    }
    if (RAPIDJSON_UNLIKELY(member == value->MemberEnd())) {
        JNTHandleMemberDoesNotExist(key);
        return NULL;
    }
    return &member->value;
}

NSInteger JNTDocumentGetArrayCount(const void *valueAsVoid) {
    Value *value = (Value *)valueAsVoid;
    if (RAPIDJSON_UNLIKELY(!value->IsArray())) {
        // Error
        JNTPrintValue(value);
        return 0;
    }
    return value->GetArray().Size();
}

#endif

#ifndef SIJ

static void JNTPrintValue(Value *value) {
    printf("Value: %s\n", JNTStringForType(value->GetType()));
    if (value->IsObject()) {
    } else if (value->IsArray()) {
    }
}

#endif

#define DECODE(A, B, C, D) DECODE_NAMED(A, B, C, D, A)

#ifdef SIJ
#define DECODE_NAMED(A, B, C, D, E) \
A JNTDocumentDecode__##E(const void *value) { \
    return JNTDocumentDecode<A, B, TypeChecker::C, Converter::D>((ParsedJson::iterator *)value); \
}
#else
#define DECODE_NAMED(A, B, C, D, E) \
A JNTDocumentDecode__##E(const void *value) { \
    return JNTDocumentDecode<A, B, TypeChecker::C, Converter::D>((Value *)value); \
}
#endif

ENUMERATE(DECODE);

void JNTRunTests() {
    NSString *string = @"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
    for (NSUInteger i = 0; i < string.length; i++) {
        NSString *substring = [string substringToIndex:i];
        NSData *data = [[[NSData alloc] initWithBytes:substring.UTF8String length:i] base64EncodedDataWithOptions:0];
        int32_t outLength = 0;
        char *outBuffer = NULL;
        JNTDataFromBase64String((size_t)data.length, &outLength, (const char *)data.bytes, &outBuffer);
        assert(outLength == i && memcmp(string.UTF8String, outBuffer, outLength) == 0);
    }
}



// todo: NSNull, UInt64, Int64
// todo: concurrent usage
// todo: json test suites
// todo: non- objectJSON
// todo: throwing behavior
// todo: disable testability for release?
// todo: exceptions without memory leaks
// todo: external representation for string initializer's?
// public private visibility
// retains on objects in collections?
// todo: retains on UInt64s?
// todo: what if the string is released a couple times but still retained in other places
// todo: -Ofast?
// todo: kParseValidateEncodingFlag, kParseNanAndInfFlag
// todo: bridging cost of nsstring
// todo: nonconforming floats
// todo: class or struct types for the decoders?
// todo: asan
// todo: unknown reference to decoder
// todo: json keys with utf-8 characters
//todo: _JSONStringDictionaryDecodableMarker.Type investigation
// todo: cases where it fails but continues like when it tries to decode data from a string probably needs to be fixed
// todo: make sure that base64 works and does not overflow the buffer
// todo: cindy json does not support 32-bit
