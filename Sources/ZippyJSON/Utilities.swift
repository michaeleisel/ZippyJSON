//Copyright (c) 2018 Michael Eisel. All rights reserved.

extension ZippyJSONDecoder.KeyDecodingStrategy {
  @inline(__always)
  var isNotDefault: Bool {
    switch self {
    case .useDefaultKeys: false
    default: true
    }
  }
}
