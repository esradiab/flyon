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

//////////////////////////////////////////////////Get Airway Name class//////////////////////////////////////////////////
/*class GetAirwayName extends StatefulWidget {
  final flightId;

  GetAirwayName(this.flightId);

  @override
  State<GetAirwayName> createState() => _GetAirwayNameState(flightId);
}

class _GetAirwayNameState extends State<GetAirwayName> {
  String name = " ";
  final flightId;

  _GetAirwayNameState(this.flightId);

  Future getData() async {
    var response =
        DefaultAssetBundle.of(context).loadString('json/airway.json');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            // Decode the JSON
            late var data = json.decode(snapshot.data.toString());
            if (data == null) {
              return Center(
                child: Text("Loading..."),
              );
            } else {

              for (int index = 0; index < data.length; index++) {
                if (data[index]["id"] == widget.flightId) {
                  name = data[index]["name"];
                }
              }
              return Container(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              );
            }
          }),
    );
  }
}

/////////////////////////////////////////////////Get Airway Picture class/////////////////////////////////////////////////

class GetAirwayPic extends StatefulWidget {
  final id;

  GetAirwayPic(this.id);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetAirwayPic(id);
  }
}

class _GetAirwayPic extends State<GetAirwayPic> {
  final id;
  late String assetPic;

  _GetAirwayPic(this.id);

  Future getData() async {
    var response =
        DefaultAssetBundle.of(context).loadString('json/airway.json');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 100,
      width: 100,
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            // Decode the JSON
            late var data = json.decode(snapshot.data.toString());
            if (data == null) {
              return Center(
                child: Text("Loading..."),
              );
            } else {
              for (int index = 0; index < data.length; index++) {
                if (data[index]["id"] == id) {
                  assetPic = data[index]["pic"][0];
                }
              }
              return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(assetPic))));
            }
          }),
    );
  }
}   */

/////////////////////////////////////////////////Get Airway Price class//////////////////////////////////////////////////

/*class GetAirwayPrice extends StatefulWidget {
  final from, to;
  final id;

  final flightClass;

  final adult, child, infant;
  final flightType;

  GetAirwayPrice(this.from, this.to, this.flightClass, this.adult, this.child,
      this.infant, this.flightType, this.id);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetAirwayPrice(
        from, to, flightClass, adult, child, infant, flightType, id);
  }
}

class _GetAirwayPrice extends State<GetAirwayPrice> {
  String from, to;
  final flightClass;
  final adult, child, infant;
  final flightType;
  final id;
  late String class_, flightType_;
  double totalPrice = 0, adultPrice = 0, childPrice = 0, infantPrice = 0;

  _GetAirwayPrice(this.from, this.to, this.flightClass, this.adult, this.child,
      this.infant, this.flightType, this.id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('json/prices/$id.json'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
           var data = json.decode(snapshot.data.toString());
          if (data == null) {
            return Center(
              child: Text("Loading..."),
            );
          } else {
            if (flightType == 1) flightType_ = 'one_way';
            else flightType_ = 'round_trip';
            if (flightClass == 'economy class') class_ = 'economy_class';
            else if (flightClass == 'business class') class_ = 'business_class';
            else if (flightClass == 'first class') class_ = 'first_class';

            for (int index = 0; index < data.length; index++) {
              String fromData = data[index]['from'] ;
              String toData = data[index]['to'] ;
              if (from.toLowerCase() ==  fromData.toLowerCase() && to.toLowerCase() == toData.toLowerCase()) {
                adultPrice = data[index][flightType_][class_]['adult'];
                childPrice = data[index][flightType_][class_]['child'];
                infantPrice = data[index][flightType_][class_]['infant'];
              }
            }
            //get total price for adults passengers by adding adults price to total price variable..
            //  i  used loop so if I have more than one adult passenger it will add the price ..
            for(int i = 0 ; i<adult ; i++)
              totalPrice = adultPrice + totalPrice ;

            if(child > 0){
              for(int i = 0 ; i<child ; i++)
                totalPrice = childPrice + totalPrice ;
            }

            if(infant > 0){
              for(int i = 0 ; i<infant ; i++)
                totalPrice = infantPrice + totalPrice ;
            }

            return Text('total price: $totalPrice LYD');
          }
        },
      ),
    );
  }
}*/
