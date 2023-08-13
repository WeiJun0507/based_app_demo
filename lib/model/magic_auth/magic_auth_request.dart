enum MagicAuthRequestEnum {
  phone,
  email,
  google,
  wallet,
}

class MagicAuthRequest {
  MagicAuthRequestEnum? type;
  dynamic data;

  MagicAuthRequest();

  MagicAuthRequest.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        data = json['data'];

  Map<String, dynamic> toJson() => {
        'type': type.toString().split('.').last,
        'data': data,
      };
}
