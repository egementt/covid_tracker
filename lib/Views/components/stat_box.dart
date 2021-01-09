import 'package:flutter/material.dart';

Widget countryStatBoxSmall(String title, String value, Color color) {
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

Widget globeStatBox(String title, String value, Color color) {
  return Center(
    child: Column(
      children: [
        Container(
          height: 70,
          width: 120,
          decoration: BoxDecoration(
              color: color.withOpacity(0.8),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                ),
              ),
             
              Center(
    
                  child: Text(
                  
                value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
                    
              ))
            ],
          ),
        )
      ],
    ),
  );
}
