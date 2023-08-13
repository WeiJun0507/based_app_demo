import 'dart:typed_data';

import 'package:based_app/util/crypto/math.dart';

Uint8List _getBytes(dynamic value, {bool? copy}) {
  if (value is Uint8List) {
    if (copy ?? false) return Uint8List.fromList(value);
    return value;
  }

  if (value is String && RegExp(r'^0x([0-9a-f][0-9a-f])*$').hasMatch(value)) {
    final result = Uint8List((value.length - 2) ~/ 2);
    var offset = 2;
    for (var i = 0; i < result.length; i++) {
      result[i] = int.parse(value.substring(offset, offset + 2), radix: 16);
      offset += 2;
    }
    return result;
  }

  throw AssertionError('Should not reach here');
}

Uint8List getBytes(dynamic value, {String? name}) {
  return _getBytes(value, copy: false);
}

Uint8List getBytesCopy(dynamic value, [String? name]) {
  return _getBytes(value, copy: true);
}

bool isHexString(dynamic value, {int? length, bool? check}) {
  if (value is! String || !RegExp(r'^0x[0-9A-Fa-f]*$').hasMatch(value)) {
    return false;
  }

  if (length != null && value.length != 2 + 2 * length) return false;
  if (check != null && check && value.length % 2 != 0) return false;

  return true;
}

bool isBytesLike(dynamic value) {
  return isHexString(value, check: true) || (value is Uint8List);
}

String hexlify(Uint8List data) {
  final bytes = getBytes(data);

  var result = '0x';
  for (var i = 0; i < bytes.length; i++) {
    final v = bytes[i];
    result += hexCharacters[(v & 0xf0) >> 4] + hexCharacters[v & 0x0f];
  }
  return result;
}

String concat(List<Uint8List> datas) {
  return '0x${datas.map((d) => hexlify(d).substring(2)).join('')}';
}

int dataLength(dynamic data) {
  if (isHexString(data, check: true)) return (data.length - 2) ~/ 2;
  return getBytes(data).length;
}

String dataSlice(dynamic data, [int? start, int? end]) {
  final bytes = getBytes(data);
  if (end != null && end > bytes.length) {
    // Simulating assert function since it's not part of the standard library
    assert(false, 'cannot slice beyond data bounds');
    throw AssertionError('Should not reach here');
  }
  return hexlify(
      Uint8List.fromList(bytes.sublist(start ?? 0, end ?? bytes.length)));
}

String stripZerosLeft(dynamic data) {
  var bytes = hexlify(data).substring(2);
  while (bytes.startsWith('00')) {
    bytes = bytes.substring(2);
  }
  return '0x$bytes';
}

String zeroPad(dynamic data, int length, bool left) {
  final bytes = getBytes(data);
  // Simulating assert function since it's not part of the standard library
  assert(length >= bytes.length, 'padding exceeds data length');

  final result = Uint8List(length);
  if (left) {
    result.setRange(length - bytes.length, length, bytes);
  } else {
    result.setRange(0, bytes.length, bytes);
  }

  return hexlify(result);
}

String zeroPadValue(dynamic data, int length) {
  return zeroPad(data, length, true);
}

String zeroPadBytes(dynamic data, int length) {
  return zeroPad(data, length, false);
}
