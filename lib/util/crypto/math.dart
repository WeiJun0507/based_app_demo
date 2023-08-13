import 'dart:typed_data';

import 'package:convert/convert.dart';

typedef Numeric = num;
typedef BigNumberish = Object;

final BigInt BN_0 = BigInt.zero;
final BigInt BN_1 = BigInt.one;

// IEEE 754 supports 53-bits of mantissa
const maxValue = 0x1fffffffffffff;

const hexCharacters = '0123456789abcdef';

BigInt fromTwos(Object value, Numeric width) {
  final val = getUint(value, 'value');
  final w = BigInt.from(width);

  if ((val >> w.toInt()) != BN_0) {
    throw Exception('overflow: NUMERIC_FAULT');
  }

  // Top bit set; treat as a negative value
  if (val >> (w.toInt() - BN_1.toInt()) > BigInt.zero) {
    final mask = (BN_1 << w.toInt()) - BN_1;
    return -((~val) & mask) + BN_1;
  }

  return val;
}

BigInt toTwos(Object value, Numeric width) {
  var val = getBigInt(value, 'value');
  final w = BigInt.from(width);

  final limit = BN_1 << (w - BN_1).toInt();

  if (val < BN_0) {
    val = -val;
    if (val > limit) {
      throw Exception('too low: NUMERIC_FAULT');
    }
    final mask = (BN_1 << w.toInt()) - BN_1;
    return ((~val) & mask) + BN_1;
  } else {
    if (val >= limit) {
      throw Exception('too high: NUMERIC_FAULT');
    }
  }

  return val;
}

BigInt mask(Object value, Numeric bits) {
  final val = getUint(value, 'value');
  final b = BigInt.from(bits);
  return val & ((BN_1 << b.toInt()) - BN_1);
}

BigInt getBigInt(Object value, [String? name]) {
  if (value is BigInt) return value;
  if (value is num) {
    if (value < -maxValue || value > maxValue) {
      throw Exception('overflow: $name, $value');
    }
    return BigInt.from(value);
  }
  if (value is String) {
    try {
      if (value.isEmpty) throw Exception('empty string');
      if (value.startsWith('-') && !value.startsWith('--')) {
        return -BigInt.parse(value.substring(1));
      }
      return BigInt.parse(value);
    } catch (e) {
      throw Exception('invalid BigNumberish string: $e, $name, $value');
    }
  }
  throw Exception('invalid BigNumberish value: $name, $value');
}

BigInt getUint(Object value, [String? name]) {
  final result = getBigInt(value, name);
  if (result < BN_0) {
    throw Exception('unsigned value cannot be negative: NUMERIC_FAULT');
  }
  return result;
}

BigInt toBigInt(Object value) {
  if (value is Uint8List) {
    var result = '0x0';
    for (final v in value) {
      result += hexCharacters[v >> 4];
      result += hexCharacters[v & 0x0f];
    }
    return BigInt.parse(result);
  }

  return getBigInt(value);
}

num getNumber(Object value, [String? name]) {
  if (value is BigInt) {
    if (value < BigInt.from(-maxValue) || value > BigInt.from(maxValue)) {
      throw Exception('overflow: $name, $value');
    }
    return value.toDouble();
  }
  if (value is num) {
    if (value < -maxValue || value > maxValue) {
      throw Exception('overflow: $name, $value');
    }
    return value;
  }
  if (value is String) {
    try {
      if (value.isEmpty) throw Exception('empty string');
      return getNumber(BigInt.parse(value), name);
    } catch (e) {
      throw Exception('invalid numeric string: $e, $name, $value');
    }
  }
  throw Exception('invalid numeric value: $name, $value');
}

num toNumber(Object value) {
  return getNumber(toBigInt(value));
}

String toBeHex(Object value, [Numeric? width]) {
  final val = getUint(value, 'value');

  var result = val.toRadixString(16);

  if (width == null) {
    if (result.length % 2 != 0) result = '0$result';
  } else {
    final w = width.toInt();
    if (w * 2 < result.length) {
      throw Exception('value exceeds width ($w bits): NUMERIC_FAULT');
    }

    while (result.length < (w * 2)) {
      result = '0$result';
    }
  }

  return '0x$result';
}

Uint8List toBeArray(Object value) {
  final val = getUint(value, 'value');

  if (val == BN_0) return Uint8List.fromList([]);

  var hex = val.toRadixString(16);
  if (hex.length % 2 != 0) hex = '0$hex';

  final result = Uint8List(hex.length ~/ 2);
  for (var i = 0; i < result.length; i++) {
    final offset = i * 2;
    result[i] = int.parse(hex.substring(offset, offset + 2), radix: 16);
  }

  return result;
}

String toQuantity(Object value) {
  var result = hex.encode(toBeArray(value)).substring(2);
  while (result.startsWith('0')) {
    result = result.substring(1);
  }
  if (result.isEmpty) result = '0';
  return '0x$result';
}
