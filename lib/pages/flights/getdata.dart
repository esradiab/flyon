import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/buttons/flightbooking/editbooking.dart';
import 'package:untitled/model/bookingdata.dart';

class GetDataFrom extends StatefulWidget {
  final email;
  final bookingId;

  GetDataFrom(this.email, this.bookingId);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetDataFrom(email, bookingId);
  }
}

class _GetDataFrom extends State<GetDataFrom> {
  final phone;
  final bookingId;
  late String phoneNo;

  late String email;
  late int count = 0;

  _GetDataFrom(this.phone, this.bookingId);

   BookingDataModel? data ;

  Future<BookingDataModel> getData() async {
    var url = Uri.parse("http://172.20.10.5/booking/getdata.php");
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.
    // We need access to http for loading this data..
    var response = await http.get(url);
   var responseBody=jsonDecode(response.body); 
    this.data = BookingDataModel.fromJson(responseBody);

    return data!;
  }
  Future deleteData ()async {

    var url = Uri.parse("http://172.20.10.5/booking/deletedata.php");
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', url);
    request.bodyFields ={
      'booking_id' : bookingId,
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if(response.statusCode == 200){
      print(request.bodyFields);
    }
    else{
      print("error");
      throw Exception("failed to load post");
    }
  }
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
            "your information",
            //text style..
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Lobster'
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<BookingDataModel>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  late int bookingDataSize = snapshot.data!.booking.length;
                  late int passengerDataSize = snapshot.data!.passengers.length;
                  for (int i = 0; i < bookingDataSize; i++)
                    if (snapshot.data!.booking[i].bookingId == bookingId) {
                      email = snapshot.data!.booking[i].email;
                      phoneNo = snapshot.data!.booking[i].phone;
                    }
                   List? passengerData = [
                    for (int i = 0 ; i < passengerDataSize; i++)
                      if (bookingId == snapshot.data!.passengers[i].bookingId)
                        {
                          "full_name": snapshot.data!.passengers[i].fullName,
                          "age": snapshot.data!.passengers[i].age,
                          "gender": snapshot.data!.passengers[i].gender,
                          "booking_id": snapshot.data!.passengers[i].bookingId
                        }
                  ];
                  return Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "this is  your information booking with booking id  :",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "Lora",
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 4),
                            child: Text(
                              bookingId,
                              style: TextStyle(
                                  fontFamily: "Lora",
                                  fontSize: 18,
                                  color: Color(0xff12ba72),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              child: Text(
                                "you can edit or delete your booking data from here!",
                                style: TextStyle(
                                    fontFamily: "Lora",
                                    fontSize: 18,
                                    color: Colors.black),
                              )),
                          Container(
                            height: 80,
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 4,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      child: Text(
                                    "email:  " + email,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )),
                                  Container(
                                      child: Text(
                                    "phone: " + phoneNo,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )),
                                ]),
                          ),
                          Container()
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Passenger Information:",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      for (int i = 0; i < passengerData.length; i++)
                        //if (bookingId == snapshot.data!.passengers[i].bookingId)
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width - 4,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "full name: " + passengerData[i]['full_name'],
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                              Container(
                                  child: Text(
                                "age: " + passengerData[i]['age'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              )),
                              Container(
                                  child: Text(
                                "gender: " + passengerData[i]['gender'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              )),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditBookingData(email,
                                      phoneNo, bookingId, passengerData)));
                          print(passengerData);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              color: Color(0xff78c6a3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.03),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Lora',
                                color: Colors.black,
                              ),
                            )),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          deleteData();

                        },
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              color: Color(0xedf32020),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.03),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              "Delete your booking",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Lora',
                                color: Colors.white,

                              ),
                            )),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                } else if (snapshot.hasError) {
                  print (snapshot.error);
                  return Text('${snapshot.error}');
                } else if (snapshot.data == null) {
                  return Text("no data found");
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ));
  }
}
