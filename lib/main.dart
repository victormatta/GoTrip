import 'package:country_app/view/Page1.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(CountryApp());

class CountryApp extends StatelessWidget {
  const CountryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoTrip',
      initialRoute: 'page1',
      getPages: [
        GetPage(name: '/page1', page: () => Page1())
      ],
    );
  }
}