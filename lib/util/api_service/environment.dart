enum Environment {
  dev('DEV'),
  prod('PROD');

  const Environment(this.value);

  final String value;
}

extension TronDomain on Environment {
  String get tronDomain {
    const String testUrl = 'https://api.shasta.trongrid.io';
    const String mainUrl = 'https://api.trongrid.io';

    switch (this) {
      case Environment.dev:
        return testUrl;
      case Environment.prod:
        return mainUrl;
      default:
        return mainUrl;
    }
  }
}

extension ScanDomain on Environment {
  String get scanDomain {
    const String testUrl = "https://apilist.tronscanapi.com";
    const String mainUrl = "https://apilist.tronscanapi.com";

    switch (this) {
      case Environment.dev:
        return testUrl;
      case Environment.prod:
        return mainUrl;
      default:
        return mainUrl;
    }
  }
}

extension GRPCDomain on Environment {
  String get grpcDomain {
    const String testUrl = "grpc.shasta.trongrid.io";
    const String mainUrl = "grpc.trongrid.io";

    switch (this) {
      case Environment.dev:
        return testUrl;
      case Environment.prod:
        return mainUrl;
      default:
        return mainUrl;
    }
  }
}

extension PolygonMumbai on Environment {
  String get apiKey => "TDT1HJVX8FZHGTUCAXY7EC68XP4SWHZ6Z9";
  String get polygonMumbai {
    const String testUrl = "https://api.polygonscan.com/api";
    const String mainUrl = "https://rpc-mumbai.maticvigil.com";

    switch (this) {
      case Environment.dev:
        return testUrl;
      case Environment.prod:
        return mainUrl;
      default:
        return mainUrl;
    }
  }
}
