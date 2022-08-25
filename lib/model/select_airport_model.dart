import 'dart:convert';
import 'package:flutter/services.dart';
//import 'package:http/http.dart' as https;

class SelectAirportModel {
   String? airport;
   String? iata;

  SelectAirportModel(
      {required this.airport, required this.iata});

  static SelectAirportModel fromJson(Map<String, dynamic>json) => SelectAirportModel(
    airport : json['name'],
    iata : json['iata_code'],
  );
}
class AirportApi {
  static Future<List<SelectAirportModel>> getAirportsSuggestions(String query)async {
    final response = await rootBundle.loadString('json/airports.json');
    //final data=  json.decode(response);
   // final airports = data['response'] as List;
    final List airports = await json.decode(response);
    return airports.map((json) => SelectAirportModel.fromJson(json)).where((airports){
      final nameLower = airports.airport!.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList()  ;
  }
}




