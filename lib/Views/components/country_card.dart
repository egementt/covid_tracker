import 'package:covid_tracker/Views/components/shadowed_flag.dart';
import 'package:covid_tracker/models/covid_data.dart';
import 'package:flutter/material.dart';


Widget myCard(CovidData covidData, BuildContext context) {
  
 // String formattedDate = DateFormat('yyyy-MM-dd - kk:mm').format(covidData.lastUpdate);
  return Center(
    child: Container(
      margin: EdgeInsets.only(left: 10, top: 5, right: 50, bottom: 5),
      height: MediaQuery.of(context).size.height,
      width: (MediaQuery.of(context).size.width) - 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: (MediaQuery.of(context).size.width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            shadowedFlag(covidData.countryText),
            Text(
              covidData.countryText,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    title: Text(
                      "Total Cases",
                      style: TextStyle(
                          color: Colors.blue[700], fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      covidData.totalCasesText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Total Deaths",
                      style: TextStyle(
                          color: Colors.red[700], fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      covidData.totalDeathsText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Total Recovers",
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      covidData.totalCasesText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Last Update Time",
                      style: TextStyle(
                          color: Colors.purple[700],
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      covidData.lastUpdate
                      ,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

/*Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    globeStatBox("Total Case", covidData.totalCasesText,
                                    Colors.blue.withOpacity(0.4)),
                                
                                globeStatBox(
                                    "Total Recovers",
                                    covidData.totalRecoveredText,
                                    Colors.green.withOpacity(0.4))
                  ],
                ),
              )  */
