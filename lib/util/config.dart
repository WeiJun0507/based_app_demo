import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:web3x/crypto.dart';
import 'package:web3x/web3x.dart';

class GlobalConfig {
  static const String SAFE_ADDRESS_CONTRACT_VERSION = "1.3.0";
  static const String POLYGON_MUMBAI_CONTRACT_ADDRESS =
      "0x0000000000000000000000000000000000001010";

  static const String SAFE_ADDRESS_ABI_NAME = "basedapp account abstraction";

  static const String SAFE_ADDRESS_PROXY_FACTORY =
      "0xa6B71E26C5e0845f74c812102Ca7114b6a896AB2";
  static const String SAFE_ADDRESS_SINGLETON =
      "0xd9Db270c1B5E3Bd161E8c8503c55cEABeE709552";
  static const String SAFE_ADDRESS_SINGLETON_L2 =
      "0x3E5c63644E683549055b9Be8653de26E0B4CD36E";
  static const String SAFE_ADDRESS_FALLBACK_HANDLER =
      "0xf48f2B2d2a534e402487b3ee7C18c33Aec0Fe5e4";

  // Should convert to Uint8List and hex later
  static const String SAFE_ADDRESS_PROXY_CREATION_CODE =
      "608060405234801561001057600080fd5b506040516101e63803806101e68339818101604052602081101561003357600080fd5b8101908080519060200190929190505050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1614156100ca576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260228152602001806101c46022913960400191505060405180910390fd5b806000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505060ab806101196000396000f3fe608060405273ffffffffffffffffffffffffffffffffffffffff600054167fa619486e0000000000000000000000000000000000000000000000000000000060003514156050578060005260206000f35b3660008037600080366000845af43d6000803e60008114156070573d6000fd5b3d6000f3fea2646970667358221220d1429297349653a4918076d650332de1a1068c5f3e07c5c82360c277770b955264736f6c63430007060033496e76616c69642073696e676c65746f6e20616464726573732070726f7669646564";
}

class EtherAbi {
  static ContractAbi setupAbi1 = ContractAbi.fromJson(
    jsonEncode(
      [
        {
          "inputs": [
            {
              "internalType": "address[]",
              "name": "_owners",
              "type": "address[]"
            },
            {
              "internalType": "uint256",
              "name": "_threshold",
              "type": "uint256"
            },
            {"internalType": "address", "name": "to", "type": "address"},
            {"internalType": "bytes", "name": "data", "type": "bytes"},
            {
              "internalType": "address",
              "name": "fallbackHandler",
              "type": "address"
            },
            {
              "internalType": "address",
              "name": "paymentToken",
              "type": "address"
            },
            {"internalType": "uint256", "name": "payment", "type": "uint256"},
            {
              "internalType": "address payable",
              "name": "paymentReceiver",
              "type": "address"
            }
          ],
          "name": "setup",
          "outputs": [],
          "stateMutability": "nonpayable",
          "type": "function"
        },
      ],
    ),
    bytesToHex(keccak256(
        Uint8List.fromList(GlobalConfig.SAFE_ADDRESS_ABI_NAME.codeUnits))),
  );
}
