import 'dart:convert';
import 'package:flutter/services.dart';
class CityModel {
String city ;
String country ;
String URLpicture;
CityModel({
      required this.city,
      required this.country,
      required this.URLpicture
});


static CityModel fromJson(Map<String , dynamic> json)=>CityModel(
     city:    json["city"],
     country: json["country"],
    URLpicture:  json["URLpicture"]
);
}

class CityApi {
  static Future<List<CityModel>> getCitiesSuggestions(String query)async {
    final response = await rootBundle.loadString('json/destinations.json');
    final List cities = await json.decode(response);
    return cities.map((json) => CityModel.fromJson(json)).where((cities){
    final nameLower = cities.city.toLowerCase();
    final queryLower = query.toLowerCase();
    return nameLower.contains(queryLower);
    }).toList();
  }
  }

