import 'dart:convert';

import 'package:country_app/models/country_model.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  Future<List<CountryModel>> getCountryList() async{
    List<CountryModel> countryList = [];

    try {
      final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
      if(response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);

        int maxCountries = 12;
        for (int v = 0; v < responseData.length && v < maxCountries; v++) {
          countryList.add(CountryModel.fromJson(responseData[v]));
        }
      } else {
        throw Exception('Countries not found.');
      }

    } catch (e) {
      print('Error: $e');
    }

    return countryList;
  }
}


// countryList.assignAll(data.sublist(0, 10));