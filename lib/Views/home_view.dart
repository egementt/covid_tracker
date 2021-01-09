import 'package:covid_tracker/Service/api_service.dart';
import 'package:covid_tracker/Views/country_card.dart';
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
  Future<CovidData> _future;

  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureList = apiService.fetchData();
    _future = apiService.loadData("world");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid19 Tracker "),
      ),
      body: _myFuture(context),
    );
  }

  _myFutureList(BuildContext context) {
    return FutureBuilder<List<CovidData>>(
        future: _futureList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
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

  _myFuture(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _data = snapshot.data;

            return myCard(_data, context);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
