import 'dart:convert';

import 'package:country_app/models/country_model.dart';
import 'package:http/http.dart' as http;

class SouthAmericaRepository {
  Future<List<CountryModel>> getSouthAmerica() async {
    List<CountryModel> southAmericaList = [];

    try{
      final response = await http.get(Uri.parse('https://restcountries.com/v3.1/subregion/south%20america'));
      if(response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);

        int maxCountries = 14;

        for (int s = 0; s < responseData.length && s < maxCountries; s++) {
          southAmericaList.add(CountryModel.fromJson(responseData[s]));
        }
      } else {
        throw Exception('South America countries not found.');
      }
    } catch (e) {
      print('ERROR: ${e}');
    }

    return southAmericaList;
    
  }
}