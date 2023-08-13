import 'dart:convert';

import 'package:based_app/main.dart';
import 'package:based_app/manager/manager_lifecycle_abstract.dart';
import 'package:based_app/manager/web3auth/web3auth_mgr.dart';
import 'package:based_app/model/user.dart';
import 'package:based_app/util/config.dart';
import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:web3x/crypto.dart';
import 'package:web3x/web3x.dart';

class UserMgr extends ManagerLifecycleAbstract {
  User? userInfo;
  bool isLoggedIn = false;

  @override
  Future<void> init() async {
    final bool? isLoggedIn = objectMgr.prefs.getBool('isLoggedIn');
    await objectMgr.cryptoMgr.init();
    if (isLoggedIn != null && isLoggedIn) {
      setIsLoggedIn(isLoggedIn);
      await setUserInfo(
          jsonDecode(objectMgr.prefs.getString('userInfo') ?? '{}'));
    }
  }

  @override
  Future<void> destroy() async {
    await Magic.instance.user.logout();
  }

  Future<void> setUserInfo(Map<String, dynamic> json) async {
    final Map<String, dynamic> oldUserInfo = userInfo?.toJson() ?? {};
    userInfo = User.fromJson({...oldUserInfo, ...json});
    if (json.containsKey('eotAddress')) {
      dynamic eotAddr = json['eotAddress'];
      if (json['eotAddress'] is String) {
        eotAddr = EthereumAddress.fromHex(json['eotAddress']);
      }
      // 计算转换 地址
      final EthereumAddress? val = await calculateBasedSafeAddress(
          GlobalConfig.SAFE_ADDRESS_CONTRACT_VERSION, eotAddr);
      userInfo!.safeAddress = val;
    }
  }

  void setIsLoggedIn(bool value) => isLoggedIn = value;

  void logout(BuildContext context) {
    objectMgr.prefs.setBool('isLoggedIn', false);
    objectMgr.prefs.setString('userInfo', '{}');
    setIsLoggedIn(false);
    setUserInfo({});
    objectMgr.cryptoMgr.destroy();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ),
    );
  }

  Future<EthereumAddress?> calculateBasedSafeAddress(
    String version,
    EthereumAddress eotAddress,
  ) async {
    if (version != GlobalConfig.SAFE_ADDRESS_CONTRACT_VERSION) {
      throw ArgumentError('Invalid Safe Address Contract Version');
    }

    return await calculateInitializer(
      [eotAddress],
      BigInt.one,
      EthereumAddress.fromHex('0x0000000000000000000000000000000000000000'),
      hexToBytes(""),
      EthereumAddress.fromHex(GlobalConfig.SAFE_ADDRESS_FALLBACK_HANDLER),
      EthereumAddress.fromHex('0x0000000000000000000000000000000000000000'),
      BigInt.zero,
      EthereumAddress.fromHex('0x0000000000000000000000000000000000000000'),
    );
  }
}
