import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:untitled/model/airportmodel.dart';
import 'package:untitled/model/select_airport_model.dart';
import 'package:http/http.dart' as http;

class SelectAirport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelectAirport();
  }
}

class _SelectAirport extends State<SelectAirport> {
  final TextEditingController _typeAheadController = TextEditingController();
  String? selectedAirport;
  AirportModel? airportModel;
  List? airportData = [] ;

  Future insertAirportData() async {
    var map = airportData!.cast<Map<String, dynamic>>();
    //print(map);
    var url = Uri.parse("http://172.20.10.5/booking/insert_airports_data.php");
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request('POST', url);
    request.bodyFields = {
     'data': json.encode(map)
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    //print(data);
    if (response.statusCode == 200) {
      print(request.bodyFields);
      //return BookingDataModel.fromJson(response) ;
    } else {
      print("error");
      throw Exception("failed to load post");
    }
  }

 /* Future <AirportModel> getData() async {
    final response = await rootBundle.loadString('json/airports.json');

    airportModel = AirportModel.fromJson(json.decode(response));
    print(airportModel);
    return airportModel!;
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          //set hight..
          toolbarHeight: 50,
          //app bar background color..
          backgroundColor: Color(0xff78c6a3),
          //app bar title..
          title: Text(
            "select airport",
            //text style..
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
            children: [
              TypeAheadField<SelectAirportModel?>(
                hideSuggestionsOnKeyboardHide: false,
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _typeAheadController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    hintText: 'Search airport',
                  ),
                ),
                itemBuilder: (BuildContext context,
                    SelectAirportModel? suggestion) {
                  final airport = suggestion!;
                  return ListTile(
                      title: Text(airport.airport ?? "not found"),
                      leading: Text(airport.iata ?? "not fond")
                  );
                },
                onSuggestionSelected: (SelectAirportModel? suggestion) {
                  {
                    this._typeAheadController.text = suggestion!.airport!;
                    this.selectedAirport = suggestion.iata;
                  }
                },
                noItemsFoundBuilder: (context) =>
                    Container(
                      height: 100,
                      child: Center(
                        child: Text(
                          "airports not found!",
                          style: TextStyle(fontSize: 24, color: Colors.grey),
                        ),
                      ),
                    ),

                suggestionsCallback: AirportApi.getAirportsSuggestions,
              ),
              SizedBox(height: 10,),
              MaterialButton(
                onPressed: () {

                  Navigator.pop(context, selectedAirport);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    width: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff12ba72),
                          Color(0xff92b6aa),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 9,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("ok", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),)),
              ),
              ////////////////////////////////////////////////////////////////////////
            /*  FutureBuilder<AirportModel>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      late var dataSize = snapshot.data!.airport.length;
                       airportData = [
                          for (int i = 0; i < dataSize; i++)
                            {
                              "name": snapshot.data!.airport[i].name,
                              "id": snapshot.data!.airport[i].id,
                              "country_id": snapshot.data!.airport[i].countryId,
                            }
                        ];

                      print(airportData);
                      return Container(

                      );
                    }
                    else if (snapshot.hasError) {
                     return Text('${snapshot.hasError}');
                } else {
                   return Text('error');
                }
                   // insertAirportData();
              }
              )*/
            ])
    );
  }
}
