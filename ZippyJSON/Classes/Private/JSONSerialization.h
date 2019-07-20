//Copyright (c) 2018 Michael Eisel. All rights reserved.

#import <CoreFoundation/CoreFoundation.h>

CF_EXTERN_C_BEGIN

typedef CF_ENUM(size_t, JNTReadingOptions) {
    JNTReadingOptionsMutableContainers,
    JNTReadingOptionsMutableLeaves,
};

id JNTObjectFromJSON(void *data, JNTReadingOptions readingOptions);

const char *JNTSnakeCaseFromCamel(const char *key);

CF_EXTERN_C_END
