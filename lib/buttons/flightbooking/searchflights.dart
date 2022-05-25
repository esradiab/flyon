import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as https;
import 'package:untitled/buttons/flightbooking/passangerinformations.dart';

class SearchFlights extends StatefulWidget {
  final from, to;

  final departureDate;

  final flightClass, payment;

  final adult, child, infant;
  final flightType;

  SearchFlights(this.from, this.to, this.departureDate, this.flightClass,
      this.payment, this.adult, this.child, this.infant, this.flightType);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchFlights(from, to, departureDate, flightClass, payment, adult,
        child, infant, flightType);
  }
}

class _SearchFlights extends State<SearchFlights> {
  String from, to;
  final departureDate;
  final flightType;
  final flightClass, payment;
String flightdate = ' ';
  final adult, child_, infant;
  late String departureTime, arrivalTime, flightId, airwayId;

  _SearchFlights(this.from, this.to, this.departureDate, this.flightClass,
      this.payment, this.adult, this.child_, this.infant, this.flightType);

  late String airwayName, assetPic;
  bool flag = false;

  Future getData() async {
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.

    // We need access to http for loading this data..
    var response = await https.get(Uri.parse(
        'http://airlabs.co/api/v9/schedules?dep_iata=$from&arr_iata=$to&api_key=3db1de03-948f-442f-a84f-90a54ac7666b'));

    // now we have response as String from local json or and API request...
    var data = jsonDecode(response.body);
    var flight = data['response'] as List;
    //print(flight);
    return flight;
    //return flight ;
    // we have a JSON.
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          //set app bar Background color..
          backgroundColor: Color(0xff78c6a3),
          //app bar title..
          title: Text(
            "choose a flight",
            //text style..
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // Decode the JSON
              if (snapshot.data == null) {
                getData();
                return Container(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()),
                );
              }


              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PassengerInformation(
                                        from,
                                        to,
                                        adult,
                                        child_,
                                        infant,
                                        flightType,
                                        snapshot.data[index]['airline_iata'],
                                        snapshot.data[index]['flight_iata'],
                                        flightdate,
                                        snapshot.data[index]['dep_time'],
                                        snapshot.data[index]['arr_time'])));
                          },
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 170,
                                  width: 300,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0x2796c1b3),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("from: " + from),
                                          Text("to: " + to),
                                          Text(
                                            "airline: " + snapshot.data[index]['airline_iata']
                                          ),
                                          Text("departureTime: " +
                                              snapshot.data[index]['dep_time'] ),
                                          Text(
                                            "arrivalTime: " +
                                                snapshot.data[index]['arr_time'] ,
                                          ),
                                          Text("FlightId: " +
                                              snapshot.data[index]['flight_iata']),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                              ]),
                        ),
                      );
                },
                itemCount: snapshot.data.length,
              );

            }

            ));
  }
}