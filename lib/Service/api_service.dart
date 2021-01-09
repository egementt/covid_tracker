import 'dart:convert';
import 'package:covid_tracker/models/covid_data.dart';
import 'package:http/http.dart' as http;

List<CovidData> parseData(String responseBody) {
  final data = json.decode(responseBody).cast<Map<String, dynamic>>();
  return data.map<CovidData>((json) => CovidData.fromJson(json)).toList();
}

class ApiService {
  // ignore: missing_return
  Future<List<CovidData>> fetchData() async {
    
    final response = await http.get("https://covid-19.dataflowkit.com/v1");

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return parseData(response.body);
      }
    } else
      throw Exception(
        "Failed to get data: ${response.statusCode}",
      );
  }

  Future<CovidData> loadData(String index) async {
    final response =
        await http.get("https://covid-19.dataflowkit.com/v1/$index");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      CovidData covidData = new CovidData.fromJson(jsonResponse);
      return covidData;
    } else
      return null;
  }

  
}
