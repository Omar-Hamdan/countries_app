import 'dart:convert';
import '../model/country_model.dart';
import 'package:http/http.dart' as http;

Future<List<Country>> getCountriesDataList() async {
  const url =
      'https://countriesnow.space/api/v0.1/countries/info?returns=currency,flag,dialCode';
  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    var jsonArray = jsonData['data'];
    List<Country> countries = [];
    for (var countryArray in jsonArray) {
      Country country = Country.fromJson(countryArray);
      countries.add(country);
    }
    return countries;
  }
  return [];
}
