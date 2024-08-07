import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dart:convert';

import '../model/model.dart';

class HomeProvider with ChangeNotifier {
  List<CountryModel> _countries = [];
  final List<CountryModel> _savedCountries = [];

  List<CountryModel> get countries => _countries;

  List<CountryModel> get savedCountries => _savedCountries;

  Future<void> fetchCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all?_gl=1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      _countries = CountryModel.fromJsonList(jsonList);
      notifyListeners();
    } else {
      throw {};
    }
  }

  HomeProvider() {
    fetchCountries();
  }

  void saveCountry(CountryModel country) {
    _savedCountries.add(country);
    notifyListeners();
  }
}
