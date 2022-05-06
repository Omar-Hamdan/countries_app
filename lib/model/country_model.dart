class Country {
  String name;
  String currency;
  String flag;
  String dialCode;

  Country({
    required this.name,
    required this.currency,
    required this.flag,
    required this.dialCode,
  });

  static Country fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] ?? '',
      currency: json['currency'] ?? '',
      flag: json['flag'] ?? '',
      dialCode: json['dialCode'] ?? '',
    );
  }
}
