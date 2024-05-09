import 'package:country_app/models/country_model.dart';
import 'package:country_app/repositories/country_repository.dart';
import 'package:country_app/repositories/europe_repository.dart';
import 'package:country_app/repositories/south_america_country_repository.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  CountryRepository repo = CountryRepository();
  // var countryList = <CountryModel>[].obs;

  // SouthAmericaRepository repoSouthAmerica = SouthAmericaRepository();
  var repoSouthAmerica = SouthAmericaRepository();

  EuropeRepository repoEurope = EuropeRepository();
  // var europeList = <CountryModel>[].obs;

  Future<List<CountryModel>> countryList() async => await repo.getCountryList();
  Future<List<CountryModel>> southAmericaList() async => repoSouthAmerica.getSouthAmerica();
  Future<List<CountryModel>> europeList() async => await repoEurope.getEuropeList();

  // getDataForRegion(String region) {
  //   if(region == 'southAmerica') {
  //     Future<List<CountryModel>> southAmericaList() async => await repoSouthAmerica.getSouthAmerica();
  //   }
  //   if(region == 'europe') {
  //     Future<List<CountryModel>> europeList() async => await repoEurope
  //   }
  // }
}