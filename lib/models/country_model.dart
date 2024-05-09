class CountryModel {
  Map<dynamic, String>? name;
  String? common;
  String? official;
  String? subRegion;
  String? languages;
  int? population;
  Map<dynamic, String>? flags;
  String? png;
  Map<String, dynamic>? currencies;

  CountryModel({this.name, this.common, this.official, this.subRegion, this.languages, this.population, this.png, this.currencies, this.flags});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      common: json['name']?['common'],
      official: json['name']?['official'],
      subRegion: json['subregion'],
      population: json['population'],
      flags: json['flags'],
      png: json['flags']?['png'],

    );
  }
}