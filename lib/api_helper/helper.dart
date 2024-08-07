import 'package:http/http.dart';

class ApiHelper {
  Future fromApiData() async {
    Uri url = Uri.parse(
        'https://restcountries.com/v3.1/all?_gl=1');

    Response response = await get(url);

    if (response.statusCode == 200) {
      final json = response.body;
      return json;
    } else {
      return {};
    }
  }
}
