import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:based_app/main.dart';
import 'package:based_app/model/magic_auth/magic_auth_request.dart';
import 'package:based_app/model/user.dart';
import 'package:based_app/util/config.dart';
import 'package:based_app/util/crypto/address.dart';
import 'package:based_app/util/crypto/data.dart';
import 'package:based_app/util/crypto/math.dart';
import 'package:based_app/util/crypto/utf8.dart';
import 'package:based_app/util/regex.dart';
import 'package:based_app/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_ext_oauth/magic_ext_oauth.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:magic_sdk/modules/user/user_response_type.dart';
import 'package:web3x/crypto.dart';
import 'package:web3x/web3x.dart';

enum MagicAuthKey {
  register0rLogin,
  login,
  init,
  bind,
}

class MagicAuthCancelError extends Error {}

class MagicAuthMgr {
  static final redirectUrl = Uri.parse('');
  static final _locks = <MagicAuthKey, Completer>{};

  static Completer? get(MagicAuthKey key) => _locks[key];

  final _magic = Magic.instance;

  MagicCredential? credential;

  late EthPrivateKey privateKey;

  static Timer? _timer;

  Future<bool> init(MagicAuthRequest request) async {
    return initPlatformState(request: request);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<bool> initPlatformState({required MagicAuthRequest request}) async {
    String redirectUrl;
    if (Platform.isAndroid) {
      redirectUrl = 'magic.link.basedapp://';
    } else {
      redirectUrl = 'magic.link.basedapp://';
    }

    try {
      if (request.type == MagicAuthRequestEnum.google) {
        // 这里登陆
        final config = OAuthConfiguration(
          provider: OAuthProvider.GOOGLE,
          redirectURI: redirectUrl,
        );
        final res = await _magic.oauth.loginWithPopup(config);
        credential = MagicCredential(Magic.instance.provider);
        final address = await credential!.getAccount();

        // await signInWithEthereum();
        if (res.oauth != null) {
          objectMgr.userMgr.setUserInfo(res.oauth!.userInfo!.toJson());
          final isLoggedIn = await _magic.user.isLoggedIn();
          objectMgr.userMgr.setIsLoggedIn(isLoggedIn);
          objectMgr.prefs.setBool('isLoggedIn', true);
          await objectMgr.userMgr.setUserInfo({
            'eotAddress': EthereumAddress.fromHex(address.hex),
          });
          objectMgr.prefs.setString(
              'userInfo', jsonEncode(objectMgr.userMgr.userInfo!.toJson()));

          objectMgr.cryptoMgr.init();
        }

        return true;
      } else if (request.type == MagicAuthRequestEnum.wallet) {
        return false;
      } else {
        final String result;
        Toast.showToast('Login Processing... Please Wait');
        if (request.type == MagicAuthRequestEnum.phone) {
          try {
            result = await _magic.auth.loginWithSMS(phoneNumber: request.data);
            getCountryCodeFromPhone(request.data);
            final phoneNumber = request.data.substring(
                getPhoneNumberExceptCountryCode(request.data)?.start ?? 0);
            final countryCode = request.data.substring(
                getCountryCodeFromPhone(request.data)?.start ?? 0,
                getCountryCodeFromPhone(request.data)?.end);
            objectMgr.userMgr.setUserInfo({
              'phoneNumber': phoneNumber.toString(),
              'countryCode': countryCode.toString(),
              'name': phoneNumber.toString(),
            });
          } catch (e) {
            debugPrint(e.toString());
            return false;
          }
        } else {
          try {
            Toast.hide();
            result = await _magic.auth.loginWithEmailOTP(email: request.data);
            objectMgr.userMgr.setUserInfo({
              'email': request.data.toString(),
              'name': request.data.toString(),
            });
          } catch (e) {
            debugPrint(e.toString());
            return false;
          }
        }
        if (result.isNotEmpty) {
          credential = MagicCredential(Magic.instance.provider);
          final isLoggedIn = await _magic.user.isLoggedIn();
          objectMgr.userMgr.setIsLoggedIn(isLoggedIn);
          objectMgr.prefs.setBool('isLoggedIn', true);

          final address = await credential!.getAccount();
          objectMgr.userMgr.setUserInfo({
            'eotAddress': EthereumAddress.fromHex(address.hex),
          });

          objectMgr.prefs.setString(
              'userInfo', jsonEncode(objectMgr.userMgr.userInfo!.toJson()));

          objectMgr.cryptoMgr.init();

          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static void resumedCheck() {
    _timer!.cancel();
    _timer = Timer(const Duration(seconds: 1), () {
      _tryThrowCancelError(MagicAuthKey.init);
      _tryThrowCancelError(MagicAuthKey.login);

      _timer = null;
    });
  }

  static void _tryThrowCancelError(MagicAuthKey key) {
    if (_locks.containsKey(key)) {
      final lock = _locks[key]!;
      if (!lock.isCompleted) {
        lock.completeError(MagicAuthCancelError());
        _locks.remove(key);
      }
    }
  }
}

EthPrivateKey preparePK() {
  Random randomNumber = Random.secure();
  return EthPrivateKey.createRandom(randomNumber);
}

Future<void> signInWithEthereum(EthPrivateKey privateKey) async {
  Uint8List sign1 = await privateKey
      .signPersonalMessage(Uint8List.fromList('hello world'.codeUnits));
  debugPrint("sign ${bytesToHex(sign1)}");
}

Future<EthereumAddress> calculateInitializer(
  List<EthereumAddress> owners,
  BigInt threshold,
  EthereumAddress to,
  Uint8List data,
  EthereumAddress fallbackHandler,
  EthereumAddress paymentToken,
  BigInt payment,
  EthereumAddress paymentReceiver,
) async {
  if (!RegExp(r'([A-F].*[a-f])|([a-f].*[A-F])')
      .hasMatch(GlobalConfig.SAFE_ADDRESS_PROXY_FACTORY)) {
    throw ArgumentError("Invalid safeProxyFactoryAddress");
  }

  if (!RegExp(r'([A-F].*[a-f])|([a-f].*[A-F])')
      .hasMatch(GlobalConfig.SAFE_ADDRESS_SINGLETON_L2)) {
    throw ArgumentError("singletonAddress is not a valid address");
  }
  if (hexToBytes(EtherAbi.setupAbi1.name).length != 32) {
    throw ArgumentError("Invalid saltNonce length");
  }
  final func =
      EtherAbi.setupAbi1.functions.firstWhere((e) => e.name == 'setup');
  final encodedAbiData = func.encodeCall([
    owners,
    threshold,
    to,
    data,
    fallbackHandler,
    paymentToken,
    payment,
    paymentReceiver,
  ]);

  final salt = _solidityPackedKeccak256(["bytes32", "bytes32"],
      [keccak256(encodedAbiData), hexToBytes(EtherAbi.setupAbi1.name)]);

  var codes = GlobalConfig.SAFE_ADDRESS_PROXY_CREATION_CODE;

  final initCodeHash = _solidityPackedKeccak256([
    "bytes",
    "bytes32"
  ], [
    codes,
    hexToBytes(
        "0x${GlobalConfig.SAFE_ADDRESS_SINGLETON_L2.substring(2).padLeft(64, "0")}")
  ]);

  final create2DataHash = _solidityPackedKeccak256([
    "bytes1",
    "address",
    "bytes32",
    "bytes32"
  ], [
    hexToBytes("0xff"), // create2 prefix
    GlobalConfig.SAFE_ADDRESS_PROXY_FACTORY,
    salt,
    initCodeHash,
  ]);

  // create2Hash.length is 2 chars ("0x") + 64 chars (32 bytes)
  // we want the last 20 bytes, so we drop the first 13 bytes/26 chars
  return EthereumAddress.fromHex(
      "0x${bytesToHex(create2DataHash).substring(24)}");
}

Uint8List _solidityPackedKeccak256(List<String> types, List<dynamic> values) {
  assert(types.length == values.length,
      ArgumentError('wrong number of values; expected ${types.length}'));

  final tight = <Uint8List>[];
  for (var i = 0; i < types.length; i++) {
    var type = types[i];
    var value = values[i];
    tight.add(_pack(type, value));
  }
  return keccak256(hexToBytes(concat(tight)));
}

Uint8List _pack(String type, dynamic value, {bool? isArray}) {
  switch (type) {
    case "address":
      if (isArray != null && isArray) {
        return hexToBytes(zeroPadValue(value, 32));
      }
      return hexToBytes(getAddress(value));
    case "string":
      return Utf8Utils.toUtf8Bytes(value);
    case "bytes":
      return hexToBytes(value);
    case "bool":
      final val = value ? "0x01" : "0x00";
      if (isArray != null && isArray) return hexToBytes(zeroPadBytes(val, 32));
      return hexToBytes(val);
  }

  final Match? numberMatch = regexNumber.matchAsPrefix(type);
  if (numberMatch != null) {
    final signed = numberMatch.group(1) == "int";
    int size = int.parse(numberMatch.group(2) ?? "256");

    assertArgument(
        (numberMatch.group(2) == null ||
                numberMatch.group(2) == size.toString()) &&
            (size % 8 == 0) &&
            size != 0 &&
            size <= 256,
        "invalid number type",
        "type",
        type);

    if (isArray != null && isArray) {
      size = 256;
    }

    if (signed) {
      value = toTwos(value, size);
    }

    return getBytes(zeroPadValue(toBeArray(value), size ~/ 8));
  }

  final Match? bytesMatch = regexBytes.matchAsPrefix(type);
  if (bytesMatch != null) {
    final size = int.parse(bytesMatch.group(1)!);

    if (size.toString() != bytesMatch.group(1) || size == 0 || size > 32) {
      throw ArgumentError('invalid bytes type: type, $type');
    }

    if (dataLength(value) != size) {
      throw ArgumentError('invalid value for $type: value, $value');
    }

    if (isArray != null && isArray) {
      return getBytes(zeroPadBytes(value, 32));
    }
    return value;
  }

  final Match? arrayMatch = regexArray.matchAsPrefix(type);
  if (arrayMatch != null && value is List) {
    final baseType = arrayMatch.group(1)!;
    final count =
        int.tryParse(arrayMatch.group(2) ?? value.length.toString()) ?? 0;
    if (count != value.length) {
      throw ArgumentError('invalid array length for $type: value, $value');
    }

    final result = <Uint8List>[];
    for (final val in value) {
      result.add(_pack(baseType, val, isArray: true));
    }
    return getBytes(concat(result));
  }

  throw ArgumentError('invalid type: type, $type');
}
