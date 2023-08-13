import 'package:based_app/manager/user_mgr.dart';
import 'package:based_app/manager/web3auth/web3auth_mgr.dart';
import 'package:based_app/util/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web3x/crypto.dart';
import 'package:web3x/web3x.dart';

main() async {
  // testConvertSafeAddress();
  test("testConvertSafeAddress", () async {
    List<String> addresses = [
      "0x865f1EB534a48DDBC8457C63eAd1E898C7DfD70E",
      "0xBf48E3c04478c9FBE516a431c8866DC6908277E0"
    ];

    List<String> expectedOutput = [
      "0xeE63B8dBe05F0cCA8aa2c350A24Ed47e6aaD6759",
      "0x88aD55C4Cae5f98dAEE83082c8a6Fb9bDA7536c4",
    ];
    for (int i = 0; i < addresses.length; i++) {
      final EthereumAddress val = await calculateInitializer(
        [EthereumAddress.fromHex(addresses[i])],
        BigInt.one,
        EthereumAddress.fromHex('0x0000000000000000000000000000000000000000'),
        hexToBytes(""),
        EthereumAddress.fromHex(GlobalConfig.SAFE_ADDRESS_FALLBACK_HANDLER),
        EthereumAddress.fromHex('0x0000000000000000000000000000000000000000'),
        BigInt.zero,
        EthereumAddress.fromHex('0x0000000000000000000000000000000000000000'),
      );
      expect(val.hexEip55, expectedOutput[i]);
    }
  });

  test("it should throw on invalid version", () {
    expect(
        UserMgr().calculateBasedSafeAddress(
            "1.3.4",
            EthereumAddress.fromHex(
                "0x865F1EB534a48DDBC8457C63eAd1E898C7DfD70E")),
        throwsA(isA<ArgumentError>()));
  });

  test("it should throw on invalid version", () {
    List<String> addresses = [
      "",
      "0x001",
      "0",
      "0xBf48E3c04478c9FBE516a431c8866DC6908277E00"
    ];
    for (int i = 0; i < addresses.length; i++) {
      expect(
          UserMgr().calculateBasedSafeAddress(
              "1.3.0", EthereumAddress.fromHex(addresses[i])),
          throwsA(isA<ArgumentError>()));
    }
  });

  // test("it should throw checksum error", () => {
  // expect(() => calculateBasedSafeAddress("1.3.0", "0x865F1EB534a48DDBC8457C63eAd1E898C7DfD70E")).toThrowError(
  // `bad address checksum (argument="address", value="0x865F1EB534a48DDBC8457C63eAd1E898C7DfD70E", code=INVALID_ARGUMENT, version=6.6.4) (argument="", value="0x865F1EB534a48DDBC8457C63eAd1E898C7DfD70E", code=INVALID_ARGUMENT, version=6.6.4)`
  // );
// });

  test('Test Sign in with Ethereum', () async {
    EthPrivateKey privateKey = preparePK();
    signInWithEthereum(privateKey);
  });
}
