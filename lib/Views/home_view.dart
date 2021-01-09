

import 'package:covid_tracker/Service/api_service.dart';
import 'package:covid_tracker/Views/components/country_card.dart';
import 'package:covid_tracker/Views/components/custom_appbar.dart';
import 'package:covid_tracker/Views/splash_screen.dart';
import 'package:covid_tracker/models/covid_data.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Future<List<CovidData>> _futureList;
  
 

  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureList = apiService.fetchData();
    
  }

  Widget build(BuildContext context) {
    
    return Scaffold(appBar: CustomAppBar(covidData:myCovData ), body: _myFutureList(context) );
  }

  _myFutureList(BuildContext context) {
    return FutureBuilder<List<CovidData>>(
        future: _futureList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  final _data = snapshot.data[index + 1];

                  return myCard(_data, context);
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }



   
}
