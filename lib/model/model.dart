class CountryModel {
  late String name;
  late String flags;
  late String region;
  late String capital;

  CountryModel(
      {required this.name,
      required this.flags,
      required this.region,
      required this.capital});

  factory CountryModel.fromJson(Map m1) {
    return CountryModel(
      name: m1['name'],
      flags: m1['flags']['png'],
      region: m1['region'],
      capital: m1['capital'] != null ? m1['capital'][0] : 'No Capital',
    );
  }

  static List<CountryModel> fromJsonList(JsonList) {
    return JsonList.map((m1) => CountryModel.fromJson(m1)).toList();
  }
}
