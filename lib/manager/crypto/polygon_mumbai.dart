import 'package:based_app/main.dart';
import 'package:http/http.dart';
import 'package:web3x/web3x.dart';

class PolygonMumbai {
  late Client client;
  late Web3Client webClient;

  PolygonMumbai(Client c) {
    client = c;
    webClient = Web3Client("https://rpc-mumbai.maticvigil.com/", c);
  }

  Future<EtherAmount> getBalance() async => await webClient.getBalance(
        objectMgr.userMgr.userInfo!.eotAddress!,
      );
}
