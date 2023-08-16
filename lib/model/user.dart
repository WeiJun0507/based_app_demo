import 'package:magic_ext_oauth/types/oid_type.dart';
import 'package:web3x/web3x.dart';

class User {
  String? token;
  EthereumAddress? eotAddress;
  EthereumAddress? safeAddress;

  String? name;
  String? familyName;
  String? givenName;
  String? middleName;
  String? nickname;
  String? preferredUsername;
  String? profile;
  String? picture;
  String? website;
  String? gender;
  String? birthdate;
  String? zoneinfo;
  String? locale;
  int? updatedAt;

  // OpenIDConnectEmail
  String? email;
  bool? emailVerified;

  // OpenIDConnectPhone
  String? countryCode;
  String? phoneNumber;
  bool? phoneNumberVerified;

  // OpenIDConnectAddress
  OIDAddress? address;

  User();

  User.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        eotAddress = json['eotAddress'] != null
            ? json['eotAddress'] is! EthereumAddress
                ? EthereumAddress.fromHex(json['eotAddress'])
                : json['eotAddress']
            : null,
        safeAddress = json['safeAddress'] != null
            ? json['safeAddress'] is! EthereumAddress
                ? EthereumAddress.fromHex(json['safeAddress'])
                : json['safeAddress']
            : null,
        name = json['name'],
        familyName = json['familyName'],
        givenName = json['givenName'],
        middleName = json['middleName'],
        nickname = json['nickname'],
        preferredUsername = json['preferredUsername'],
        profile = json['profile'],
        picture = json['picture'],
        website = json['website'],
        gender = json['gender'],
        birthdate = json['birthdate'],
        zoneinfo = json['zoneinfo'],
        locale = json['locale'],
        updatedAt = json['updatedAt'],
        email = json['email'],
        emailVerified = json['emailVerified'],
        phoneNumber = json['phoneNumber'],
        phoneNumberVerified = json['phoneNumberVerified'],
        address = json['address'];

  Map<String, dynamic> toJson() => {
        'token': token,
        'eotAddress': eotAddress?.hexEip55,
        'safeAddress': safeAddress?.hexEip55,
        'name': name,
        'familyName': familyName,
        'givenName': givenName,
        'middleName': middleName,
        'nickname': nickname,
        'preferredUsername': preferredUsername,
        'profile': profile,
        'website': website,
        'gender': gender,
        'birthdate': birthdate,
        'zoneinfo': zoneinfo,
        'locale': locale,
        'updatedAt': updatedAt,
        'email': email,
        'emailVerified': emailVerified,
        'phoneNumber': phoneNumber,
        'phoneNumberVerified': phoneNumberVerified,
        'address': address,
      };
}
