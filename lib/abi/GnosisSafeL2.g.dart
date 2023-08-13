// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3x/web3x.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"}],"name":"AddedOwner","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"approvedHash","type":"bytes32"},{"indexed":true,"internalType":"address","name":"owner","type":"address"}],"name":"ApproveHash","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"handler","type":"address"}],"name":"ChangedFallbackHandler","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"guard","type":"address"}],"name":"ChangedGuard","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"threshold","type":"uint256"}],"name":"ChangedThreshold","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"module","type":"address"}],"name":"DisabledModule","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"module","type":"address"}],"name":"EnabledModule","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"bytes32","name":"txHash","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"payment","type":"uint256"}],"name":"ExecutionFailure","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"module","type":"address"}],"name":"ExecutionFromModuleFailure","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"module","type":"address"}],"name":"ExecutionFromModuleSuccess","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"bytes32","name":"txHash","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"payment","type":"uint256"}],"name":"ExecutionSuccess","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"}],"name":"RemovedOwner","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"module","type":"address"},{"indexed":false,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"},{"indexed":false,"internalType":"bytes","name":"data","type":"bytes"},{"indexed":false,"internalType":"enum Enum.Operation","name":"operation","type":"uint8"}],"name":"SafeModuleTransaction","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"},{"indexed":false,"internalType":"bytes","name":"data","type":"bytes"},{"indexed":false,"internalType":"enum Enum.Operation","name":"operation","type":"uint8"},{"indexed":false,"internalType":"uint256","name":"safeTxGas","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"baseGas","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"gasPrice","type":"uint256"},{"indexed":false,"internalType":"address","name":"gasToken","type":"address"},{"indexed":false,"internalType":"address payable","name":"refundReceiver","type":"address"},{"indexed":false,"internalType":"bytes","name":"signatures","type":"bytes"},{"indexed":false,"internalType":"bytes","name":"additionalInfo","type":"bytes"}],"name":"SafeMultiSigTransaction","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"SafeReceived","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"initiator","type":"address"},{"indexed":false,"internalType":"address[]","name":"owners","type":"address[]"},{"indexed":false,"internalType":"uint256","name":"threshold","type":"uint256"},{"indexed":false,"internalType":"address","name":"initializer","type":"address"},{"indexed":false,"internalType":"address","name":"fallbackHandler","type":"address"}],"name":"SafeSetup","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"msgHash","type":"bytes32"}],"name":"SignMsg","type":"event"},{"stateMutability":"nonpayable","type":"fallback"},{"inputs":[],"name":"VERSION","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"_threshold","type":"uint256"}],"name":"addOwnerWithThreshold","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"hashToApprove","type":"bytes32"}],"name":"approveHash","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"approvedHashes","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_threshold","type":"uint256"}],"name":"changeThreshold","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"dataHash","type":"bytes32"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"bytes","name":"signatures","type":"bytes"},{"internalType":"uint256","name":"requiredSignatures","type":"uint256"}],"name":"checkNSignatures","outputs":[],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"dataHash","type":"bytes32"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"bytes","name":"signatures","type":"bytes"}],"name":"checkSignatures","outputs":[],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"prevModule","type":"address"},{"internalType":"address","name":"module","type":"address"}],"name":"disableModule","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"domainSeparator","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"module","type":"address"}],"name":"enableModule","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"enum Enum.Operation","name":"operation","type":"uint8"},{"internalType":"uint256","name":"safeTxGas","type":"uint256"},{"internalType":"uint256","name":"baseGas","type":"uint256"},{"internalType":"uint256","name":"gasPrice","type":"uint256"},{"internalType":"address","name":"gasToken","type":"address"},{"internalType":"address","name":"refundReceiver","type":"address"},{"internalType":"uint256","name":"_nonce","type":"uint256"}],"name":"encodeTransactionData","outputs":[{"internalType":"bytes","name":"","type":"bytes"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"enum Enum.Operation","name":"operation","type":"uint8"},{"internalType":"uint256","name":"safeTxGas","type":"uint256"},{"internalType":"uint256","name":"baseGas","type":"uint256"},{"internalType":"uint256","name":"gasPrice","type":"uint256"},{"internalType":"address","name":"gasToken","type":"address"},{"internalType":"address payable","name":"refundReceiver","type":"address"},{"internalType":"bytes","name":"signatures","type":"bytes"}],"name":"execTransaction","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"enum Enum.Operation","name":"operation","type":"uint8"}],"name":"execTransactionFromModule","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"enum Enum.Operation","name":"operation","type":"uint8"}],"name":"execTransactionFromModuleReturnData","outputs":[{"internalType":"bool","name":"success","type":"bool"},{"internalType":"bytes","name":"returnData","type":"bytes"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getChainId","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"start","type":"address"},{"internalType":"uint256","name":"pageSize","type":"uint256"}],"name":"getModulesPaginated","outputs":[{"internalType":"address[]","name":"array","type":"address[]"},{"internalType":"address","name":"next","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getOwners","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"offset","type":"uint256"},{"internalType":"uint256","name":"length","type":"uint256"}],"name":"getStorageAt","outputs":[{"internalType":"bytes","name":"","type":"bytes"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getThreshold","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"enum Enum.Operation","name":"operation","type":"uint8"},{"internalType":"uint256","name":"safeTxGas","type":"uint256"},{"internalType":"uint256","name":"baseGas","type":"uint256"},{"internalType":"uint256","name":"gasPrice","type":"uint256"},{"internalType":"address","name":"gasToken","type":"address"},{"internalType":"address","name":"refundReceiver","type":"address"},{"internalType":"uint256","name":"_nonce","type":"uint256"}],"name":"getTransactionHash","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"module","type":"address"}],"name":"isModuleEnabled","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"isOwner","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"nonce","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"prevOwner","type":"address"},{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"_threshold","type":"uint256"}],"name":"removeOwner","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"enum Enum.Operation","name":"operation","type":"uint8"}],"name":"requiredTxGas","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"handler","type":"address"}],"name":"setFallbackHandler","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"guard","type":"address"}],"name":"setGuard","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address[]","name":"_owners","type":"address[]"},{"internalType":"uint256","name":"_threshold","type":"uint256"},{"internalType":"address","name":"to","type":"address"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"address","name":"fallbackHandler","type":"address"},{"internalType":"address","name":"paymentToken","type":"address"},{"internalType":"uint256","name":"payment","type":"uint256"},{"internalType":"address payable","name":"paymentReceiver","type":"address"}],"name":"setup","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"signedMessages","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"targetContract","type":"address"},{"internalType":"bytes","name":"calldataPayload","type":"bytes"}],"name":"simulateAndRevert","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"prevOwner","type":"address"},{"internalType":"address","name":"oldOwner","type":"address"},{"internalType":"address","name":"newOwner","type":"address"}],"name":"swapOwner","outputs":[],"stateMutability":"nonpayable","type":"function"},{"stateMutability":"payable","type":"receive"}]',
  'GnosisSafeL2',
);

