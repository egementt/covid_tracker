import 'dart:ui';

import 'package:covid_tracker/Views/components/stat_box.dart';
import 'package:covid_tracker/Views/home_view.dart';
import 'package:covid_tracker/models/covid_data.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final covidData;
  CustomAppBar({this.covidData});
  @override
  Widget build(BuildContext context) {
    CovidData covidData = this.covidData;
    return Stack(
      children: [
        AppBar(
          title: Text('Covid Tracker'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[700],
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.menu_rounded),
              iconSize: 24.0,
              onPressed: () {
                drawerKey.currentState.openDrawer();
              }),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        Positioned(
            top: 85,
            left: 15,
            right: 15,
            child: Text(
              "Global",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
            left: 10,
            right: 10,
            top: 120,
            child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          spacing: 12,
                          children: [
                            globeStatBox("Total Case", covidData.totalCasesText,
                                Colors.blue.withOpacity(0.4)),
                            globeStatBox(
                                "Total Deaths",
                                covidData.totalDeathsText,
                                Colors.red.withOpacity(0.4)),
                            globeStatBox(
                                "Total Recovers",
                                covidData.totalRecoveredText,
                                Colors.green.withOpacity(0.4))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ))),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(200);
}
