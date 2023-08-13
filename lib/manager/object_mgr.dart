import 'package:based_app/manager/crypto/crypto_mgr.dart';
import 'package:based_app/manager/manager_lifecycle_abstract.dart';
import 'package:based_app/manager/user_mgr.dart';
import 'package:based_app/manager/web3auth/web3auth_mgr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ObjectMgr extends ManagerLifecycleAbstract {
  UserMgr userMgr = UserMgr();

  // Web3AuthMgr web3AuthMgr = Web3AuthMgr();

  MagicAuthMgr magicAuthMgr = MagicAuthMgr();

  CryptoMgr cryptoMgr = CryptoMgr();

  late SharedPreferences prefs;

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    await userMgr.init();
  }

  @override
  Future<void> destroy() async {
    print('ObjectMgr destroy');
  }
}
