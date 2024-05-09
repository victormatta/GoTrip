import 'package:flutter/material.dart';

class CardCountry extends StatefulWidget {
  final String? flagImage;
  final String? name;
  final String? region;
  final String? languages;
  final int? population;
  final String? coinName;

  const CardCountry({super.key, this.flagImage, this.name, this.region, this.languages, this.population, this.coinName});

  @override
  State<CardCountry> createState() => CardCountryState();
}

class CardCountryState extends State<CardCountry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      // height: 259,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 196, 196, 196),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                // width: 153,
                height: 128,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),
                ),
                child: Center(child: 
                widget.flagImage != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(widget.flagImage.toString(),
                fit: BoxFit.cover,
                width: 225,
                height: 128,
                ),
                )
                : Container(),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Text('Name: ${widget.name}'),
                  Text('Region: ${widget.region}'),
                  Text('Language: ${widget.languages}'),
                  Text('Population: ${widget.population}'),
                  Text('Coin: ${widget.coinName}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}