import 'dart:convert';
import 'package:http/http.dart' as https;

class AirportModel {
   String? airport;
   String? iata;

  AirportModel(
      {required this.airport, required this.iata});

  static AirportModel fromJson(Map<String, dynamic>json) => AirportModel(
    airport : json['name'],
    iata : json['iata_code']
  );
}
class AirportApi {
  static Future<List<AirportModel>> getAirportsSuggestions(String query)async {
    final response = await https
        .get(Uri.parse('https://airlabs.co/api/v9/airports?api_key=3db1de03-948f-442f-a84f-90a54ac7666b'));
    final data= await json.decode(response.body);
    final airports = data['response'] as List;
    return airports.map((json) => AirportModel.fromJson(json)).where((airports){
      final nameLower = airports.airport!.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList()  ;
  }
}




