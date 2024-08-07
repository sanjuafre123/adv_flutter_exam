import 'dart:convert';

class CountryModel {
  final String name;
  final String capital;
  final String region;
  final String flag;

  CountryModel({
    required this.name,
    required this.capital,
    required this.region,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'],
      capital: json['capital'] != null ? json['capital'][0] : 'No Capital',
      region: json['region'],
      flag: json['flags']['png'],
    );
  }

  static List<CountryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CountryModel.fromJson(json)).toList();
  }
}