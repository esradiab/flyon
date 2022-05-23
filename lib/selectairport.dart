
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:untitled/model/airportmodel.dart';


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
          TypeAheadField<AirportModel?>(
            hideSuggestionsOnKeyboardHide: false,
            textFieldConfiguration: TextFieldConfiguration(
              controller: _typeAheadController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Search airport',
              ),
            ),
            itemBuilder: (BuildContext context, AirportModel? suggestion) {
              final airport = suggestion!;
              return ListTile(
                title: Text( airport.airport?? "not found"),
                leading: Text(airport.iata?? "not fond")
              );
            },
            onSuggestionSelected: (AirportModel? suggestion) {
              {
                this._typeAheadController.text = suggestion!.airport! ;
                this.selectedAirport = suggestion.iata  ;

              }
            },
            noItemsFoundBuilder: (context) => Container(
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
              Navigator.pop(context , selectedAirport) ;
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
                child: Text("ok" , style: TextStyle(
                  fontSize: 18 ,
                  fontWeight: FontWeight.w700 ,
                  color: Colors.white ,
                ),)),
          )
        ],
      ),
    );
  }
}
