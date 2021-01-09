import 'package:covid_tracker/models/covid_data.dart';
import 'package:flutter/material.dart';

Widget myCard(CovidData covidData, BuildContext context) {
  return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Card(
          child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/${covidData.countryText}.png",
            width: 60,
            height: 60,
            fit: BoxFit.fill,
          ),
        ),
        VerticalDivider(
          color: Colors.black54,
          width: 5,
        ),
        Center(
          child: Container(
            height: 120,
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  covidData.countryText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
               
              ],
            ),
          ),
        ),
      ])));
}

Widget myStats(String title, String value, Color color) {
  return Center(
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: color, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Chip(
          label: Text(
            value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          backgroundColor: color,
        ),
      ],
    ),
  );
}
