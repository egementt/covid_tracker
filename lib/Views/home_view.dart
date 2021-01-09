
import 'package:covid_tracker/Service/api_service.dart';
import 'package:covid_tracker/Views/about_us.dart';
import 'package:covid_tracker/Views/components/country_card.dart';
import 'package:covid_tracker/Views/components/custom_appbar.dart';
import 'package:covid_tracker/Views/splash_screen.dart';
import 'package:covid_tracker/models/covid_data.dart';
import 'package:flutter/material.dart';

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<CovidData>> _futureList;


  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureList = apiService.fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: drawerKey,
        drawer: Drawer(
         child: ListView(
           padding: EdgeInsets.zero,
           children: [
             DrawerHeader(
               
               decoration: BoxDecoration(
                 
                 color: Colors.deepPurple[700], shape: BoxShape.rectangle
               ),
               child: Center(child: Text("CoV-19 Tracker Menu", style: TextStyle(
                 color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic
               ),)),
             ),
             
                 ListTile(
                   title: Text("About Us"),
                   leading: Icon(Icons.info, color: Colors.deepPurple,),
                   onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AboutUsView()))
                 ),
                 Divider(height: 0.5,)
               
             
           ],
         ),
        ),
        appBar: CustomAppBar(covidData: myCovData),
        body: _myFutureList(context));
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
