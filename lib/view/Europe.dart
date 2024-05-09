import 'package:country_app/controllers/country_controller.dart';
import 'package:country_app/models/country_model.dart';
// import 'package:country_app/repositories/europe_repository.dart';
import 'package:country_app/widgets/card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EuropePage extends StatelessWidget {
  static final Key europeKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GoTrip',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 197, 41, 224),
      ),
      endDrawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 197, 41, 224),
              ),
              child: Text(
                'Opções de Navegação',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Asia'),
              onTap: () {
                Get.to(context);
              },
            ),
            ListTile(
              title: const Text('North America'),
              onTap: () {
                Get.to(context);
              },
            ),
            ListTile(
              title: Text('Central America'),
              onTap: () {
                Get.to(context);
              },
            ),
            ListTile(
              title: const Text('South America'),
              onTap: () {
                Get.to(context);
              },
            ),
          ],
        ),
      ),
      body: RealTripEurope(key: EuropePage.europeKey),
    );
  }
}

class RealTripEurope extends StatelessWidget {
  final controller = Get.put(CountryController());
  
  RealTripEurope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.europeList(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if(snapshot.hasError) {
            return const Center(child: Text('ERROR'));
          }
          if(snapshot.hasData) {
            final List<CountryModel> country = snapshot.data as List<CountryModel>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 30,
                ),
                itemCount: country.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardCountry(
                            flagImage: "${country[index].flags!['png'] ?? ''}",
                            name: "${country[index].name!['common'] ?? ''}",
                            region: "${country[index].subRegion}",
                            population: country[index].population,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
             
          }
        }

        return Container();
      },
      );
  }
}