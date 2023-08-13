import 'dart:convert';
import 'dart:typed_data';

typedef Utf8ErrorFunc = int Function(
    Utf8ErrorReason reason, int offset, Uint8List bytes, List<int> output,
    [int? badCodepoint]);

enum Utf8ErrorReason {
  UNEXPECTED_CONTINUE,
  BAD_PREFIX,
  OVERRUN,
  MISSING_CONTINUE,
  OUT_OF_RANGE,
  UTF16_SURROGATE,
  OVERLONG,
}

class Utf8ErrorFuncs {
  final Utf8ErrorFunc error;
  final Utf8ErrorFunc ignore;
  final Utf8ErrorFunc replace;

  Utf8ErrorFuncs({
    required this.error,
    required this.ignore,
    required this.replace,
  });
}

class Utf8Utils {
  static int errorFunc(
      Utf8ErrorReason reason, int offset, Uint8List bytes, List<int> output,
      [int? badCodepoint]) {
    throw ArgumentError('invalid codepoint at offset $offset; $reason');
  }

  static int ignoreFunc(
      Utf8ErrorReason reason, int offset, Uint8List bytes, List<int> output,
      [int? badCodepoint]) {
    if (reason == Utf8ErrorReason.BAD_PREFIX ||
        reason == Utf8ErrorReason.UNEXPECTED_CONTINUE) {
      int i = 0;
      for (int o = offset + 1; o < bytes.length; o++) {
        if (bytes[o] >> 6 != 0x02) {
          break;
        }
        i++;
      }
      return i;
    }

    if (reason == Utf8ErrorReason.OVERRUN) {
      return bytes.length - offset - 1;
    }

    return 0;
  }

  static int replaceFunc(
      Utf8ErrorReason reason, int offset, Uint8List bytes, List<int> output,
      [int? badCodepoint]) {
    if (reason == Utf8ErrorReason.OVERLONG) {
      output.add(badCodepoint!);
      return 0;
    }

    output.add(0xfffd);

    return ignoreFunc(reason, offset, bytes, output, badCodepoint);
  }

  static final Utf8ErrorFuncs utf8ErrorFuncs = Utf8ErrorFuncs(
    error: errorFunc,
    ignore: ignoreFunc,
    replace: replaceFunc,
  );

  static List<int> getUtf8CodePoints(
    Uint8List bytes, {
    Utf8ErrorFunc? onError,
  }) {
    onError ??= utf8ErrorFuncs.error;

    List<int> result = [];
    int i = 0;

    while (i < bytes.length) {
      int c = bytes[i++];

      if (c >> 7 == 0) {
        result.add(c);
        continue;
      }

      int? extraLength;
      int? overlongMask;

      if ((c & 0xe0) == 0xc0) {
        extraLength = 1;
        overlongMask = 0x7f;
      } else if ((c & 0xf0) == 0xe0) {
        extraLength = 2;
        overlongMask = 0x7ff;
      } else if ((c & 0xf8) == 0xf0) {
        extraLength = 3;
        overlongMask = 0xffff;
      } else {
        if ((c & 0xc0) == 0x80) {
          i += onError(
              Utf8ErrorReason.UNEXPECTED_CONTINUE, i - 1, bytes, result);
        } else {
          i += onError(Utf8ErrorReason.BAD_PREFIX, i - 1, bytes, result);
        }
        continue;
      }

      if (i - 1 + extraLength >= bytes.length) {
        i += onError(Utf8ErrorReason.OVERRUN, i - 1, bytes, result);
        continue;
      }

      int res = c & ((1 << (8 - extraLength - 1)) - 1);

      for (int j = 0; j < extraLength; j++) {
        int nextChar = bytes[i];

        if ((nextChar & 0xc0) != 0x80) {
          i += onError(Utf8ErrorReason.MISSING_CONTINUE, i, bytes, result);
          res = -1;
          break;
        }

        res = (res << 6) | (nextChar & 0x3f);
        i++;
      }

      if (res == -1) {
        continue;
      }

      if (res > 0x10ffff) {
        i += onError(Utf8ErrorReason.OUT_OF_RANGE, i - 1 - extraLength, bytes,
            result, res);
        continue;
      }

      if (res >= 0xd800 && res <= 0xdfff) {
        i += onError(Utf8ErrorReason.UTF16_SURROGATE, i - 1 - extraLength,
            bytes, result, res);
        continue;
      }

      if (res <= overlongMask) {
        i += onError(
            Utf8ErrorReason.OVERLONG, i - 1 - extraLength, bytes, result, res);
        continue;
      }

      result.add(res);
    }

    return result;
  }

  static Uint8List toUtf8Bytes(String str) {
    List<int> result = [];
    for (int i = 0; i < str.length; i++) {
      int c = str.codeUnitAt(i);

      if (c < 0x80) {
        result.add(c);
      } else if (c < 0x800) {
        result.add((c >> 6) | 0xc0);
        result.add((c & 0x3f) | 0x80);
      } else if ((c & 0xfc00) == 0xd800) {
        i++;
        int c2 = str.codeUnitAt(i);

        assert(
          i < str.length && (c2 & 0xfc00) == 0xdc00,
          'invalid surrogate pair: str = $str',
        );

        int pair = 0x10000 + ((c & 0x03ff) << 10) + (c2 & 0x03ff);
        result.add((pair >> 18) | 0xf0);
        result.add(((pair >> 12) & 0x3f) | 0x80);
        result.add(((pair >> 6) & 0x3f) | 0x80);
        result.add((pair & 0x3f) | 0x80);
      } else {
        result.add((c >> 12) | 0xe0);
        result.add(((c >> 6) & 0x3f) | 0x80);
        result.add((c & 0x3f) | 0x80);
      }
    }

    return Uint8List.fromList(result);
  }

  static String _toUtf8String(List<int> codePoints) {
    return codePoints.map((codePoint) {
      if (codePoint <= 0xffff) {
        return String.fromCharCode(codePoint);
      }
      codePoint -= 0x10000;
      return String.fromCharCode((((codePoint >> 10) & 0x3ff) + 0xd800));
    }).join('');
  }

  static String toUtf8String(Uint8List bytes, {Utf8ErrorFunc? onError}) {
    return _toUtf8String(getUtf8CodePoints(bytes, onError: onError));
  }

  static List<int> toUtf8CodePoints(String str) {
    return getUtf8CodePoints(toUtf8Bytes(str));
  }
}
