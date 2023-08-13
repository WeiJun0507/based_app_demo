import 'dart:typed_data';

import 'package:web3x/crypto.dart';

import 'data.dart';

void assertArgument(
    bool condition, String message, String name, dynamic value) {
  if (!condition) {
    throw ArgumentError('$message: $name = $value');
  }
}

final BN_0 = BigInt.zero;
final BN_36 = BigInt.from(36);

String getChecksumAddress(String address) {
  address = address.toLowerCase();

  final chars = address.substring(2).split('');

  final expanded = Uint8List(40);
  for (var i = 0; i < 40; i++) {
    expanded[i] = chars[i].codeUnitAt(0);
  }

  final hashed = keccak256(expanded);

  for (var i = 0; i < 40; i += 2) {
    if ((hashed[i >> 1] >> 4) >= 8) {
      chars[i] = chars[i].toUpperCase();
    }
    if ((hashed[i >> 1] & 0x0f) >= 8) {
      chars[i + 1] = chars[i + 1].toUpperCase();
    }
  }

  return '0x' + chars.join('');
}

String ibanChecksum(String address) {
  address = address.toUpperCase();
  address = "${address.substring(4)}${address.substring(0, 2)}00";

  var expanded = address.split("").map((c) => ibanLookup[c]).join("");

  while (expanded.length >= safeDigits) {
    final block = expanded.substring(0, safeDigits);
    expanded = (int.parse(block, radix: 10) % 97).toString() +
        expanded.substring(block.length);
  }

  var checksum = (98 - (int.parse(expanded, radix: 10) % 97)).toString();
  while (checksum.length < 2) {
    checksum = "0$checksum";
  }

  return checksum;
}

final Map<String, String> ibanLookup = {
  for (var i = 0; i < 10; i++) i.toString(): i.toString(),
  for (var i = 0; i < 26; i++) String.fromCharCode(65 + i): (10 + i).toString(),
};

const safeDigits = 15;

final Base36 = {
  for (var i = 0; i < 36; i++)
    "0123456789abcdefghijklmnopqrstuvwxyz"[i]: BigInt.from(i),
};

BigInt fromBase36(String value) {
  value = value.toLowerCase();

  var result = BN_0;
  for (var i = 0; i < value.length; i++) {
    result = result * BN_36 + Base36[value[i]]!;
  }
  return result;
}

String getAddress(String address) {
  if (RegExp(r'^(0x)?[0-9a-fA-F]{40}$').hasMatch(address)) {
    if (!address.startsWith("0x")) {
      address = "0x$address";
    }

    final result = getChecksumAddress(address);

    assertArgument(
      !RegExp(r'([A-F].*[a-f])|([a-f].*[A-F])').hasMatch(address) ||
          result == address,
      "bad address checksum",
      "address",
      address,
    );

    return result;
  }

  if (RegExp(r'^XE[0-9]{2}[0-9A-Za-z]{30,31}$').hasMatch(address)) {
    assertArgument(
      address.substring(2, 4) == ibanChecksum(address),
      "bad icap checksum",
      "address",
      address,
    );

    var result =
        fromBase36(address.substring(4)).toRadixString(16).padLeft(40, '0');
    return getChecksumAddress("0x$result");
  }

  assertArgument(false, "invalid address", "address", address);
  throw ArgumentError('Should not reach here');
}

String getIcapAddress(String address) {
  final base36 = getAddress(address).substring(2).toLowerCase();
  final base36Padded = base36.padLeft(30, '0');
  final base36WithChecksum =
      "XE${ibanChecksum("XE00$base36Padded")}$base36Padded";
  return base36WithChecksum.toUpperCase();
}
