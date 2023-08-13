import 'dart:io';

import 'package:based_app/manager/crypto/polygon_mumbai.dart';
import 'package:based_app/manager/manager_lifecycle_abstract.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class CryptoMgr extends ManagerLifecycleAbstract {
  late Client httpClient;

  late PolygonMumbai polygonMumbai;

  @override
  Future<void> init() async {
    var ioClient = HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    httpClient = IOClient(ioClient);

    polygonMumbai = PolygonMumbai(httpClient);
  }

  @override
  Future<void> destroy() async {}
}
