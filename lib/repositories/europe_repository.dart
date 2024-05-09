import 'dart:convert';

import 'package:country_app/models/country_model.dart';
import 'package:http/http.dart' as http;

class EuropeRepository {
  Future<List<CountryModel>> getEuropeList() async {
    List<CountryModel> europeList = [];

    try{
      final response = await http.get(Uri.parse('https://restcountries.com/v3.1/subregion/europe'));
      if(response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);

        int maxCountries = 14;

        for (int e = 0; e < responseData.length && e < maxCountries; e++) {
          europeList.add(CountryModel.fromJson(responseData[e]));
        }
      } else {
        throw Exception('Europe countries not found');
      }
    } catch (e) {
      print("ERROR: ${e}");
    }

    return europeList;

  }
}