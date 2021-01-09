import 'dart:async';
import 'dart:ui';

import 'package:covid_tracker/Service/api_service.dart';
import 'package:covid_tracker/models/covid_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'home_view.dart';

CovidData myCovData;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 5;

  _loadScreen() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    Future<CovidData> _future = ApiService().loadData("world");
    _future.then((value) {
      setState(() {
        myCovData = value;
      });
      
      print(value);
      if (myCovData != null) _loadScreen();
    }, onError: (e) => print(e));
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffFC466B), Color(0xff3F5EFB)])),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/mask.json',
                      width: 150,
                      height: 150,
                      reverse: true,
                      alignment: Alignment.center),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Center(
                      child: TypewriterAnimatedTextKit(
                        text: [
                          "Loading",
                        ],
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "Canterbury"),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