class GnosisSafeL2 extends _i1.GeneratedContract {
  GnosisSafeL2({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<String> VERSION({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, 'ffa1ad74'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as String);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addOwnerWithThreshold(
    _i1.EthereumAddress owner,
    BigInt _threshold, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '0d582f13'));
    final params = [
      owner,
      _threshold,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> approveHash(
    _i2.Uint8List hashToApprove, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, 'd4d9bdcd'));
    final params = [hashToApprove];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> approvedHashes(
    _i1.EthereumAddress $param3,
    _i2.Uint8List $param4, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '7d832974'));
    final params = [
      $param3,
      $param4,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> changeThreshold(
    BigInt _threshold, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '694e80c3'));
    final params = [_threshold];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<void> checkNSignatures(
    _i2.Uint8List dataHash,
    _i2.Uint8List data,
    _i2.Uint8List signatures,
    BigInt requiredSignatures, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '12fb68e0'));
    final params = [
      dataHash,
      data,
      signatures,
      requiredSignatures,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<void> checkSignatures(
    _i2.Uint8List dataHash,
    _i2.Uint8List data,
    _i2.Uint8List signatures, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '934f3a11'));
    final params = [
      dataHash,
      data,
      signatures,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> disableModule(
    _i1.EthereumAddress prevModule,
    _i1.EthereumAddress module, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, 'e009cfde'));
    final params = [
      prevModule,
      module,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> domainSeparator({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, 'f698da25'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> enableModule(
    _i1.EthereumAddress module, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, '610b5925'));
    final params = [module];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> encodeTransactionData(
    _i1.EthereumAddress to,
    BigInt value,
    _i2.Uint8List data,
    BigInt operation,
    BigInt safeTxGas,
    BigInt baseGas,
    BigInt gasPrice,
    _i1.EthereumAddress gasToken,
    _i1.EthereumAddress refundReceiver,
    BigInt _nonce, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, 'e86637db'));
    final params = [
      to,
      value,
      data,
      operation,
      safeTxGas,
      baseGas,
      gasPrice,
      gasToken,
      refundReceiver,
      _nonce,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> execTransaction(
    _i1.EthereumAddress to,
    BigInt value,
    _i2.Uint8List data,
    BigInt operation,
    BigInt safeTxGas,
    BigInt baseGas,
    BigInt gasPrice,
    _i1.EthereumAddress gasToken,
    _i1.EthereumAddress refundReceiver,
    _i2.Uint8List signatures, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '6a761202'));
    final params = [
      to,
      value,
      data,
      operation,
      safeTxGas,
      baseGas,
      gasPrice,
      gasToken,
      refundReceiver,
      signatures,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> execTransactionFromModule(
    _i1.EthereumAddress to,
    BigInt value,
    _i2.Uint8List data,
    BigInt operation, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, '468721a7'));
    final params = [
      to,
      value,
      data,
      operation,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> execTransactionFromModuleReturnData(
    _i1.EthereumAddress to,
    BigInt value,
    _i2.Uint8List data,
    BigInt operation, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, '5229073f'));
    final params = [
      to,
      value,
      data,
      operation,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getChainId({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, '3408e470'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<GetModulesPaginated> getModulesPaginated(
    _i1.EthereumAddress start,
    BigInt pageSize, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[16];
    assert(checkSignature(function, 'cc2f8452'));
    final params = [
      start,
      pageSize,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return GetModulesPaginated(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getOwners({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[17];
    assert(checkSignature(function, 'a0e67e2b'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> getStorageAt(
    BigInt offset,
    BigInt length, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[18];
    assert(checkSignature(function, '5624b25b'));
    final params = [
      offset,
      length,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getThreshold({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[19];
    assert(checkSignature(function, 'e75235b8'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> getTransactionHash(
    _i1.EthereumAddress to,
    BigInt value,
    _i2.Uint8List data,
    BigInt operation,
    BigInt safeTxGas,
    BigInt baseGas,
    BigInt gasPrice,
    _i1.EthereumAddress gasToken,
    _i1.EthereumAddress refundReceiver,
    BigInt _nonce, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[20];
    assert(checkSignature(function, 'd8d11f78'));
    final params = [
      to,
      value,
      data,
      operation,
      safeTxGas,
      baseGas,
      gasPrice,
      gasToken,
      refundReceiver,
      _nonce,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isModuleEnabled(
    _i1.EthereumAddress module, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[21];
    assert(checkSignature(function, '2d9ad53d'));
    final params = [module];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isOwner(
    _i1.EthereumAddress owner, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[22];
    assert(checkSignature(function, '2f54bf6e'));
    final params = [owner];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> nonce({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[23];
    assert(checkSignature(function, 'affed0e0'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> removeOwner(
    _i1.EthereumAddress prevOwner,
    _i1.EthereumAddress owner,
    BigInt _threshold, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[24];
    assert(checkSignature(function, 'f8dc5dd9'));
    final params = [
      prevOwner,
      owner,
      _threshold,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> requiredTxGas(
    _i1.EthereumAddress to,
    BigInt value,
    _i2.Uint8List data,
    BigInt operation, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[25];
    assert(checkSignature(function, 'c4ca3a9c'));
    final params = [
      to,
      value,
      data,
      operation,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setFallbackHandler(
    _i1.EthereumAddress handler, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[26];
    assert(checkSignature(function, 'f08a0323'));
    final params = [handler];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setGuard(
    _i1.EthereumAddress guard, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[27];
    assert(checkSignature(function, 'e19a9dd9'));
    final params = [guard];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setup(
    List<_i1.EthereumAddress> _owners,
    BigInt _threshold,
    _i1.EthereumAddress to,
    _i2.Uint8List data,
    _i1.EthereumAddress fallbackHandler,
    _i1.EthereumAddress paymentToken,
    BigInt payment,
    _i1.EthereumAddress paymentReceiver, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[28];
    assert(checkSignature(function, 'b63e800d'));
    final params = [
      _owners,
      _threshold,
      to,
      data,
      fallbackHandler,
      paymentToken,
      payment,
      paymentReceiver,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> signedMessages(
    _i2.Uint8List $param77, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[29];
    assert(checkSignature(function, '5ae6bd37'));
    final params = [$param77];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> simulateAndRevert(
    _i1.EthereumAddress targetContract,
    _i2.Uint8List calldataPayload, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[30];
    assert(checkSignature(function, 'b4faba09'));
    final params = [
      targetContract,
      calldataPayload,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> swapOwner(
    _i1.EthereumAddress prevOwner,
    _i1.EthereumAddress oldOwner,
    _i1.EthereumAddress newOwner, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
    _i1.Transaction? additional,
  }) async {
    final function = self.abi.functions[31];
    assert(checkSignature(function, 'e318b52b'));
    final params = [
      prevOwner,
      oldOwner,
      newOwner,
    ];
    return write(
      credentials: credentials,
      base: transaction,
      additional: additional,
      function: function,
      parameters: params,
    );
  }

  /// Returns a live stream of all AddedOwner events emitted by this contract.
  Stream<AddedOwner> addedOwnerEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('AddedOwner');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return AddedOwner(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ApproveHash events emitted by this contract.
  Stream<ApproveHash> approveHashEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ApproveHash');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ApproveHash(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ChangedFallbackHandler events emitted by this contract.
  Stream<ChangedFallbackHandler> changedFallbackHandlerEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ChangedFallbackHandler');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ChangedFallbackHandler(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ChangedGuard events emitted by this contract.
  Stream<ChangedGuard> changedGuardEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ChangedGuard');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ChangedGuard(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ChangedThreshold events emitted by this contract.
  Stream<ChangedThreshold> changedThresholdEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ChangedThreshold');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ChangedThreshold(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all DisabledModule events emitted by this contract.
  Stream<DisabledModule> disabledModuleEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('DisabledModule');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return DisabledModule(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all EnabledModule events emitted by this contract.
  Stream<EnabledModule> enabledModuleEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('EnabledModule');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return EnabledModule(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ExecutionFailure events emitted by this contract.
  Stream<ExecutionFailure> executionFailureEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ExecutionFailure');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ExecutionFailure(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ExecutionFromModuleFailure events emitted by this contract.
  Stream<ExecutionFromModuleFailure> executionFromModuleFailureEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ExecutionFromModuleFailure');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ExecutionFromModuleFailure(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ExecutionFromModuleSuccess events emitted by this contract.
  Stream<ExecutionFromModuleSuccess> executionFromModuleSuccessEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ExecutionFromModuleSuccess');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ExecutionFromModuleSuccess(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all ExecutionSuccess events emitted by this contract.
  Stream<ExecutionSuccess> executionSuccessEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ExecutionSuccess');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ExecutionSuccess(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all RemovedOwner events emitted by this contract.
  Stream<RemovedOwner> removedOwnerEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('RemovedOwner');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return RemovedOwner(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all SafeModuleTransaction events emitted by this contract.
  Stream<SafeModuleTransaction> safeModuleTransactionEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('SafeModuleTransaction');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return SafeModuleTransaction(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all SafeMultiSigTransaction events emitted by this contract.
  Stream<SafeMultiSigTransaction> safeMultiSigTransactionEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('SafeMultiSigTransaction');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return SafeMultiSigTransaction(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all SafeReceived events emitted by this contract.
  Stream<SafeReceived> safeReceivedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('SafeReceived');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return SafeReceived(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all SafeSetup events emitted by this contract.
  Stream<SafeSetup> safeSetupEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('SafeSetup');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return SafeSetup(
        decoded,
        result,
      );
    });
  }

  /// Returns a live stream of all SignMsg events emitted by this contract.
  Stream<SignMsg> signMsgEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('SignMsg');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return SignMsg(
        decoded,
        result,
      );
    });
  }
}

class GetModulesPaginated {
  GetModulesPaginated(List<dynamic> response)
      : array = (response[0] as List<dynamic>).cast<_i1.EthereumAddress>(),
        next = (response[1] as _i1.EthereumAddress);

  final List<_i1.EthereumAddress> array;

  final _i1.EthereumAddress next;
}

class AddedOwner {
  AddedOwner(
    List<dynamic> response,
    this.event,
  ) : owner = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress owner;

  final _i1.FilterEvent event;
}

class ApproveHash {
  ApproveHash(
    List<dynamic> response,
    this.event,
  )   : approvedHash = (response[0] as _i2.Uint8List),
        owner = (response[1] as _i1.EthereumAddress);

  final _i2.Uint8List approvedHash;

  final _i1.EthereumAddress owner;

  final _i1.FilterEvent event;
}

class ChangedFallbackHandler {
  ChangedFallbackHandler(
    List<dynamic> response,
    this.event,
  ) : handler = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress handler;

  final _i1.FilterEvent event;
}

class ChangedGuard {
  ChangedGuard(
    List<dynamic> response,
    this.event,
  ) : guard = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress guard;

  final _i1.FilterEvent event;
}

class ChangedThreshold {
  ChangedThreshold(
    List<dynamic> response,
    this.event,
  ) : threshold = (response[0] as BigInt);

  final BigInt threshold;

  final _i1.FilterEvent event;
}

class DisabledModule {
  DisabledModule(
    List<dynamic> response,
    this.event,
  ) : module = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress module;

  final _i1.FilterEvent event;
}

class EnabledModule {
  EnabledModule(
    List<dynamic> response,
    this.event,
  ) : module = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress module;

  final _i1.FilterEvent event;
}

class ExecutionFailure {
  ExecutionFailure(
    List<dynamic> response,
    this.event,
  )   : txHash = (response[0] as _i2.Uint8List),
        payment = (response[1] as BigInt);

  final _i2.Uint8List txHash;

  final BigInt payment;

  final _i1.FilterEvent event;
}

class ExecutionFromModuleFailure {
  ExecutionFromModuleFailure(
    List<dynamic> response,
    this.event,
  ) : module = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress module;

  final _i1.FilterEvent event;
}

class ExecutionFromModuleSuccess {
  ExecutionFromModuleSuccess(
    List<dynamic> response,
    this.event,
  ) : module = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress module;

  final _i1.FilterEvent event;
}

class ExecutionSuccess {
  ExecutionSuccess(
    List<dynamic> response,
    this.event,
  )   : txHash = (response[0] as _i2.Uint8List),
        payment = (response[1] as BigInt);

  final _i2.Uint8List txHash;

  final BigInt payment;

  final _i1.FilterEvent event;
}

class RemovedOwner {
  RemovedOwner(
    List<dynamic> response,
    this.event,
  ) : owner = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress owner;

  final _i1.FilterEvent event;
}

class SafeModuleTransaction {
  SafeModuleTransaction(
    List<dynamic> response,
    this.event,
  )   : module = (response[0] as _i1.EthereumAddress),
        to = (response[1] as _i1.EthereumAddress),
        value = (response[2] as BigInt),
        data = (response[3] as _i2.Uint8List),
        operation = (response[4] as BigInt);

  final _i1.EthereumAddress module;

  final _i1.EthereumAddress to;

  final BigInt value;

  final _i2.Uint8List data;

  final BigInt operation;

  final _i1.FilterEvent event;
}

class SafeMultiSigTransaction {
  SafeMultiSigTransaction(
    List<dynamic> response,
    this.event,
  )   : to = (response[0] as _i1.EthereumAddress),
        value = (response[1] as BigInt),
        data = (response[2] as _i2.Uint8List),
        operation = (response[3] as BigInt),
        safeTxGas = (response[4] as BigInt),
        baseGas = (response[5] as BigInt),
        gasPrice = (response[6] as BigInt),
        gasToken = (response[7] as _i1.EthereumAddress),
        refundReceiver = (response[8] as _i1.EthereumAddress),
        signatures = (response[9] as _i2.Uint8List),
        additionalInfo = (response[10] as _i2.Uint8List);

  final _i1.EthereumAddress to;

  final BigInt value;

  final _i2.Uint8List data;

  final BigInt operation;

  final BigInt safeTxGas;

  final BigInt baseGas;

  final BigInt gasPrice;

  final _i1.EthereumAddress gasToken;

  final _i1.EthereumAddress refundReceiver;

  final _i2.Uint8List signatures;

  final _i2.Uint8List additionalInfo;

  final _i1.FilterEvent event;
}

class SafeReceived {
  SafeReceived(
    List<dynamic> response,
    this.event,
  )   : sender = (response[0] as _i1.EthereumAddress),
        value = (response[1] as BigInt);

  final _i1.EthereumAddress sender;

  final BigInt value;

  final _i1.FilterEvent event;
}

class SafeSetup {
  SafeSetup(
    List<dynamic> response,
    this.event,
  )   : initiator = (response[0] as _i1.EthereumAddress),
        owners = (response[1] as List<dynamic>).cast<_i1.EthereumAddress>(),
        threshold = (response[2] as BigInt),
        initializer = (response[3] as _i1.EthereumAddress),
        fallbackHandler = (response[4] as _i1.EthereumAddress);

  final _i1.EthereumAddress initiator;

  final List<_i1.EthereumAddress> owners;

  final BigInt threshold;

  final _i1.EthereumAddress initializer;

  final _i1.EthereumAddress fallbackHandler;

  final _i1.FilterEvent event;
}

class SignMsg {
  SignMsg(
    List<dynamic> response,
    this.event,
  ) : msgHash = (response[0] as _i2.Uint8List);

  final _i2.Uint8List msgHash;

  final _i1.FilterEvent event;
}
