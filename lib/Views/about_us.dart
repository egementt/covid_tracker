import 'package:covid_tracker/Views/components/shadowed_flag.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
        Text("Just made for fun & learn.", style: TextStyle(fontWeight: FontWeight.bold),),
        Lottie.asset('assets/mask.json',
                      width: 150,
                      height: 150,
                      reverse: true,
                      alignment: Alignment.center),

       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Icon(Icons.favorite, color: Colors.red,),  
         Text("Made with Flutter"),
         Icon(Icons.favorite, color: Colors.red,)
       ],),
       Text("Github: @egementt", style: TextStyle(color: Colors.blueAccent),)
      ],),
    );
  }
}