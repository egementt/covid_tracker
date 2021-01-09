import 'package:flutter/material.dart';

Widget shadowedFlag(String path) {
  return Container(
    
    margin: EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 25),
    height: 80,
    width: 80,
    decoration: BoxDecoration(
        
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0,3),
        )]),
        child: Image.asset("assets/$path.png", fit: BoxFit.fill,),
  );
}
