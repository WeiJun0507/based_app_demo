class CoinList {
  String? name;
  String? fullName;
  double? balance;
  double? value;
  String? icon;

  CoinList({
    this.name,
    this.fullName,
    this.balance,
    this.value,
    this.icon,
  });

  CoinList.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        fullName = json['fullName'],
        balance = json['balance'],
        value = json['value'],
        icon = json['icon'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['fullName'] = fullName;
    data['balance'] = balance;
    data['value'] = value;
    data['icon'] = icon;
    return data;
  }
}
